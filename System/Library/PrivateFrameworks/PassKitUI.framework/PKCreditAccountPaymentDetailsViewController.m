@implementation PKCreditAccountPaymentDetailsViewController

- (PKCreditAccountPaymentDetailsViewController)initWithAccount:(id)a3 payment:(id)a4 paymentWebService:(id)a5 overrideViewStyle:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  PKCreditAccountPaymentDetailsViewController *v14;
  PKCreditAccountPaymentDetailsViewController *v15;
  id *p_account;
  id *p_payment;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDate *paymentDueDate;
  void *v22;
  uint64_t v23;
  int v24;
  char v25;
  char v26;
  BOOL v27;
  unint64_t v28;
  BOOL v29;
  _BOOL4 isFailedRecurringPayment;
  BOOL v31;
  char v32;
  char v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSNumberFormatter *currencyFormatter;
  void *v38;
  void *v39;
  NSDateFormatter *v40;
  NSDateFormatter *productDateFormatter;
  NSDateFormatter *v42;
  NSDateFormatter *productDayFormatter;
  void *v44;
  uint64_t v45;
  const __CFString *v46;
  NSDateFormatter *v47;
  NSDateFormatter *localTimeFormatter;
  NSDateFormatter *v49;
  void *v50;
  NSDateFormatter *v51;
  NSDateFormatter *localCancellationDateFormatter;
  NSDateFormatter *v53;
  void *v54;
  void *v55;
  NSDateFormatter *v56;
  NSDateFormatter *productPaymentMonthFormatter;
  NSDateFormatter *v58;
  NSDateFormatter *productPaymentDateFormatter;
  NSNumberFormatter *v60;
  NSNumberFormatter *localizedDayNumberFormatter;
  unint64_t v63;
  id v64;
  void *v65;
  objc_super v66;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v66.receiver = self;
  v66.super_class = (Class)PKCreditAccountPaymentDetailsViewController;
  v14 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v66, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 5);
  v15 = v14;
  if (v14)
  {
    v63 = a6;
    v64 = v13;
    v65 = v12;
    p_account = (id *)&v14->_account;
    objc_storeStrong((id *)&v14->_account, a3);
    v15->_featureIdentifier = objc_msgSend(v11, "feature");
    p_payment = (id *)&v15->_payment;
    objc_storeStrong((id *)&v15->_payment, a4);
    objc_msgSend(v11, "creditDetails");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "accountSummary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "paymentDueDate");
    v20 = objc_claimAutoreleasedReturnValue();
    paymentDueDate = v15->_paymentDueDate;
    v15->_paymentDueDate = (NSDate *)v20;

    -[PKAccountPayment scheduleDetails](v15->_payment, "scheduleDetails");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "preset");

    v24 = -[PKAccountPayment isRecurring](v15->_payment, "isRecurring");
    v25 = -[PKAccountPayment isOnHoldForAccount:](v15->_payment, "isOnHoldForAccount:", *p_account);
    v26 = -[PKAccountPayment isBeforeNextCycleForAccount:](v15->_payment, "isBeforeNextCycleForAccount:", *p_account);
    if (v24)
      v27 = objc_msgSend(*p_payment, "state") == 4;
    else
      v27 = 0;
    v28 = v23 & 0xFFFFFFFFFFFFFFFELL;
    v15->_isFailedRecurringPayment = v27;
    if (objc_msgSend(*p_payment, "willSkipFirstPaymentForAccount:", *p_account))
    {
      v29 = 0;
      v15->_showStatusSection = 1;
    }
    else
    {
      isFailedRecurringPayment = v15->_isFailedRecurringPayment;
      v31 = !isFailedRecurringPayment;
      v15->_showStatusSection = isFailedRecurringPayment;
      v32 = v24 ^ 1;
      if (!v31)
        v32 = 1;
      v29 = (v32 & 1) == 0 && !v15->_isFailedRecurringPayment;
    }
    v15->_showUpcomingPaymentSection = v29;
    if (v28 == 2)
      v33 = v25 & (v26 ^ 1);
    else
      v33 = 0;
    v15->_isPaymentAmountPending = v33;
    objc_storeStrong((id *)&v15->_paymentWebService, a5);
    v15->_viewStyle = v63;
    objc_msgSend(*p_account, "creditDetails");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "currencyCode");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    PKMutableNumberFormatterForCurrencyCode();
    v36 = objc_claimAutoreleasedReturnValue();
    currencyFormatter = v15->_currencyFormatter;
    v15->_currencyFormatter = (NSNumberFormatter *)v36;

    objc_msgSend(v11, "creditDetails");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "productTimeZone");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    productDateFormatter = v15->_productDateFormatter;
    v15->_productDateFormatter = v40;

    -[NSDateFormatter setTimeZone:](v15->_productDateFormatter, "setTimeZone:", v39);
    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v15->_productDateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("M/d/yyyy"));
    v12 = v65;
    if (!objc_msgSend(v65, "isRecurring"))
      goto LABEL_21;
    v42 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    productDayFormatter = v15->_productDayFormatter;
    v15->_productDayFormatter = v42;

    -[NSDateFormatter setTimeZone:](v15->_productDayFormatter, "setTimeZone:", v39);
    objc_msgSend(v65, "scheduleDetails");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "frequency");

    if ((v45 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      v46 = CFSTR("EEEE");
    }
    else
    {
      if (v45 != 6)
      {
LABEL_21:
        v47 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
        localTimeFormatter = v15->_localTimeFormatter;
        v15->_localTimeFormatter = v47;

        v49 = v15->_localTimeFormatter;
        objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDateFormatter setLocale:](v49, "setLocale:", v50);

        -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v15->_localTimeFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("j:mm a z"));
        v51 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
        localCancellationDateFormatter = v15->_localCancellationDateFormatter;
        v15->_localCancellationDateFormatter = v51;

        v53 = v15->_localCancellationDateFormatter;
        objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDateFormatter setLocale:](v53, "setLocale:", v54);

        -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v15->_localCancellationDateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM d"));
        -[PKCreditAccountPaymentDetailsViewController navigationItem](v15, "navigationItem");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "pkui_setupScrollEdgeChromelessAppearance");
        objc_msgSend(v55, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
        v56 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
        productPaymentMonthFormatter = v15->_productPaymentMonthFormatter;
        v15->_productPaymentMonthFormatter = v56;

        -[NSDateFormatter setTimeZone:](v15->_productPaymentMonthFormatter, "setTimeZone:", v39);
        -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v15->_productPaymentMonthFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM"));
        v58 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
        productPaymentDateFormatter = v15->_productPaymentDateFormatter;
        v15->_productPaymentDateFormatter = v58;

        -[NSDateFormatter setTimeZone:](v15->_productPaymentDateFormatter, "setTimeZone:", v39);
        -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v15->_productPaymentDateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM d"));
        v60 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
        localizedDayNumberFormatter = v15->_localizedDayNumberFormatter;
        v15->_localizedDayNumberFormatter = v60;

        -[PKCreditAccountPaymentDetailsViewController _computeRecurringDetailsRowMap](v15, "_computeRecurringDetailsRowMap");
        v13 = v64;
        goto LABEL_22;
      }
      v46 = CFSTR("d");
    }
    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v15->_productDayFormatter, "setLocalizedDateFormatFromTemplate:", v46);
    goto LABEL_21;
  }
LABEL_22:

  return v15;
}

- (PKCreditAccountPaymentDetailsViewController)initWithAccount:(id)a3 payment:(id)a4 paymentWebService:(id)a5 detailViewStyle:(int64_t)a6
{
  return -[PKCreditAccountPaymentDetailsViewController initWithAccount:payment:paymentWebService:overrideViewStyle:](self, "initWithAccount:payment:paymentWebService:overrideViewStyle:", a3, a4, a5, a6 == 2);
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  unint64_t viewStyle;
  void *v15;
  void *v16;
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
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PKCreditAccountPaymentDetailsViewController;
  -[PKSectionTableViewController viewDidLoad](&v28, sel_viewDidLoad);
  -[PKCreditAccountPaymentDetailsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("LinkCellReuseIdentifier"));
  v4 = objc_opt_class();
  -[PKCreditAccountPaymentDetailsViewController _reuseIdentifierForSection:](self, "_reuseIdentifierForSection:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v5);

  v6 = objc_opt_class();
  -[PKCreditAccountPaymentDetailsViewController _reuseIdentifierForSection:](self, "_reuseIdentifierForSection:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v6, v7);

  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v3, "setEstimatedRowHeight:", 50.0);
  -[PKCreditAccountPaymentDetailsViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = PKEqualObjects();

  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonPressed_);
    -[PKCreditAccountPaymentDetailsViewController navigationItem](self, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLeftBarButtonItem:", v12);

  }
  viewStyle = self->_viewStyle;
  if (viewStyle == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v23);

    objc_msgSend(v3, "backgroundView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v24);

LABEL_10:
    goto LABEL_11;
  }
  if (viewStyle == 1)
  {
    PKBridgeAppearanceGetAppearanceSpecifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "backgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v16);

    objc_msgSend(v3, "backgroundView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "backgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v18);

    objc_msgSend(v15, "tableViewSeparatorColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSeparatorColor:", v19);

    objc_msgSend(v15, "tintColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSectionIndexColor:", v20);

    objc_msgSend(v15, "foregroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSectionIndexBackgroundColor:", v21);

    if (objc_msgSend(v15, "hasDarkAppearance"))
      v22 = 2;
    else
      v22 = 0;
    objc_msgSend(v3, "setIndicatorStyle:", v22);
    goto LABEL_10;
  }
LABEL_11:
  -[PKAccountPayment isRecurring](self->_payment, "isRecurring");
  -[PKCreditAccountPaymentDetailsViewController navigationItem](self, "navigationItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTitle:", v26);

  -[PKCreditAccountPaymentDetailsViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67E28]);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)PKCreditAccountPaymentDetailsViewController;
  -[PKCreditAccountPaymentDetailsViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  v6 = *MEMORY[0x1E0D68AA0];
  v7[0] = *MEMORY[0x1E0D68C50];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCreditAccountPaymentDetailsViewController _reportEventForPassIfNecessary:](self, "_reportEventForPassIfNecessary:", v4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)PKCreditAccountPaymentDetailsViewController;
  -[PKCreditAccountPaymentDetailsViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  v6 = *MEMORY[0x1E0D68AA0];
  v7[0] = *MEMORY[0x1E0D68C58];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCreditAccountPaymentDetailsViewController _reportEventForPassIfNecessary:](self, "_reportEventForPassIfNecessary:", v4);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCreditAccountPaymentDetailsViewController;
  -[PKCreditAccountPaymentDetailsViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKCreditAccountPaymentDetailsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCreditAccountPaymentDetailsViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

}

- (void)_computeRecurringDetailsRowMap
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *recurringDetailsRowMap;
  id v12;

  if (-[PKAccountPayment isRecurring](self->_payment, "isRecurring"))
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E3FAD738, v3);

    if (-[PKCreditAccountPaymentDetailsViewController _showRecurringDetailsAmount](self, "_showRecurringDetailsAmount"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E3FAD750, v4);

      v5 = 2;
    }
    else
    {
      v5 = 1;
    }
    v6 = v5 + 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E3FAD768, v7);

    if (-[PKCreditAccountPaymentDetailsViewController _showRecurringDay](self, "_showRecurringDay"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5 + 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E3FAD780, v8);

      v6 = v5 + 2;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E3FAD798, v9);

    v10 = (NSDictionary *)objc_msgSend(v12, "copy");
    recurringDetailsRowMap = self->_recurringDetailsRowMap;
    self->_recurringDetailsRowMap = v10;

  }
}

- (int64_t)_recurringPaymentDetailsRowTypeForRowAtIndex:(int64_t)a3
{
  NSDictionary *recurringDetailsRowMap;
  void *v4;
  void *v5;
  int64_t v6;

  recurringDetailsRowMap = self->_recurringDetailsRowMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](recurringDetailsRowMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "integerValue");
  else
    v6 = 6;

  return v6;
}

- (int64_t)_numberOfRecurringPaymentDetailsRows
{
  uint64_t v3;

  if (!-[PKAccountPayment isRecurring](self->_payment, "isRecurring"))
    return 0;
  if (-[PKCreditAccountPaymentDetailsViewController _showRecurringDetailsAmount](self, "_showRecurringDetailsAmount"))
    v3 = 5;
  else
    v3 = 4;
  return v3
       - (-[PKCreditAccountPaymentDetailsViewController _showRecurringDay](self, "_showRecurringDay") ^ 1);
}

- (BOOL)_showRecurringDetailsAmount
{
  void *v2;
  BOOL v3;

  -[PKAccountPayment scheduleDetails](self->_payment, "scheduleDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preset") == 1;

  return v3;
}

- (BOOL)_showRecurringDay
{
  void *v2;
  uint64_t v3;

  -[PKAccountPayment scheduleDetails](self->_payment, "scheduleDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "frequency");

  return (unint64_t)(v3 - 4) < 3;
}

- (id)_stringForPaymentPreset
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[PKAccountPayment scheduleDetails](self->_payment, "scheduleDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preset");

  if ((unint64_t)(v3 - 1) > 2)
  {
    v4 = 0;
  }
  else
  {
    PKLocalizedFeatureString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_stringForPaymentFrequency
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[PKAccountPayment scheduleDetails](self->_payment, "scheduleDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "frequency");

  if ((unint64_t)(v3 - 4) > 3)
  {
    v4 = 0;
  }
  else
  {
    PKLocalizedFeatureString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_paymentAmountToDisplay
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;

  -[PKAccountPayment scheduleDetails](self->_payment, "scheduleDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preset");

  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_isPaymentAmountPending)
    goto LABEL_2;
  switch(v4)
  {
    case 3:
      objc_msgSend(v7, "remainingStatementBalance");
      v14 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(v7, "remainingMinimumPayment");
      v14 = objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(v7, "adjustedBalance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountPayment currencyAmount](self->_payment, "currencyAmount");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "amount");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v5, "compare:", v10) == -1)
      {
        v13 = v12;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v13;

      if (!v15)
        goto LABEL_2;
LABEL_15:
      -[NSNumberFormatter stringFromNumber:](self->_currencyFormatter, "stringFromNumber:", v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_3;
    default:
      goto LABEL_2;
  }
  v15 = (void *)v14;
  if (v14)
    goto LABEL_15;
LABEL_2:
  PKLocalizedFeatureString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:

  return v8;
}

- (void)_cancelButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PKCreditAccountPaymentDetailsViewController presentingViewController](self, "presentingViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    -[PKCreditAccountPaymentDetailsViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (id)_reuseIdentifierForSection:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Section-%zd"), a3);
}

- (id)_cancellationDateForPayment
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PKAccount creditDetails](self->_account, "creditDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "productTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKAccountPayment paymentDate](self->_payment, "paymentDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v11 = 0;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D48]);
    v8 = (void *)objc_msgSend(v7, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    objc_msgSend(v8, "setTimeZone:", v4);
    objc_msgSend(v8, "components:fromDate:", 28, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateFromComponents:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateByAddingTimeInterval:", -60.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)_hyperlinkFooterView
{
  PKFooterHyperlinkView *hyperlinkFooterView;
  void *v4;
  void *v5;
  void *v6;
  PKFooterHyperlinkView *v7;
  PKFooterHyperlinkView *v8;
  PKFooterHyperlinkView *v9;
  void *v10;
  PKFooterHyperlinkView *v11;
  PKFooterHyperlinkView *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id from;
  id location;

  hyperlinkFooterView = self->_hyperlinkFooterView;
  if (!hyperlinkFooterView)
  {
    PKLocalizedFeatureString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKStringWithValidatedFormat();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self->_account);
    objc_initWeak(&from, self);
    v7 = objc_alloc_init(PKFooterHyperlinkView);
    v8 = self->_hyperlinkFooterView;
    self->_hyperlinkFooterView = v7;

    v9 = self->_hyperlinkFooterView;
    PKAttributedStringByAddingLinkToSubstring(v6, v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFooterHyperlinkView setAttributedText:](v9, "setAttributedText:", v10, v5);

    v11 = self->_hyperlinkFooterView;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__PKCreditAccountPaymentDetailsViewController__hyperlinkFooterView__block_invoke;
    v16[3] = &unk_1E3E706C8;
    objc_copyWeak(&v17, &from);
    objc_copyWeak(&v18, &location);
    v16[4] = self;
    -[PKFooterHyperlinkView setAction:](v11, "setAction:", v16);
    if (self->_viewStyle == 1)
    {
      v12 = self->_hyperlinkFooterView;
      PKBridgeAppearanceGetAppearanceSpecifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "footerHyperlinkColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKFooterHyperlinkView setLinkTextColor:](v12, "setLinkTextColor:", v14);

    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    hyperlinkFooterView = self->_hyperlinkFooterView;
  }
  return hyperlinkFooterView;
}

void __67__PKCreditAccountPaymentDetailsViewController__hyperlinkFooterView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  _QWORD *WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  PKAccountTermsAndConditionsController *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v3 = a2;
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = v6;
  if (v6 && WeakRetained)
  {
    objc_msgSend(v6, "creditDetails");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "termsIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = 4 * (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1120) == 1);
      v11 = [PKAccountTermsAndConditionsController alloc];
      objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[PKAccountTermsAndConditionsController initWithAccount:webService:context:termsIdentifier:](v11, "initWithAccount:webService:context:termsIdentifier:", v7, v12, v10, v9);
      v14 = (void *)WeakRetained[142];
      WeakRetained[142] = v13;

      v15 = (void *)WeakRetained[142];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __67__PKCreditAccountPaymentDetailsViewController__hyperlinkFooterView__block_invoke_2;
      v16[3] = &unk_1E3E62598;
      objc_copyWeak(&v17, v4);
      objc_msgSend(v15, "termsViewControllerWithCompletion:", v16);
      objc_destroyWeak(&v17);
    }

  }
}

void __67__PKCreditAccountPaymentDetailsViewController__hyperlinkFooterView__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      objc_msgSend(WeakRetained, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);

    }
    else if (v9)
    {
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v9, 1, 0);
    }
  }

}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  BOOL result;
  uint64_t v5;

  switch(a3)
  {
    case 0uLL:
      return -[PKAccountPayment isRecurring](self->_payment, "isRecurring") ^ 1;
    case 1uLL:
      return -[PKAccountPayment isRecurring](self->_payment, "isRecurring");
    case 2uLL:
      v5 = 1210;
      return *((_BYTE *)&self->super.super.super.super.super.isa + v5) != 0;
    case 3uLL:
      v5 = 1209;
      return *((_BYTE *)&self->super.super.super.super.super.isa + v5) != 0;
    case 4uLL:
      if (-[PKAccountPayment state](self->_payment, "state") != 1)
        goto LABEL_5;
      result = !self->_isFailedRecurringPayment;
      break;
    default:
LABEL_5:
      result = 0;
      break;
  }
  return result;
}

- (void)_applyDetailViewStylingToCell:(id)a3
{
  id v4;
  unint64_t viewStyle;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  viewStyle = self->_viewStyle;
  if (viewStyle == 2)
  {
    v14 = v4;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v12);
    goto LABEL_5;
  }
  if (viewStyle == 1)
  {
    v14 = v4;
    objc_msgSend(v4, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKBridgeAppearanceGetAppearanceSpecifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v8);

    objc_msgSend(v14, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKBridgeAppearanceGetAppearanceSpecifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "altTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v11);

    PKBridgeAppearanceGetAppearanceSpecifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "foregroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

LABEL_5:
    v4 = v14;
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[PKCreditAccountPaymentDetailsViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;
  BOOL v9;

  v5 = a4;
  v6 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v5, "section"));
  v7 = objc_msgSend(v5, "row");
  switch(v6)
  {
    case 1uLL:
      v8 = -[PKCreditAccountPaymentDetailsViewController _recurringPaymentDetailsRowTypeForRowAtIndex:](self, "_recurringPaymentDetailsRowTypeForRowAtIndex:", v7) == 5;
      break;
    case 3uLL:
      if (self->_cancellingPayment)
        goto LABEL_7;
      v8 = objc_msgSend(v5, "row") == 1;
      break;
    case 4uLL:
      v8 = !self->_cancellingPayment;
      break;
    default:
LABEL_7:
      v9 = 0;
      goto LABEL_12;
  }
  v9 = v8;
LABEL_12:

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;

  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4) == 2)
  {
    PKLocalizedFeatureString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  if (!v5)
    goto LABEL_5;
  if (v5 != 2)
  {
    v8 = 0;
    return v8;
  }
  if (self->_isPaymentAmountPending)
  {
    PKLocalizedFeatureString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    -[PKCreditAccountPaymentDetailsViewController _cancellationDateForPayment](self, "_cancellationDateForPayment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSDateFormatter stringFromDate:](self->_localTimeFormatter, "stringFromDate:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](self->_localCancellationDateFormatter, "stringFromDate:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  unint64_t v5;
  void *v6;

  v5 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  if (v5 == 3)
  {
    if (!self->_isFailedRecurringPayment)
      goto LABEL_3;
LABEL_5:
    -[PKCreditAccountPaymentDetailsViewController _hyperlinkFooterView](self, "_hyperlinkFooterView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  if (v5 == 4)
    goto LABEL_5;
LABEL_3:
  v6 = 0;
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;

  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4))
  {
    case 0uLL:
      result = 3;
      break;
    case 1uLL:
      result = -[PKCreditAccountPaymentDetailsViewController _numberOfRecurringPaymentDetailsRows](self, "_numberOfRecurringPaymentDetailsRows");
      break;
    case 2uLL:
      result = 2;
      break;
    case 3uLL:
      if (self->_isFailedRecurringPayment)
        result = 2;
      else
        result = 1;
      break;
    case 4uLL:
      result = 1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v7, "section")))
  {
    case 0uLL:
      -[PKCreditAccountPaymentDetailsViewController _tableView:paymentDetailsCellForPaymentDetailsRowAtIndexPath:](self, "_tableView:paymentDetailsCellForPaymentDetailsRowAtIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1uLL:
      -[PKCreditAccountPaymentDetailsViewController _tableView:recurringPaymentDetailsCellForPaymentDetailsRowAtIndexPath:](self, "_tableView:recurringPaymentDetailsCellForPaymentDetailsRowAtIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2uLL:
      -[PKCreditAccountPaymentDetailsViewController _tableView:recurringPaymentUpcomingPaymentCellForPaymentDetailsRowAtIndexPath:](self, "_tableView:recurringPaymentUpcomingPaymentCellForPaymentDetailsRowAtIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3uLL:
      -[PKCreditAccountPaymentDetailsViewController _tableView:recurringPaymentStatusCellForRowAtIndexPath:](self, "_tableView:recurringPaymentStatusCellForRowAtIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4uLL:
      -[PKCreditAccountPaymentDetailsViewController _cancelPaymentCellForTableView:](self, "_cancelPaymentCellForTableView:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v9 = (void *)v8;
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (id)_tableView:(id)a3 paymentDetailsCellForPaymentDetailsRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id *v17;
  void *v18;
  uint64_t v19;
  NSNumberFormatter *currencyFormatter;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;

  v6 = a4;
  v7 = a3;
  -[PKCreditAccountPaymentDetailsViewController _reuseIdentifierForSection:](self, "_reuseIdentifierForSection:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKAccountPayment paymentStatusDate](self->_payment, "paymentStatusDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    -[PKAccountPayment paymentDate](self->_payment, "paymentDate");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  v14 = objc_msgSend(v6, "row");
  if (v14 == 2)
  {
    PKLocalizedFeatureString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountPayment fundingSource](self->_payment, "fundingSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "displayDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (id *)MEMORY[0x1E0D67930];
    v19 = 5;
  }
  else
  {
    if (v14 == 1)
    {
      PKLocalizedFeatureString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      currencyFormatter = self->_currencyFormatter;
      -[PKAccountPayment currencyAmount](self->_payment, "currencyAmount");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "amount");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSNumberFormatter stringFromNumber:](currencyFormatter, "stringFromNumber:", v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (id *)MEMORY[0x1E0D678A8];
    }
    else
    {
      if (v14)
      {
        v16 = 0;
        v23 = 0;
        v15 = 0;
        v19 = 4;
        goto LABEL_13;
      }
      PKLocalizedFeatureString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](self->_productDateFormatter, "stringFromDate:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (id *)MEMORY[0x1E0D67AB0];
    }
    v19 = 4;
  }
  v23 = *v17;
LABEL_13:
  objc_msgSend(v9, "textLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setText:", v15);

  objc_msgSend(v9, "detailTextLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setText:", v16);
  objc_msgSend(v25, "setLineBreakMode:", v19);
  -[PKCreditAccountPaymentDetailsViewController _applyDetailViewStylingToCell:](self, "_applyDetailViewStylingToCell:", v9);
  PKAccessibilityIDCellSet(v9, v23);

  return v9;
}

- (id)_tableView:(id)a3 recurringPaymentDetailsCellForPaymentDetailsRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id *v13;
  id v14;
  NSNumberFormatter *currencyFormatter;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  NSDateFormatter *productDayFormatter;
  void *v28;
  id *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSNumberFormatter *localizedDayNumberFormatter;
  NSDateFormatter *v34;

  v6 = a3;
  v7 = a4;
  -[PKCreditAccountPaymentDetailsViewController _reuseIdentifierForSection:](self, "_reuseIdentifierForSection:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "row");
  switch(-[PKCreditAccountPaymentDetailsViewController _recurringPaymentDetailsRowTypeForRowAtIndex:](self, "_recurringPaymentDetailsRowTypeForRowAtIndex:", v10))
  {
    case 0:
      PKLocalizedFeatureString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKCreditAccountPaymentDetailsViewController _stringForPaymentPreset](self, "_stringForPaymentPreset");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id *)MEMORY[0x1E0D68170];
      goto LABEL_6;
    case 1:
      PKLocalizedFeatureString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      currencyFormatter = self->_currencyFormatter;
      -[PKAccountPayment currencyAmount](self->_payment, "currencyAmount");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "amount");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSNumberFormatter stringFromNumber:](currencyFormatter, "stringFromNumber:", v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (id *)MEMORY[0x1E0D678A8];
      goto LABEL_6;
    case 2:
      PKLocalizedFeatureString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKCreditAccountPaymentDetailsViewController _stringForPaymentFrequency](self, "_stringForPaymentFrequency");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id *)MEMORY[0x1E0D67C28];
LABEL_6:
      v14 = *v13;
      goto LABEL_7;
    case 3:
      -[PKAccountPayment scheduleDetails](self->_payment, "scheduleDetails");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "frequency");

      v25 = (id)*MEMORY[0x1E0D67AB8];
      v26 = v25;
      if ((v24 & 0xFFFFFFFFFFFFFFFELL) == 4)
      {
        PKLocalizedFeatureString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        productDayFormatter = self->_productDayFormatter;
        -[PKAccountPayment paymentDate](self->_payment, "paymentDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDateFormatter stringFromDate:](productDayFormatter, "stringFromDate:", v28);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (id *)MEMORY[0x1E0D681E0];
      }
      else
      {
        if (v24 != 6)
        {
          v12 = 0;
          v14 = v25;
          goto LABEL_21;
        }
        PKLocalizedFeatureString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKAccountPayment scheduleDetails](self->_payment, "scheduleDetails");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "scheduledDay");

        if (v32)
        {
          localizedDayNumberFormatter = self->_localizedDayNumberFormatter;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSNumberFormatter stringFromNumber:](localizedDayNumberFormatter, "stringFromNumber:", v28);
        }
        else
        {
          v34 = self->_productDayFormatter;
          -[PKAccountPayment paymentDate](self->_payment, "paymentDate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDateFormatter stringFromDate:](v34, "stringFromDate:", v28);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (id *)MEMORY[0x1E0D67D68];
      }

      v14 = *v29;
      if (v11)
        goto LABEL_7;
LABEL_21:
      PKLocalizedFeatureString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v18 = 4;
LABEL_8:
      objc_msgSend(v9, "textLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setText:", v11);

      objc_msgSend(v9, "detailTextLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setText:", v12);
      objc_msgSend(v20, "setLineBreakMode:", v18);
      -[PKCreditAccountPaymentDetailsViewController _applyDetailViewStylingToCell:](self, "_applyDetailViewStylingToCell:", v9);
      PKAccessibilityIDCellSet(v9, v14);
      v21 = v9;

LABEL_9:
      return v21;
    case 4:
      PKLocalizedFeatureString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountPayment fundingSource](self->_payment, "fundingSource");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "displayDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (id)*MEMORY[0x1E0D67930];
      v18 = 5;
      goto LABEL_8;
    case 5:
      -[PKCreditAccountPaymentDetailsViewController _modifyPaymentCellForTableView:](self, "_modifyPaymentCellForTableView:", v6);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    default:
      v12 = 0;
      v14 = 0;
      v11 = 0;
      goto LABEL_7;
  }
}

- (id)_tableView:(id)a3 recurringPaymentUpcomingPaymentCellForPaymentDetailsRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSDateFormatter *productDateFormatter;
  void *v15;
  id *v16;
  void *v17;
  void *v18;

  v6 = a4;
  v7 = a3;
  -[PKCreditAccountPaymentDetailsViewController _reuseIdentifierForSection:](self, "_reuseIdentifierForSection:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "row");
  if (v10 == 1)
  {
    PKLocalizedFeatureString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCreditAccountPaymentDetailsViewController _paymentAmountToDisplay](self, "_paymentAmountToDisplay");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id *)MEMORY[0x1E0D678A8];
    goto LABEL_5;
  }
  v11 = 0;
  v12 = 0;
  v13 = 0;
  if (!v10)
  {
    PKLocalizedFeatureString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    productDateFormatter = self->_productDateFormatter;
    -[PKAccountPayment paymentDate](self->_payment, "paymentDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter stringFromDate:](productDateFormatter, "stringFromDate:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (id *)MEMORY[0x1E0D67AB0];
LABEL_5:
    v13 = *v16;
  }
  objc_msgSend(v9, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v11);

  objc_msgSend(v9, "detailTextLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v12);

  -[PKCreditAccountPaymentDetailsViewController _applyDetailViewStylingToCell:](self, "_applyDetailViewStylingToCell:", v9);
  PKAccessibilityIDCellSet(v9, v13);

  return v9;
}

- (id)_tableView:(id)a3 recurringPaymentStatusCellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t viewStyle;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  _QWORD v63[3];
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[2];
  _QWORD v68[4];

  v68[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(a4, "row") == 1)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("LinkCellReuseIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCreditAccountPaymentDetailsViewController _configureDismissCell:](self, "_configureDismissCell:", v7);
  }
  else
  {
    -[PKCreditAccountPaymentDetailsViewController _reuseIdentifierForSection:](self, "_reuseIdentifierForSection:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v6;
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKAccountPayment scheduleDetails](self->_payment, "scheduleDetails");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preset");

    viewStyle = self->_viewStyle;
    if (viewStyle == 1)
    {
      PKBridgeAppearanceGetAppearanceSpecifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "foregroundColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v15);

      PKBridgeAppearanceGetAppearanceSpecifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "textColor");
      v13 = objc_claimAutoreleasedReturnValue();

      PKBridgeAppearanceGetAppearanceSpecifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "altTextColor");
      v58 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (viewStyle == 2)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setBackgroundColor:", v12);

      }
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v58 = objc_claimAutoreleasedReturnValue();
    }
    v55 = v9;
    if (self->_isFailedRecurringPayment)
    {
      PKLocalizedFeatureString();
      v18 = objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v62 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v19 = (void *)v13;
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PKAccountPayment paymentDate](self->_payment, "paymentDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](self->_productPaymentMonthFormatter, "stringFromDate:", v19);
      v59 = v13;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      PKStringWithValidatedFormat();
      v18 = objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](self->_productPaymentDateFormatter, "stringFromDate:", v19, v22);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      PKStringWithValidatedFormat();
      v62 = objc_claimAutoreleasedReturnValue();

      v20 = v59;
      v61 = 0;
    }

    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v24, 17.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_alloc(MEMORY[0x1E0CB3778]);
    v28 = *MEMORY[0x1E0DC1140];
    v67[0] = *MEMORY[0x1E0DC1138];
    v27 = v67[0];
    v67[1] = v28;
    v68[0] = v25;
    v68[1] = v20;
    v60 = (void *)v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)v18;
    v54 = (void *)objc_msgSend(v26, "initWithString:attributes:", v18, v29);

    v30 = (uint64_t *)MEMORY[0x1E0DC1178];
    if (v61)
    {
      objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B10]);
      v31 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v31, 17.0);
      v32 = objc_claimAutoreleasedReturnValue();

      v33 = objc_alloc_init(MEMORY[0x1E0DC1288]);
      objc_msgSend(v33, "setParagraphSpacingBefore:", 2.0);
      v34 = objc_alloc(MEMORY[0x1E0C99E08]);
      v35 = *v30;
      v65[0] = v27;
      v65[1] = v35;
      v66[0] = v32;
      v66[1] = v33;
      v65[2] = v28;
      v66[2] = v58;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 3);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v34, "initWithDictionary:", v36);

      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v61, v37);
      objc_msgSend(v54, "appendAttributedString:", v38);

      v24 = (void *)v31;
      v25 = (void *)v32;
      v7 = v55;
      v39 = v54;
    }
    else
    {
      v39 = v54;
      v7 = v55;
    }
    v40 = (void *)v62;
    if (v62)
    {
      objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
      v41 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v41, 15.0);
      v42 = objc_claimAutoreleasedReturnValue();

      v43 = objc_alloc_init(MEMORY[0x1E0DC1288]);
      objc_msgSend(v43, "setParagraphSpacingBefore:", 6.0);
      v44 = objc_alloc(MEMORY[0x1E0C99E08]);
      v45 = *MEMORY[0x1E0DC1178];
      v63[0] = v27;
      v63[1] = v45;
      v64[0] = v42;
      v64[1] = v43;
      v63[2] = v28;
      v46 = (void *)v58;
      v64[2] = v58;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 3);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)objc_msgSend(v44, "initWithDictionary:", v47);

      v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v62, v48);
      objc_msgSend(v39, "appendAttributedString:", v49);

      v24 = (void *)v41;
      v40 = (void *)v62;
      v25 = (void *)v42;
      v6 = v57;
    }
    else
    {
      v6 = v57;
      v46 = (void *)v58;
    }
    objc_msgSend(v7, "textLabel", v53);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setAttributedText:", v39);

    objc_msgSend(v7, "textLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setNumberOfLines:", 0);

    PKAccessibilityIDCellSet(v7, (void *)*MEMORY[0x1E0D680C0]);
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  unint64_t v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v7, 1);
  v6 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v7, "section"));
  switch(v6)
  {
    case 1uLL:
      if (-[PKCreditAccountPaymentDetailsViewController _recurringPaymentDetailsRowTypeForRowAtIndex:](self, "_recurringPaymentDetailsRowTypeForRowAtIndex:", objc_msgSend(v7, "row")) == 5)-[PKCreditAccountPaymentDetailsViewController _modifyPaymentSelected](self, "_modifyPaymentSelected");
      break;
    case 3uLL:
      if (objc_msgSend(v7, "row") == 1)
        -[PKCreditAccountPaymentDetailsViewController _cancelPayment:](self, "_cancelPayment:", 3);
      break;
    case 4uLL:
      -[PKCreditAccountPaymentDetailsViewController _cancelPaymentSelected:](self, "_cancelPaymentSelected:", 4);
      break;
  }

}

- (void)_cancelPaymentSelected:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14[2];
  id location;

  if (!self->_cancellingPayment)
  {
    objc_initWeak(&location, self);
    -[PKAccountPayment isRecurring](self->_payment, "isRecurring");
    PKLocalizedFeatureString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0DC3448];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__PKCreditAccountPaymentDetailsViewController__cancelPaymentSelected___block_invoke;
    v13[3] = &unk_1E3E706F0;
    objc_copyWeak(v14, &location);
    v14[1] = (id)a3;
    objc_msgSend(v10, "actionWithTitle:style:handler:", v7, 2, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v11);

    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v8, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v12);

    -[PKCreditAccountPaymentDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
    objc_destroyWeak(v14);

    objc_destroyWeak(&location);
  }
}

void __70__PKCreditAccountPaymentDetailsViewController__cancelPaymentSelected___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_cancelPayment:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_modifyPaymentSelected
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedString(CFSTR("GENERIC_FEATURE_NOT_IMPLEMENTED_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, 0, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("GENERIC_FEATURE_NOT_IMPLEMENTED_BUTTON"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v7);

  -[PKCreditAccountPaymentDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (id)_cancelPaymentCellForTableView:(id)a3
{
  void *v4;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("LinkCellReuseIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCreditAccountPaymentDetailsViewController _configureDeletePaymentCell:](self, "_configureDeletePaymentCell:", v4);
  PKAccessibilityIDCellSet(v4, (void *)*MEMORY[0x1E0D679C0]);
  return v4;
}

- (id)_modifyPaymentCellForTableView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("LinkCellReuseIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCreditAccountPaymentDetailsViewController _configureLinkCell:](self, "_configureLinkCell:", v4);
  -[PKAccountPayment isRecurring](self->_payment, "isRecurring");
  objc_msgSend(v4, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  PKAccessibilityIDCellSet(v4, (void *)*MEMORY[0x1E0D67D60]);
  return v4;
}

- (void)_configureDeletePaymentCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t viewStyle;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_cancellingPayment)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v5, "startAnimating");
    objc_msgSend(v12, "setAccessoryView:", v5);
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextColor:", v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextColor:", v7);

    objc_msgSend(v12, "setAccessoryView:", 0);
  }
  -[PKAccountPayment isRecurring](self->_payment, "isRecurring");
  PKLocalizedFeatureString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v8);

  viewStyle = self->_viewStyle;
  if (viewStyle == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v10);
    goto LABEL_8;
  }
  if (viewStyle == 1)
  {
    PKBridgeAppearanceGetAppearanceSpecifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "foregroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v11);

LABEL_8:
  }
  PKAccessibilityIDCellSet(v12, (void *)*MEMORY[0x1E0D679C0]);

}

- (void)_configureDismissCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t viewStyle;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_cancellingPayment)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v5, "startAnimating");
    objc_msgSend(v13, "setAccessoryView:", v5);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextColor:", v6);

  }
  else
  {
    -[PKCreditAccountPaymentDetailsViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextColor:", v8);

    objc_msgSend(v13, "setAccessoryView:", 0);
  }
  PKLocalizedFeatureString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v9);

  viewStyle = self->_viewStyle;
  if (viewStyle == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v11);
    goto LABEL_8;
  }
  if (viewStyle == 1)
  {
    PKBridgeAppearanceGetAppearanceSpecifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "foregroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v12);

LABEL_8:
  }
  PKAccessibilityIDCellSet(v13, (void *)*MEMORY[0x1E0D67AF8]);

}

- (void)_configureLinkCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t viewStyle;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCreditAccountPaymentDetailsViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v6);

  objc_msgSend(v10, "setAccessoryView:", 0);
  viewStyle = self->_viewStyle;
  if (viewStyle == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v8);
    goto LABEL_5;
  }
  if (viewStyle == 1)
  {
    PKBridgeAppearanceGetAppearanceSpecifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "foregroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

LABEL_5:
  }

}

- (void)_cancelPayment:(unint64_t)a3
{
  PKAccountPayment *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  PKPaymentWebService *paymentWebService;
  PKAccountPayment *v15;
  id v16;
  _QWORD v17[5];
  PKAccountPayment *v18;
  id v19;
  id v20[2];
  id location;

  if (!self->_cancellingPayment)
  {
    self->_cancellingPayment = 1;
    v5 = self->_payment;
    if (a3 == 4)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 4));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKCreditAccountPaymentDetailsViewController tableView](self, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cellForRowAtIndexPath:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKCreditAccountPaymentDetailsViewController _configureDeletePaymentCell:](self, "_configureDeletePaymentCell:", v8);
    }
    else
    {
      if (a3 != 3)
      {
        v6 = 0;
        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 3));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKCreditAccountPaymentDetailsViewController tableView](self, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKCreditAccountPaymentDetailsViewController _configureDismissCell:](self, "_configureDismissCell:", v8);
    }

LABEL_8:
    -[PKAccountPayment referenceIdentifier](v5, "referenceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0D66970]);
    -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccountIdentifier:", v12);

    -[PKAccount accountBaseURL](self->_account, "accountBaseURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBaseURL:", v13);

    objc_msgSend(v11, "setPaymentReferenceIdentifier:", v10);
    objc_initWeak(&location, self);
    paymentWebService = self->_paymentWebService;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __62__PKCreditAccountPaymentDetailsViewController__cancelPayment___block_invoke;
    v17[3] = &unk_1E3E70768;
    v17[4] = self;
    objc_copyWeak(v20, &location);
    v15 = v5;
    v18 = v15;
    v16 = v6;
    v19 = v16;
    v20[1] = (id)a3;
    -[PKPaymentWebService cancelPaymentWithRequest:completion:](paymentWebService, "cancelPaymentWithRequest:completion:", v11, v17);

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);

  }
}

void __62__PKCreditAccountPaymentDetailsViewController__cancelPayment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19[2];

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__PKCreditAccountPaymentDetailsViewController__cancelPayment___block_invoke_2;
  v14[3] = &unk_1E3E70740;
  objc_copyWeak(v19, (id *)(a1 + 56));
  v9 = v5;
  v15 = v9;
  v10 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 32);
  v16 = v10;
  v17 = v11;
  v12 = *(id *)(a1 + 48);
  v13 = *(void **)(a1 + 64);
  v18 = v12;
  v19[1] = v13;
  objc_msgSend(v7, "updateScheduledPaymentsWithAccount:completion:", v8, v14);

  objc_destroyWeak(v19);
}

void __62__PKCreditAccountPaymentDetailsViewController__cancelPayment___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17[2];

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKCreditAccountPaymentDetailsViewController__cancelPayment___block_invoke_3;
  block[3] = &unk_1E3E70718;
  objc_copyWeak(v17, (id *)(a1 + 64));
  v12 = *(id *)(a1 + 32);
  v13 = v4;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v14 = v5;
  v15 = v6;
  v8 = v7;
  v9 = *(void **)(a1 + 72);
  v16 = v8;
  v17[1] = v9;
  v10 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v17);
}

void __62__PKCreditAccountPaymentDetailsViewController__cancelPayment___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  id *v10;
  id v11;
  char v12;
  id v13;
  id *v14;
  id v15;
  id *v16;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v16 = WeakRetained;
    if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
    {
      v10 = WeakRetained + 153;
      v11 = objc_loadWeakRetained(WeakRetained + 153);
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 48), "setState:", 3);
        v13 = objc_loadWeakRetained(v10);
        objc_msgSend(v13, "paymentDetailsViewController:didCancelPayment:", v16, *(_QWORD *)(a1 + 48));

      }
      objc_msgSend(v16, "navigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "topViewController");
      v8 = (id *)objc_claimAutoreleasedReturnValue();
      if (v8 == v16
        || (objc_msgSend(v16, "parentViewController"),
            v14 = (id *)objc_claimAutoreleasedReturnValue(),
            v14,
            v8 == v14))
      {
        v15 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 56) + 1208) = 0;
      objc_msgSend(WeakRetained, "tableView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 64));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = *(_QWORD *)(a1 + 80);
      if (v5 == 4)
      {
        objc_msgSend(v16, "tableView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 64));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "_configureDeletePaymentCell:", v7);
      }
      else if (v5 == 3)
      {
        objc_msgSend(v16, "_configureDismissCell:", v4);
      }
      +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(_QWORD *)(a1 + 40), v16[137], 0, 0);
      v8 = (id *)objc_claimAutoreleasedReturnValue();
      v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);
      objc_msgSend(v16, "presentViewController:animated:completion:", v9, 1, 0);

    }
    WeakRetained = v16;
  }

}

- (void)_reportEventForPassIfNecessary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0D66A58], "subjectToReportDashboardAnalyticsForAccount:", self->_account);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && v4)
  {
    v5 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v5, "setObject:forKey:", *MEMORY[0x1E0D689F0], *MEMORY[0x1E0D68F50]);
    v6 = (void *)MEMORY[0x1E0D66A58];
    v7 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v6, "subject:sendEvent:", v4, v7);

  }
}

- (PKCreditAccountPaymentDetailsViewControllerDelegate)delegate
{
  return (PKCreditAccountPaymentDetailsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hyperlinkFooterView, 0);
  objc_storeStrong((id *)&self->_productPaymentDateFormatter, 0);
  objc_storeStrong((id *)&self->_productPaymentMonthFormatter, 0);
  objc_storeStrong((id *)&self->_localCancellationDateFormatter, 0);
  objc_storeStrong((id *)&self->_localTimeFormatter, 0);
  objc_storeStrong((id *)&self->_productDayFormatter, 0);
  objc_storeStrong((id *)&self->_productDateFormatter, 0);
  objc_storeStrong((id *)&self->_localizedDayNumberFormatter, 0);
  objc_storeStrong((id *)&self->_currencyFormatter, 0);
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_recurringDetailsRowMap, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_paymentDueDate, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
