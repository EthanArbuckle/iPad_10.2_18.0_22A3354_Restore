@implementation PKAccountBillPaymentPayLaterViewController

- (PKAccountBillPaymentPayLaterViewController)initWithAccount:(id)a3 accountUserCollection:(id)a4 billPaymentController:(id)a5 transactionSource:(id)a6 suggestionList:(id)a7 selectedAmount:(id)a8
{
  id v15;
  id v16;
  id v17;
  PKAccountBillPaymentPayLaterViewController *v18;
  PKAccountBillPaymentPayLaterViewController *v19;
  void *v20;
  uint64_t v21;
  NSDecimalNumber *remainingStatementBalance;
  void *v23;
  void *v24;
  uint64_t v25;
  NSDecimalNumber *apr;
  id v27;
  uint64_t v28;
  uint64_t v29;
  NSCalendar *productCalendar;
  NSCalendar *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSCalendar *localCalendar;
  NSDateFormatter *v36;
  NSDateFormatter *dateFormatterDayOfWeek;
  NSDateFormatter *v38;
  void *v39;
  void *v40;
  NSDateFormatter *v41;
  void *v42;
  NSDateFormatter *v43;
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v45;
  void *v46;
  NSDateFormatter *v47;
  void *v48;
  void *v49;
  id v50;
  NSCalendar *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSDate *minDate;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  NSDate *maxDate;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  objc_super v71;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v70 = a6;
  v69 = a7;
  v68 = a8;
  v71.receiver = self;
  v71.super_class = (Class)PKAccountBillPaymentPayLaterViewController;
  v18 = -[PKAccountBillPaymentPayLaterViewController initWithNibName:bundle:](&v71, sel_initWithNibName_bundle_, 0, 0);
  v19 = v18;
  if (v18)
  {
    v66 = v17;
    v67 = v16;
    objc_storeStrong((id *)&v18->_account, a3);
    objc_storeStrong((id *)&v19->_accountUserCollection, a4);
    objc_storeStrong((id *)&v19->_transactionSource, a6);
    objc_storeStrong((id *)&v19->_billPaymentCoordinator, a5);
    -[PKAccountBillPaymentController setDelegate:](v19->_billPaymentCoordinator, "setDelegate:", v19);
    objc_storeStrong((id *)&v19->_suggestionList, a7);
    objc_storeStrong((id *)&v19->_selectedAmount, a8);
    -[PKAccount creditDetails](v19->_account, "creditDetails");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "accountSummary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "remainingStatementBalance");
    v21 = objc_claimAutoreleasedReturnValue();
    remainingStatementBalance = v19->_remainingStatementBalance;
    v19->_remainingStatementBalance = (NSDecimalNumber *)v21;

    objc_msgSend(v15, "creditDetails");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "rates");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "aprForPurchases");
    v25 = objc_claimAutoreleasedReturnValue();
    apr = v19->_apr;
    v19->_apr = (NSDecimalNumber *)v25;

    v19->_currentPickerViewRow[0] = -1;
    v27 = objc_alloc(MEMORY[0x1E0C99D48]);
    v28 = *MEMORY[0x1E0C996C8];
    v29 = objc_msgSend(v27, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    productCalendar = v19->_productCalendar;
    v19->_productCalendar = (NSCalendar *)v29;

    v31 = v19->_productCalendar;
    objc_msgSend(v15, "creditDetails");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "productTimeZone");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setTimeZone:](v31, "setTimeZone:", v33);

    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCalendarIdentifier:", v28);
    localCalendar = v19->_localCalendar;
    v19->_localCalendar = (NSCalendar *)v34;

    v36 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatterDayOfWeek = v19->_dateFormatterDayOfWeek;
    v19->_dateFormatterDayOfWeek = v36;

    v38 = v19->_dateFormatterDayOfWeek;
    objc_msgSend(v15, "creditDetails");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "productTimeZone");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v38, "setTimeZone:", v40);

    v41 = v19->_dateFormatterDayOfWeek;
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v41, "setLocale:", v42);

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v19->_dateFormatterDayOfWeek, "setLocalizedDateFormatFromTemplate:", CFSTR("EEEE, MMMM d"));
    -[NSDateFormatter setFormattingContext:](v19->_dateFormatterDayOfWeek, "setFormattingContext:", 2);
    v43 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v19->_dateFormatter;
    v19->_dateFormatter = v43;

    v45 = v19->_dateFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v45, "setLocale:", v46);

    v47 = v19->_dateFormatter;
    objc_msgSend(v15, "creditDetails");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "productTimeZone");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v47, "setTimeZone:", v49);

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v19->_dateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM d"));
    v50 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v50, "setDay:", 1);
    v51 = v19->_productCalendar;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar dateByAddingComponents:toDate:options:](v51, "dateByAddingComponents:toDate:options:", v50, v52, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKAccountBillPaymentPayLaterViewController _stripTimeFromDate:](v19, "_stripTimeFromDate:", v53);
    v54 = objc_claimAutoreleasedReturnValue();
    minDate = v19->_minDate;
    v19->_minDate = (NSDate *)v54;

    objc_msgSend(v20, "paymentDueDate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v56 || objc_msgSend(v15, "isClosedAndChargedOff"))
    {
      PKEndOfNextMonth();
      v57 = objc_claimAutoreleasedReturnValue();

      v56 = (void *)v57;
    }
    -[PKAccountBillPaymentPayLaterViewController _stripTimeFromDate:](v19, "_stripTimeFromDate:", v56);
    v58 = objc_claimAutoreleasedReturnValue();
    maxDate = v19->_maxDate;
    v19->_maxDate = (NSDate *)v58;

    if (!v19->_maxDate)
      objc_storeStrong((id *)&v19->_maxDate, v19->_minDate);
    -[NSCalendar components:fromDate:toDate:options:](v19->_productCalendar, "components:fromDate:toDate:options:", 16, v19->_minDate);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v19->_numDays = objc_msgSend(v60, "day") + 1;

    -[PKAccountBillPaymentPayLaterViewController navigationItem](v19, "navigationItem");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v62, "configureWithTransparentBackground");
    objc_msgSend(v61, "setStandardAppearance:", v62);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "addObserver:selector:name:object:", v19, sel__accountDidChange_, *MEMORY[0x1E0D68290], 0);

    v17 = v66;
    v16 = v67;
  }

  return v19;
}

- (void)dealloc
{
  CLInUseAssertion *CLInUse;
  CLInUseAssertion *v4;
  objc_super v5;

  CLInUse = self->_CLInUse;
  if (CLInUse)
  {
    -[CLInUseAssertion invalidate](CLInUse, "invalidate");
    v4 = self->_CLInUse;
    self->_CLInUse = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)PKAccountBillPaymentPayLaterViewController;
  -[PKAccountBillPaymentPayLaterViewController dealloc](&v5, sel_dealloc);
}

- (void)loadView
{
  uint64_t v3;
  uint64_t v4;
  UILabel *v5;
  UILabel *payLaterTitleLabel;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  UILabel *whenToPayQuestionLabel;
  UILabel *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  void *v18;
  void *v19;
  _PKContinuousPickerView *v20;
  UIPickerView *datePicker;
  PKAccountBillPaymentPayInterestDescriptionView *v22;
  PKAccountBillPaymentPayInterestDescriptionView *interestDescriptionView;
  void *v24;
  void *v25;
  void *v26;
  PKLegacyButtonInterface *v27;
  PKLegacyButtonInterface *payOnButton;
  PKLegacyButtonInterface *v29;
  void *v30;
  PKLegacyButtonInterface *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)PKAccountBillPaymentPayLaterViewController;
  -[PKAccountBillPaymentPayLaterViewController loadView](&v41, sel_loadView);
  -[PKAccount feature](self->_account, "feature");
  v3 = PKUIGetMinScreenWidthType();
  PKLocalizedFeatureString();
  v4 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v4;
  if (v3 || PKIsVision())
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    payLaterTitleLabel = self->_payLaterTitleLabel;
    self->_payLaterTitleLabel = v5;

    -[UILabel setTextAlignment:](self->_payLaterTitleLabel, "setTextAlignment:", 1);
    -[UILabel setText:](self->_payLaterTitleLabel, "setText:", v4);
    v7 = self->_payLaterTitleLabel;
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B48], (void *)*MEMORY[0x1E0DC48F8], 32770, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    -[UILabel setNumberOfLines:](self->_payLaterTitleLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](self->_payLaterTitleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  }
  else
  {
    -[PKAccountBillPaymentPayLaterViewController setTitle:](self, "setTitle:", v4);
  }
  v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  whenToPayQuestionLabel = self->_whenToPayQuestionLabel;
  self->_whenToPayQuestionLabel = v9;

  -[UILabel setTextAlignment:](self->_whenToPayQuestionLabel, "setTextAlignment:", 1);
  v11 = self->_whenToPayQuestionLabel;
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currencyCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKFormattedCurrencyStringFromNumber();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v11, "setText:", v15, v14);

  v16 = self->_whenToPayQuestionLabel;
  v17 = (void *)*MEMORY[0x1E0DC4A88];
  v18 = (void *)*MEMORY[0x1E0DC48D0];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48D0], 0x8000, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v16, "setFont:", v19);

  -[UILabel setNumberOfLines:](self->_whenToPayQuestionLabel, "setNumberOfLines:", 0);
  -[UILabel setAccessibilityIdentifier:](self->_whenToPayQuestionLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
  v20 = objc_alloc_init(_PKContinuousPickerView);
  datePicker = self->_datePicker;
  self->_datePicker = &v20->super;

  -[UIPickerView setDelegate:](self->_datePicker, "setDelegate:", self);
  -[UIPickerView setDataSource:](self->_datePicker, "setDataSource:", self);
  v22 = -[PKAccountBillPaymentPayInterestDescriptionView initWithAccount:]([PKAccountBillPaymentPayInterestDescriptionView alloc], "initWithAccount:", self->_account);
  interestDescriptionView = self->_interestDescriptionView;
  self->_interestDescriptionView = v22;

  -[PKAccount creditDetails](self->_account, "creditDetails");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "accountSummary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "paymentDueDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PKAccount showBillPaymentInterest](self->_account, "showBillPaymentInterest"))
    -[PKAccountBillPaymentPayInterestDescriptionView setInterestChargeDate:](self->_interestDescriptionView, "setInterestChargeDate:", v26);
  -[PKAccountBillPaymentPayInterestDescriptionView setDelegate:](self->_interestDescriptionView, "setDelegate:", self);
  PKCreateLargeSolidButton();
  v27 = (PKLegacyButtonInterface *)objc_claimAutoreleasedReturnValue();
  payOnButton = self->_payOnButton;
  self->_payOnButton = v27;

  v29 = self->_payOnButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKLegacyButtonInterface setTintColor:](v29, "setTintColor:", v30);

  v31 = self->_payOnButton;
  +[PKAccountBillPaymentViewController backgroundColor](PKAccountBillPaymentViewController, "backgroundColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKLegacyButtonInterface updateTitleColorWithColor:](v31, "updateTitleColorWithColor:", v32);

  -[PKLegacyButtonInterface titleLabel](self->_payOnButton, "titleLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign(v17, v18, 2, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "pk_fixedWidthFont");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFont:", v35);

  -[PKLegacyButtonInterface setContentEdgeInsets:](self->_payOnButton, "setContentEdgeInsets:", 0.0, 14.0, 0.0, 14.0);
  -[PKLegacyButtonInterface titleLabel](self->_payOnButton, "titleLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setAdjustsFontSizeToFitWidth:", 1);

  -[PKLegacyButtonInterface addTarget:action:forControlEvents:](self->_payOnButton, "addTarget:action:forControlEvents:", self, sel__payOnButtonTapped_, 64);
  -[PKLegacyButtonInterface setAccessibilityIdentifier:](self->_payOnButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67EE8]);
  -[PKAccountBillPaymentPayLaterViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKAccountBillPaymentViewController backgroundColor](PKAccountBillPaymentViewController, "backgroundColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setBackgroundColor:", v38);

  objc_msgSend(v37, "addSubview:", self->_payLaterTitleLabel);
  objc_msgSend(v37, "addSubview:", self->_whenToPayQuestionLabel);
  objc_msgSend(v37, "addSubview:", self->_datePicker);
  objc_msgSend(v37, "addSubview:", self->_payOnButton);
  objc_msgSend(v37, "addSubview:", self->_interestDescriptionView);
  -[PKAccountBillPaymentPayLaterViewController _updateLabelText](self, "_updateLabelText");
  -[PKAccountBillPaymentPayLaterViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67E10]);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double MaxY;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  CGFloat rect;
  objc_super v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v53.receiver = self;
  v53.super_class = (Class)PKAccountBillPaymentPayLaterViewController;
  -[PKAccountBillPaymentPayLaterViewController viewWillLayoutSubviews](&v53, sel_viewWillLayoutSubviews);
  -[PKAccountBillPaymentPayLaterViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PKAccountBillPaymentPayLaterViewController _sideMargin](self, "_sideMargin");
  v13 = v12;
  objc_msgSend(v3, "safeAreaInsets");
  v15 = v14;
  objc_msgSend(v3, "safeAreaInsets");
  v54.origin.x = v13 + v5;
  v54.origin.y = v7 + v15;
  v16 = v9 - (v13 + v13);
  v54.size.height = v11 - (v15 + v17);
  v49 = v13 + v5;
  v50 = v7 + v15;
  v54.size.width = v16;
  rect = v54.size.height;
  CGRectGetMinY(v54);
  v51 = v9;
  if (self->_payLaterTitleLabel)
  {
    PKUIGetMinScreenWidthType();
    -[UILabel sizeThatFits:](self->_payLaterTitleLabel, "sizeThatFits:", v16, 3.40282347e38);
    PKRectCenteredXInRect();
    v19 = v18;
    v21 = v20;
    v22 = v5;
    v24 = v23;
    v26 = v25;
    -[UILabel setFrame:](self->_payLaterTitleLabel, "setFrame:");
    v55.origin.x = v19;
    v55.origin.y = v21;
    v55.size.width = v24;
    v5 = v22;
    v55.size.height = v26;
    MaxY = CGRectGetMaxY(v55);
  }
  else
  {
    MaxY = 20.0;
  }
  v44 = v5;
  -[UILabel frame](self->_whenToPayQuestionLabel, "frame", MaxY);
  -[UILabel sizeThatFits:](self->_whenToPayQuestionLabel, "sizeThatFits:", v16, 3.40282347e38);
  PKRectCenteredXInRect();
  v47 = v29;
  v48 = v28;
  v45 = v31;
  v46 = v30;
  -[UILabel setFrame:](self->_whenToPayQuestionLabel, "setFrame:");
  -[PKLegacyButtonInterface frame](self->_payOnButton, "frame");
  -[PKLegacyButtonInterface sizeThatFits:](self->_payOnButton, "sizeThatFits:", v16, 3.40282347e38);
  if (v32 >= 50.0)
    v33 = v32;
  else
    v33 = 50.0;
  v56.origin.x = v49;
  v56.origin.y = v50;
  v56.size.width = v16;
  v56.size.height = rect;
  v34 = CGRectGetMaxY(v56) - v33 + -50.0 + -5.0;
  -[PKLegacyButtonInterface setFrame:](self->_payOnButton, "setFrame:", v49, v34, v16, v33);
  -[PKAccountBillPaymentPayInterestDescriptionView frame](self->_interestDescriptionView, "frame");
  -[PKAccountBillPaymentPayInterestDescriptionView sizeThatFits:](self->_interestDescriptionView, "sizeThatFits:", v16, 3.40282347e38);
  v57.origin.x = v49;
  v57.origin.y = v34;
  v57.size.width = v16;
  v57.size.height = v33;
  CGRectGetMinY(v57);
  -[PKAccountBillPaymentPayLaterViewController _payButtonTopPadding](self, "_payButtonTopPadding");
  PKRectCenteredXInRect();
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  -[PKAccountBillPaymentPayInterestDescriptionView setFrame:](self->_interestDescriptionView, "setFrame:");
  -[UIPickerView frame](self->_datePicker, "frame");
  v58.origin.y = v47;
  v58.origin.x = v48;
  v58.size.height = v45;
  v58.size.width = v46;
  v43 = CGRectGetMaxY(v58) + 20.0;
  v59.origin.x = v36;
  v59.origin.y = v38;
  v59.size.width = v40;
  v59.size.height = v42;
  -[UIPickerView setFrame:](self->_datePicker, "setFrame:", v44, v43, v51, CGRectGetMinY(v59) - v43);

}

- (void)viewWillDisappear:(BOOL)a3
{
  CLInUseAssertion *CLInUse;
  CLInUseAssertion *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAccountBillPaymentPayLaterViewController;
  -[PKAccountBillPaymentPayLaterViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  CLInUse = self->_CLInUse;
  if (CLInUse)
  {
    -[CLInUseAssertion invalidate](CLInUse, "invalidate");
    v5 = self->_CLInUse;
    self->_CLInUse = 0;

  }
}

- (void)accountBillPaymentController:(id)a3 hasChangedState:(unint64_t)a4 error:(id)a5 updatedAccount:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  PKAccountBillPaymentConfirmationViewController *v18;
  PKAccountBillPaymentConfirmationViewController *v19;
  _QWORD v20[4];
  PKAccountBillPaymentConfirmationViewController *v21;
  id v22;
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  self->_performingAction = 0;
  switch(a4)
  {
    case 2uLL:
      -[PKAccountBillPaymentPayLaterViewController _setEnabled:](self, "_setEnabled:", 1);
      break;
    case 1uLL:
      if (v12)
        objc_storeStrong((id *)&self->_account, a6);
      WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[PKAccountBillPaymentController payments](self->_billPaymentCoordinator, "payments");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "accountBillPaymentViewController:didSchedulePayments:", self, v15);

      }
      -[PKAccountBillPaymentController payments](self->_billPaymentCoordinator, "payments");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "count"))
      {
        -[PKTransactionSource paymentPass](self->_transactionSource, "paymentPass");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[PKAccountBillPaymentConfirmationViewController initWithAccount:paymentPass:scheduledPayments:]([PKAccountBillPaymentConfirmationViewController alloc], "initWithAccount:paymentPass:scheduledPayments:", self->_account, v17, v16);
        objc_initWeak(&location, self);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __112__PKAccountBillPaymentPayLaterViewController_accountBillPaymentController_hasChangedState_error_updatedAccount___block_invoke;
        v20[3] = &unk_1E3E62FA0;
        objc_copyWeak(&v22, &location);
        v19 = v18;
        v21 = v19;
        -[PKAccountBillPaymentConfirmationViewController preflightWithCompletion:](v19, "preflightWithCompletion:", v20);

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);

      }
      else
      {
        -[PKAccountBillPaymentPayLaterViewController _dismissViewControllerWithSuccess:](self, "_dismissViewControllerWithSuccess:", 1);
      }

      break;
    case 0uLL:
      -[PKAccountBillPaymentPayLaterViewController _presentAlertControllerForError:](self, "_presentAlertControllerForError:", v11);
      break;
  }

}

void __112__PKAccountBillPaymentPayLaterViewController_accountBillPaymentController_hasChangedState_error_updatedAccount___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __112__PKAccountBillPaymentPayLaterViewController_accountBillPaymentController_hasChangedState_error_updatedAccount___block_invoke_2;
  v2[3] = &unk_1E3E61B68;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

void __112__PKAccountBillPaymentPayLaterViewController_accountBillPaymentController_hasChangedState_error_updatedAccount___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pushViewController:animated:", *(_QWORD *)(a1 + 32), 1);

    WeakRetained = v4;
  }

}

- (id)presentationSceneIdentifierForAccountBillPaymentController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKAccountBillPaymentPayLaterViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addBankAccountInformationViewController:(id)a3 didAddFundingSource:(id)a4
{
  PKAccountBillPaymentController *billPaymentCoordinator;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  billPaymentCoordinator = self->_billPaymentCoordinator;
  v8 = a4;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a4;
  objc_msgSend(v5, "arrayWithObjects:count:", &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountBillPaymentController setFundingSources:](billPaymentCoordinator, "setFundingSources:", v7, v8, v9);

}

- (void)addBankAccountInformationViewControllerDidFinish:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __95__PKAccountBillPaymentPayLaterViewController_addBankAccountInformationViewControllerDidFinish___block_invoke;
  v3[3] = &unk_1E3E612E8;
  v3[4] = self;
  -[PKAccountBillPaymentPayLaterViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
}

void __95__PKAccountBillPaymentPayLaterViewController_addBankAccountInformationViewControllerDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1168);
  *(_QWORD *)(v2 + 1168) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_dateForRow:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "selectedRowInComponent:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 1000);
  v7 = *(_QWORD *)(v5 + 1080);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __95__PKAccountBillPaymentPayLaterViewController_addBankAccountInformationViewControllerDidFinish___block_invoke_2;
  v8[3] = &unk_1E3E65130;
  v8[4] = v5;
  objc_msgSend(v6, "canPerformBillPaymentWithAmount:scheduledDate:completion:", v7, v4, v8);

}

void __95__PKAccountBillPaymentPayLaterViewController_addBankAccountInformationViewControllerDidFinish___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = v5;
    objc_msgSend(*(id *)(a1 + 32), "_payOnButtonTapped:", 0);
LABEL_5:
    v6 = v7;
    goto LABEL_6;
  }
  if (v5)
  {
    v7 = v5;
    objc_msgSend(*(id *)(a1 + 32), "_presentAlertControllerForError:", v5);
    goto LABEL_5;
  }
LABEL_6:

}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  return -[PKAccountBillPaymentPayLaterViewController _dateStringForRow:formatter:](self, "_dateStringForRow:formatter:", a4, self->_dateFormatterDayOfWeek, a5);
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  if (self->_currentPickerViewRow[a5] != a4)
  {
    self->_currentPickerViewRow[a5] = a4;
    -[PKAccountBillPaymentPayLaterViewController _updateLabelText](self, "_updateLabelText", a3);
  }
}

- (void)billPaymentPayInterestDescriptionViewHasTappedLearnMore:(id)a3
{
  PKNavigationController *v4;
  void *v5;
  PKAccountBillPaymentLearnMoreViewController *v6;

  v6 = -[PKAccountBillPaymentLearnMoreViewController initWithAccount:]([PKAccountBillPaymentLearnMoreViewController alloc], "initWithAccount:", self->_account);
  v4 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v6);
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    -[PKNavigationController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 3);
    -[PKAccountBillPaymentPayLaterViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentViewController:withTransition:completion:", v4, 8, 0);
  }
  else
  {
    -[PKAccountBillPaymentPayLaterViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);
  }

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return self->_numDays;
}

- (void)_performBillPaymentWithAmount:(id)a3 scheduledDate:(id)a4 billPaymentSuggestedAmountDataEvent:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  CLInUseAssertion *v13;
  CLInUseAssertion *CLInUse;
  NSObject *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_CLInUse)
  {
    v11 = (void *)MEMORY[0x1E0C9E3A8];
    PKPassKitCoreBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (CLInUseAssertion *)objc_msgSend(v11, "newAssertionForBundle:withReason:", v12, CFSTR("Perform Account Service Future Payment"));
    CLInUse = self->_CLInUse;
    self->_CLInUse = v13;

  }
  if (self->_performingAction)
  {
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[PKAccountBillPaymentPayLaterViewController _performBillPaymentWithAmount:scheduledDate:billPaymentSuggeste"
            "dAmountDataEvent:]";
      _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "%s: Cannot Present - already performing action", (uint8_t *)&v16, 0xCu);
    }

  }
  else
  {
    self->_performingAction = 1;
    -[PKAccountBillPaymentPayLaterViewController _setEnabled:](self, "_setEnabled:", 0);
    -[PKAccountBillPaymentController performBillPaymentActionWithAmount:scheduledDate:billPaymentSuggestedAmountDataEvent:](self->_billPaymentCoordinator, "performBillPaymentActionWithAmount:scheduledDate:billPaymentSuggestedAmountDataEvent:", v8, v9, v10);
  }

}

- (void)_accountDidChange:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (self->_account)
  {
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __64__PKAccountBillPaymentPayLaterViewController__accountDidChange___block_invoke;
    v6[3] = &unk_1E3E61D40;
    v6[4] = self;
    objc_msgSend(v4, "accountWithIdentifier:completion:", v5, v6);

  }
}

void __64__PKAccountBillPaymentPayLaterViewController__accountDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PKAccountBillPaymentPayLaterViewController__accountDidChange___block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __64__PKAccountBillPaymentPayLaterViewController__accountDidChange___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 976), *(id *)(a1 + 40));
}

- (void)_payOnButtonTapped:(id)a3
{
  void *v4;
  PKAccountBillPaymentController *billPaymentCoordinator;
  NSDecimalNumber *selectedAmount;
  id v7;
  _QWORD v8[5];
  id v9;

  -[PKAccountBillPaymentPayLaterViewController _setEnabled:](self, "_setEnabled:", 0);
  -[PKAccountBillPaymentPayLaterViewController _dateForRow:](self, "_dateForRow:", -[UIPickerView selectedRowInComponent:](self->_datePicker, "selectedRowInComponent:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  billPaymentCoordinator = self->_billPaymentCoordinator;
  selectedAmount = self->_selectedAmount;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PKAccountBillPaymentPayLaterViewController__payOnButtonTapped___block_invoke;
  v8[3] = &unk_1E3E64E38;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[PKAccountBillPaymentController canPerformBillPaymentWithAmount:scheduledDate:completion:](billPaymentCoordinator, "canPerformBillPaymentWithAmount:scheduledDate:completion:", selectedAmount, v7, v8);

}

void __65__PKAccountBillPaymentPayLaterViewController__payOnButtonTapped___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v5 = a3;
  v14 = v5;
  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "accountIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "creditDetails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountSummary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentStatement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "billPaymentSelectedSuggestedAmountDataEventForAmount:accountIdentifier:statementIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080), v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_performBillPaymentWithAmount:scheduledDate:billPaymentSuggestedAmountDataEvent:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080), *(_QWORD *)(a1 + 40), v11);

  }
  else
  {
    v12 = v5;
    v13 = *(void **)(a1 + 32);
    if (v12)
      objc_msgSend(v13, "_presentAlertControllerForError:", v12);
    else
      objc_msgSend(v13, "_presentAddBankAccount");
    objc_msgSend(*(id *)(a1 + 32), "_setEnabled:", 1);
  }

}

- (id)_interestForSelectedDate:(id)a3
{
  id v4;
  PKCompoundInterestCalculator *interestCalculator;
  void *v6;
  PKCompoundInterestCalculator *v7;
  PKCompoundInterestCalculator *v8;
  void *v9;
  PKAccountUserCollection *accountUserCollection;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];

  v4 = a3;
  interestCalculator = self->_interestCalculator;
  if (!interestCalculator)
  {
    objc_msgSend(MEMORY[0x1E0D66C40], "configurationWithCreditAccount:", self->_account);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCalculationMethod:", 1);
    v7 = (PKCompoundInterestCalculator *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C38]), "initWithConfiguration:", v6);
    v8 = self->_interestCalculator;
    self->_interestCalculator = v7;

    -[PKTransactionSource transactionSourceIdentifiers](self->_transactionSource, "transactionSourceIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    accountUserCollection = self->_accountUserCollection;
    if (accountUserCollection)
    {
      -[PKAccountUserCollection transactionSourceIdentifiers](accountUserCollection, "transactionSourceIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v9, "setByAddingObjectsFromSet:", v11);
        v12 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v12;
      }

    }
    v13 = objc_alloc_init(MEMORY[0x1E0D672B0]);
    objc_msgSend(v6, "periodStartDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "periodEndDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = 3221225472;
    v19[2] = __71__PKAccountBillPaymentPayLaterViewController__interestForSelectedDate___block_invoke;
    v19[3] = &unk_1E3E65238;
    v19[4] = self;
    v19[0] = MEMORY[0x1E0C809B0];
    objc_msgSend(v13, "approvedTransactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:limit:completion:", v9, 0, 1, v14, v15, 0, v19);

    interestCalculator = self->_interestCalculator;
  }
  -[PKCompoundInterestCalculator configuration](interestCalculator, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "updateWithCreditAccount:", self->_account);

  -[PKCompoundInterestCalculator compoundInterestForPaymentOfAmount:onDate:](self->_interestCalculator, "compoundInterestForPaymentOfAmount:onDate:", self->_selectedAmount, v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __71__PKAccountBillPaymentPayLaterViewController__interestForSelectedDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__PKAccountBillPaymentPayLaterViewController__interestForSelectedDate___block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __71__PKAccountBillPaymentPayLaterViewController__interestForSelectedDate___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPeriodTransactions:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_updateLabelText");
}

- (double)_payButtonTopPadding
{
  uint64_t v2;
  double result;

  v2 = PKUIGetMinScreenWidthType();
  result = 35.0;
  if (!v2)
    return 20.0;
  return result;
}

- (double)_sideMargin
{
  unint64_t v2;
  double result;

  v2 = PKUIGetMinScreenWidthType();
  result = 44.0;
  if (v2 < 4)
    result = 24.0;
  if (!v2)
    return 16.0;
  return result;
}

- (void)_setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PKAccountBillPaymentPayLaterViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

  -[UIPickerView setUserInteractionEnabled:](self->_datePicker, "setUserInteractionEnabled:", v3);
  -[PKLegacyButtonInterface setEnabled:](self->_payOnButton, "setEnabled:", v3);
  -[PKLegacyButtonInterface setShowSpinner:](self->_payOnButton, "setShowSpinner:", v3 ^ 1);
  -[PKAccountBillPaymentPayLaterViewController _setNavigationBarEnabled:](self, "_setNavigationBarEnabled:", v3);
  -[PKAccountBillPaymentPayLaterViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v3);

  -[PKAccountBillPaymentPayLaterViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

}

- (void)_setNavigationBarEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[PKAccountBillPaymentPayLaterViewController navigationController](self, "navigationController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

  objc_msgSend(v9, "interactivePopGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

  -[PKAccountBillPaymentPayLaterViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidesBackButton:animated:", v3 ^ 1, 1);
  objc_msgSend(v7, "leftBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3);

}

- (id)_dateForRow:(int64_t)a3
{
  id v5;
  void *v6;

  v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v5, "setDay:", a3);
  -[NSCalendar dateByAddingComponents:toDate:options:](self->_productCalendar, "dateByAddingComponents:toDate:options:", v5, self->_minDate, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dateStringForRow:(int64_t)a3 formatter:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[PKAccountBillPaymentPayLaterViewController _dateForRow:](self, "_dateForRow:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_stripTimeFromDate:(id)a3
{
  void *v4;
  void *v5;

  -[NSCalendar components:fromDate:](self->_productCalendar, "components:fromDate:", 28, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar dateFromComponents:](self->_productCalendar, "dateFromComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateLabelText
{
  NSInteger v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PKAccount feature](self->_account, "feature");
  v3 = -[UIPickerView selectedRowInComponent:](self->_datePicker, "selectedRowInComponent:", 0);
  -[PKAccountBillPaymentPayLaterViewController _dateForRow:](self, "_dateForRow:", v3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PKAccountBillPaymentPayLaterViewController _interestForSelectedDate:](self, "_interestForSelectedDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountBillPaymentPayLaterViewController _dateStringForRow:formatter:](self, "_dateStringForRow:formatter:", v3, self->_dateFormatter);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currencyCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKFormattedCurrencyStringFromNumber();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedFeatureString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKLegacyButtonInterface setTitle:forState:](self->_payOnButton, "setTitle:forState:", v9, 0, v8, v5);
  -[PKLegacyButtonInterface sizeToFit](self->_payOnButton, "sizeToFit");
  if (-[PKAccount showBillPaymentInterest](self->_account, "showBillPaymentInterest"))
    -[PKAccountBillPaymentPayInterestDescriptionView setInterest:](self->_interestDescriptionView, "setInterest:", v4);
  -[PKAccountBillPaymentPayInterestDescriptionView setSelectedPaymentDate:](self->_interestDescriptionView, "setSelectedPaymentDate:", v11);
  -[PKAccountBillPaymentPayLaterViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsLayout");

}

- (void)_presentAddBankAccount
{
  PKNavigationController *v3;
  id v4;

  -[PKAccountBillPaymentPayLaterViewController _addBankAccountInformationViewController](self, "_addBankAccountInformationViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOfferKeychainPreFill:", 1);
  v3 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v4);
  -[PKNavigationController setSupportedInterfaceOrientations:](v3, "setSupportedInterfaceOrientations:", 2);
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    -[PKNavigationController setModalPresentationStyle:](v3, "setModalPresentationStyle:", 2);
  }
  -[PKAccountBillPaymentPayLaterViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (id)_addBankAccountInformationViewController
{
  PKAddBankAccountInformationViewController *addBankAccountViewController;
  PKAddBankAccountInformationViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  PKAddBankAccountInformationViewController *v8;
  PKAddBankAccountInformationViewController *v9;

  addBankAccountViewController = self->_addBankAccountViewController;
  if (!addBankAccountViewController)
  {
    v4 = [PKAddBankAccountInformationViewController alloc];
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66BC8]), "initWithType:", 1);
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "countryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKAddBankAccountInformationViewController initWithDelegate:bankInformation:accountCountryCode:featureAccount:](v4, "initWithDelegate:bankInformation:accountCountryCode:featureAccount:", self, v5, v7, self->_account);
    v9 = self->_addBankAccountViewController;
    self->_addBankAccountViewController = v8;

    addBankAccountViewController = self->_addBankAccountViewController;
  }
  return addBankAccountViewController;
}

- (void)_dismissViewControllerWithSuccess:(BOOL)a3
{
  id v3;

  -[PKAccountBillPaymentPayLaterViewController presentingViewController](self, "presentingViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_presentAlertControllerForError:(id)a3
{
  PKAccount *account;
  id v5;
  void *v6;
  id v7;

  account = self->_account;
  v5 = a3;
  +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", v5, -[PKAccount feature](account, "feature"), 0, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  +[PKAccountBillPaymentViewController alertControllerForDisplayableError:](PKAccountBillPaymentViewController, "alertControllerForDisplayableError:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[PKAccountBillPaymentPayLaterViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  -[PKAccountBillPaymentPayLaterViewController _setEnabled:](self, "_setEnabled:", 1);

}

- (PKAccountBillPaymentObserver)observer
{
  return (PKAccountBillPaymentObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_addBankAccountViewController, 0);
  objc_storeStrong((id *)&self->_interestDescriptionView, 0);
  objc_storeStrong((id *)&self->_interestCalculator, 0);
  objc_storeStrong((id *)&self->_whenToPayQuestionLabel, 0);
  objc_storeStrong((id *)&self->_payLaterTitleLabel, 0);
  objc_storeStrong((id *)&self->_payOnButton, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_apr, 0);
  objc_storeStrong((id *)&self->_remainingStatementBalance, 0);
  objc_storeStrong((id *)&self->_selectedAmount, 0);
  objc_storeStrong((id *)&self->_localCalendar, 0);
  objc_storeStrong((id *)&self->_productCalendar, 0);
  objc_storeStrong((id *)&self->_localDateFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatterDayOfWeek, 0);
  objc_storeStrong((id *)&self->_maxDate, 0);
  objc_storeStrong((id *)&self->_minDate, 0);
  objc_storeStrong((id *)&self->_suggestionList, 0);
  objc_storeStrong((id *)&self->_billPaymentCoordinator, 0);
  objc_storeStrong((id *)&self->_transactionSource, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_CLInUse, 0);
}

@end
