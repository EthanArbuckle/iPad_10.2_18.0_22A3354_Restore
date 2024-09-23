@implementation PKAccountBillPaymentConfirmationViewController

- (PKAccountBillPaymentConfirmationViewController)initWithAccount:(id)a3 previousAccountSummary:(id)a4 paymentPass:(id)a5 payments:(id)a6 suggestionList:(id)a7 interestForPaymentTotal:(id)a8 interestForStatementBalance:(id)a9
{
  id v16;
  id v17;
  PKAccountBillPaymentConfirmationViewController *v18;
  PKAccountBillPaymentConfirmationViewController *v19;
  id *p_account;
  PKPaymentService *v21;
  PKPaymentService *paymentService;
  uint64_t v23;
  NSDecimalNumber *pendingPaymentsTotal;
  uint64_t v25;
  NSDecimalNumber *paymentsTotal;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  uint64_t v34;
  NSDecimalNumber *v35;
  void *v36;
  void *v37;
  NSDateFormatter *v38;
  NSDateFormatter *productMonthDayFormatter;
  void *v40;
  void *v41;
  uint64_t v42;
  NSNumberFormatter *amountFormatter;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v51 = a5;
  v50 = a6;
  v49 = a7;
  v48 = a8;
  v47 = a9;
  v18 = -[PKExplanationViewController init](self, "init");
  v19 = v18;
  if (v18)
  {
    v45 = v17;
    v46 = v16;
    p_account = (id *)&v18->_account;
    objc_storeStrong((id *)&v18->_account, a3);
    objc_storeStrong((id *)&v19->_previousAccountSummary, a4);
    objc_storeStrong((id *)&v19->_paymentPass, a5);
    objc_storeStrong((id *)&v19->_payments, a6);
    objc_storeStrong((id *)&v19->_suggestionList, a7);
    objc_storeStrong((id *)&v19->_interestForPaymentTotal, a8);
    objc_storeStrong((id *)&v19->_interestForStatementBalance, a9);
    v21 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E0D672B0]);
    paymentService = v19->_paymentService;
    v19->_paymentService = v21;

    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v23 = objc_claimAutoreleasedReturnValue();
    pendingPaymentsTotal = v19->_pendingPaymentsTotal;
    v19->_pendingPaymentsTotal = (NSDecimalNumber *)v23;

    v19->_isScheduledPayment = 0;
    v19->_hasRecurringPayments = 0;
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v25 = objc_claimAutoreleasedReturnValue();
    paymentsTotal = v19->_paymentsTotal;
    v19->_paymentsTotal = (NSDecimalNumber *)v25;

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v27 = v19->_payments;
    v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v53 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "currencyAmount");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "amount");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSDecimalNumber decimalNumberByAdding:](v19->_paymentsTotal, "decimalNumberByAdding:", v33);
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = v19->_paymentsTotal;
          v19->_paymentsTotal = (NSDecimalNumber *)v34;

        }
        v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v29);
    }

    objc_msgSend(*p_account, "creditDetails");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "productTimeZone");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    productMonthDayFormatter = v19->_productMonthDayFormatter;
    v19->_productMonthDayFormatter = v38;

    -[NSDateFormatter setTimeZone:](v19->_productMonthDayFormatter, "setTimeZone:", v37);
    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v19->_productMonthDayFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM d"));
    objc_msgSend(*p_account, "creditDetails");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "currencyCode");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    PKMutableNumberFormatterForCurrencyCode();
    v42 = objc_claimAutoreleasedReturnValue();
    amountFormatter = v19->_amountFormatter;
    v19->_amountFormatter = (NSNumberFormatter *)v42;

    v17 = v45;
    v16 = v46;
  }

  return v19;
}

- (PKAccountBillPaymentConfirmationViewController)initWithAccount:(id)a3 paymentPass:(id)a4 scheduledPayments:(id)a5
{
  id v8;
  PKAccountBillPaymentConfirmationViewController *v9;
  PKAccountBillPaymentConfirmationViewController *v10;
  void *v11;
  uint64_t v12;
  NSDate *scheduledDate;

  v8 = a5;
  v9 = -[PKAccountBillPaymentConfirmationViewController initWithAccount:previousAccountSummary:paymentPass:payments:suggestionList:interestForPaymentTotal:interestForStatementBalance:](self, "initWithAccount:previousAccountSummary:paymentPass:payments:suggestionList:interestForPaymentTotal:interestForStatementBalance:", a3, 0, a4, v8, 0, 0, 0);
  v10 = v9;
  if (v9)
  {
    v9->_isScheduledPayment = 1;
    objc_msgSend(v8, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "paymentDate");
    v12 = objc_claimAutoreleasedReturnValue();
    scheduledDate = v10->_scheduledDate;
    v10->_scheduledDate = (NSDate *)v12;

  }
  return v10;
}

- (void)loadView
{
  PKBillPaymentRingView *v3;
  PKAccountBillPaymentCheckmarkRingView *v4;
  PKAccountBillPaymentCheckmarkRingView *checkmarkRingView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAccountBillPaymentConfirmationViewController;
  -[PKExplanationViewController loadView](&v6, sel_loadView);
  v3 = -[PKBillPaymentRingView initWithSuggestedAmountList:delegate:dataSource:]([PKBillPaymentRingView alloc], "initWithSuggestedAmountList:delegate:dataSource:", self->_suggestionList, self, self);
  v4 = -[PKAccountBillPaymentCheckmarkRingView initWithRingView:]([PKAccountBillPaymentCheckmarkRingView alloc], "initWithRingView:", v3);
  checkmarkRingView = self->_checkmarkRingView;
  self->_checkmarkRingView = v4;

}

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)PKAccountBillPaymentConfirmationViewController;
  -[PKExplanationViewController viewDidLoad](&v34, sel_viewDidLoad);
  -[NSNumberFormatter stringFromNumber:](self->_amountFormatter, "stringFromNumber:", self->_paymentsTotal);
  v3 = objc_claimAutoreleasedReturnValue();
  -[PKAccount feature](self->_account, "feature");
  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)v3;
  if (self->_isScheduledPayment)
  {
    -[NSDateFormatter stringFromDate:](self->_productMonthDayFormatter, "stringFromDate:", self->_scheduledDate);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v6 = objc_claimAutoreleasedReturnValue();
    v30 = v3;
    PKLocalizedFeatureString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showCheckmark:animated:", 0, 0, v30, v5);

  }
  else
  {
    v31 = v3;
    PKLocalizedFeatureString();
    v6 = objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentConfirmationViewController _availableCreditText](self, "_availableCreditText", v31);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v7, "stringByAppendingString:", CFSTR(" "));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingString:", v8);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        v12 = (void *)v10;
      else
        v12 = v8;
      v13 = v12;
      v14 = v7;
      v15 = v6;
      v16 = v13;

      v17 = v16;
      v6 = v15;
      v7 = v17;
    }
    objc_msgSend(v4, "setTopLogoPadding:", 32.0);
    objc_msgSend(v4, "setBodyViewPadding:", 35.0);
    objc_msgSend(v4, "setTitleAccessoriesEnabled:", 0);
    objc_msgSend(v4, "setHeroView:", self->_checkmarkRingView);
    objc_msgSend(v4, "setHeroViewSizeThatFitsOverride:", &__block_literal_global_23);

  }
  v32 = (void *)v6;
  -[PKAccountBillPaymentCheckmarkRingView ringView](self->_checkmarkRingView, "ringView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAmount:animated:", self->_paymentsTotal, 0);
  objc_msgSend(v18, "setIsSmall:", 1);
  objc_msgSend(v18, "completeInitialDisplayAnimated:", 0);
  -[PKAccountBillPaymentCheckmarkRingView checkmarkLayer](self->_checkmarkRingView, "checkmarkLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "currentStartColor");
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v19, "setColor:animated:", objc_msgSend(v20, "CGColor"), 0);

  objc_msgSend(v4, "setTitleText:", v6);
  objc_msgSend(v4, "setBodyText:", v7);
  objc_msgSend(v4, "setShowPrivacyView:", 0);
  -[PKAccountBillPaymentConfirmationViewController navigationItem](self, "navigationItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLeftBarButtonItem:", 0);
  objc_msgSend(v21, "setHidesBackButton:", 1);
  objc_msgSend(v4, "dockView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "primaryButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTintColor:", v25);

  -[PKAccountBillPaymentConfirmationViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "backgroundColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "updateTitleColorWithColor:", v27);

  objc_msgSend(v23, "setContentEdgeInsets:", 0.0, 14.0, 0.0, 14.0);
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48D0], 2, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFont:", v28);
  PKLocalizedFeatureString();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTitle:forState:", v29, 0);

  objc_msgSend(v24, "setAdjustsFontSizeToFitWidth:", 1);
}

uint64_t __61__PKAccountBillPaymentConfirmationViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "sizeThatFits:");
  return PKSizeScaleAspectFit();
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAccountBillPaymentConfirmationViewController;
  -[PKAccountBillPaymentConfirmationViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (self->_isScheduledPayment)
  {
    -[PKExplanationViewController explanationView](self, "explanationView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShowCheckmark:", 1);
  }
  else
  {
    -[PKAccountBillPaymentCheckmarkRingView checkmarkLayer](self->_checkmarkRingView, "checkmarkLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRevealed:animated:", 1, 1);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  PKPaymentService *paymentService;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAccountBillPaymentConfirmationViewController;
  -[PKAccountBillPaymentConfirmationViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  if (!self->_hasPerformedCategoryAnimation && !self->_isScheduledPayment)
  {
    paymentService = self->_paymentService;
    -[PKPaymentPass uniqueID](self->_paymentPass, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentService recomputeCategoryVisualizationMangitudesForPassUniqueID:style:](paymentService, "recomputeCategoryVisualizationMangitudesForPassUniqueID:style:", v5, 2);

    self->_hasPerformedCategoryAnimation = 1;
  }
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__PKAccountBillPaymentConfirmationViewController_preflightWithCompletion___block_invoke;
  v8[3] = &unk_1E3E61BB8;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  objc_msgSend(v5, "scheduledPaymentsWithAccountIdentifier:includeFailedRecurringPayments:completion:", v6, 1, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __74__PKAccountBillPaymentConfirmationViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PKAccountBillPaymentConfirmationViewController_preflightWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E61B90;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __74__PKAccountBillPaymentConfirmationViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[132];
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "referenceIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "length"))
            objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v8);
    }
    v27 = v5;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = a1;
    v12 = *(id *)(a1 + 32);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
          objc_msgSend(v17, "scheduleDetails");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (*((_BYTE *)v3 + 1161))
            v19 = 1;
          else
            v19 = objc_msgSend(v17, "isRecurring");
          *((_BYTE *)v3 + 1161) = v19;
          if (objc_msgSend(v17, "state") == 1 && objc_msgSend(v18, "frequency") == 1)
          {
            objc_msgSend(v17, "referenceIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v27, "containsObject:", v20);

            if ((v21 & 1) == 0)
            {
              objc_msgSend(v17, "currencyAmount");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "amount");
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v3[140], "decimalNumberByAdding:", v23);
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = v3[140];
              v3[140] = (id)v24;

            }
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "_updateBodyContentViewMessage");
    (*(void (**)(void))(*(_QWORD *)(v26 + 40) + 16))();

  }
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  PKAccountAutomaticPaymentsController *v4;
  void *v5;
  void *v6;
  PKAccountAutomaticPaymentsController *v7;
  id v8;
  _QWORD v9[5];

  if (-[PKAccountBillPaymentConfirmationViewController _shouldShowSetupAutoPayView](self, "_shouldShowSetupAutoPayView", a3))
  {
    v4 = [PKAccountAutomaticPaymentsController alloc];
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKAccountAutomaticPaymentsController initWithAccountService:paymentWebService:account:context:](v4, "initWithAccountService:paymentWebService:account:context:", v5, v6, self->_account, 0);

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__PKAccountBillPaymentConfirmationViewController_explanationViewDidSelectContinue___block_invoke;
    v9[3] = &unk_1E3E63BA0;
    v9[4] = self;
    -[PKAccountAutomaticPaymentsController nextViewControllerFromViewController:withCompletion:](v7, "nextViewControllerFromViewController:withCompletion:", 0, v9);

  }
  else
  {
    -[PKAccountBillPaymentConfirmationViewController presentingViewController](self, "presentingViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

void __83__PKAccountBillPaymentConfirmationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v6;
    objc_msgSend(v3, "setShowSetupPrompt:", 1);
    objc_msgSend(v3, "setShowCancelButton:", 0);
    objc_msgSend(v3, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidesBackButton:", 1);

    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushViewController:animated:", v3, 1);

    PKAppleCardSetAutopayPromptPresented();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (id)billPaymentRingView:(id)a3 topCurvedTextForSuggestedAmount:(id)a4
{
  return 0;
}

- (id)billPaymentRingView:(id)a3 bottomCurvedTextForSuggestedAmount:(id)a4
{
  return 0;
}

- (id)disabledTopCurvedTextForBillPaymentRingView:(id)a3
{
  return 0;
}

- (id)disabledBottomCurvedTextForBillPaymentRingView:(id)a3
{
  return 0;
}

- (id)billPaymentRingView:(id)a3 interestTextForAmount:(id)a4
{
  return 0;
}

- (id)billPaymentRingViewZeroInterestText:(id)a3
{
  return &stru_1E3E7D690;
}

- (void)_updateBodyContentViewMessage
{
  _BOOL4 v3;
  void *v4;
  PKCreditAccountSummary *previousAccountSummary;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int IsSingular;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  PKAccountBillPaymentMessageContentView *messageContentView;
  PKAccountBillPaymentMessageContentView *v30;
  PKAccountBillPaymentMessageContentView *v31;
  PKAccountBillPaymentMessageContentView *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;

  -[PKCreditAccountSummary paymentDueDate](self->_previousAccountSummary, "paymentDueDate");
  v38 = objc_claimAutoreleasedReturnValue();
  v3 = -[PKAccountBillPaymentConfirmationViewController _shouldDisplayInterestSummary](self, "_shouldDisplayInterestSummary");
  v4 = (void *)v38;
  if (!v3)
    goto LABEL_30;
  previousAccountSummary = self->_previousAccountSummary;
  if (!previousAccountSummary || v38 == 0)
    goto LABEL_30;
  -[PKCreditAccountSummary remainingMinimumPayment](previousAccountSummary, "remainingMinimumPayment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decimalNumberBySubtracting:", self->_pendingPaymentsTotal);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "decimalNumberBySubtracting:", self->_paymentsTotal);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKCreditAccountSummary remainingStatementBalance](self->_previousAccountSummary, "remainingStatementBalance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "decimalNumberBySubtracting:", self->_pendingPaymentsTotal);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "decimalNumberBySubtracting:", self->_paymentsTotal);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKAccount feature](self->_account, "feature");
  v36 = -[NSDecimalNumber pk_isPositiveNumber](self->_interestForPaymentTotal, "pk_isPositiveNumber");
  v13 = -[NSDecimalNumber pk_isPositiveNumber](self->_interestForStatementBalance, "pk_isPositiveNumber");
  LODWORD(v11) = objc_msgSend(v9, "pk_isPositiveNumber");
  v37 = v12;
  v14 = objc_msgSend(v12, "pk_isPositiveNumber");
  IsSingular = PKHourOfDateIsSingular();
  PKMediumDayAndLongMonthStringFromDate();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v38, 0, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v11)
  {
    -[NSNumberFormatter stringFromNumber:](self->_amountFormatter, "stringFromNumber:", v9);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v34 = v17;
    v35 = v16;
    v33 = v18;
    PKLocalizedFeatureString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("exclamationmark.triangle");
LABEL_8:
    v21 = v9;
    v22 = v37;
LABEL_23:

    goto LABEL_24;
  }
  if (v14)
  {
    if (v13)
    {
      v23 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CONFIRMATION_STATEMENT_BALANCE_REMAINING_BODY_WITH_TRAILING_INTEREST");
      v24 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CONFIRMATION_STATEMENT_BALANCE_REMAINING_BODY_WITH_TRAILING_INTEREST_HOUR_ONE");
    }
    else
    {
      if (!v36)
      {
        v18 = 0;
LABEL_22:
        v22 = v37;
        -[NSNumberFormatter stringFromNumber:](self->_amountFormatter, "stringFromNumber:", v37);
        v34 = v17;
        v35 = v16;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedFeatureString();
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = CFSTR("exclamationmark.triangle");
        v21 = v9;
        goto LABEL_23;
      }
      v23 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CONFIRMATION_STATEMENT_BALANCE_REMAINING_BODY_NO_TRAILING_INTEREST");
      v24 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CONFIRMATION_STATEMENT_BALANCE_REMAINING_BODY_NO_TRAILING_INTEREST_HOUR_ONE");
    }
    if (IsSingular)
      v23 = (__CFString *)v24;
    v18 = v23;
    goto LABEL_22;
  }
  if ((v36 & v13) == 1)
  {
    -[PKAccountBillPaymentConfirmationViewController _trailingInterestMonthMidpoint](self, "_trailingInterestMonthMidpoint");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[PKAccount productTimeZone](self->_account, "productTimeZone");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      PKEndOfNextMonthAndTimeZone();
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      PKMonthStringFromDate();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      PKMediumDayAndLongMonthStringFromDate();
      v33 = v27;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = CFSTR("info.circle");
    }
    else
    {
      v19 = 0;
      v20 = 0;
    }
    goto LABEL_8;
  }
  v19 = 0;
  v20 = 0;
  v21 = v9;
  v22 = v37;
LABEL_24:
  -[PKExplanationViewController explanationView](self, "explanationView", v33, v34, v35);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "length"))
  {
    messageContentView = self->_messageContentView;
    if (!messageContentView)
    {
      v30 = objc_alloc_init(PKAccountBillPaymentMessageContentView);
      v31 = self->_messageContentView;
      self->_messageContentView = v30;

      objc_msgSend(v28, "setBodyView:", self->_messageContentView);
      messageContentView = self->_messageContentView;
    }
    -[PKAccountBillPaymentMessageContentView setMessage:](messageContentView, "setMessage:", v19);
    -[PKAccountBillPaymentMessageContentView setSystemImage:](self->_messageContentView, "setSystemImage:", v20);
    objc_msgSend(v28, "setNeedsLayout");
  }
  else
  {
    objc_msgSend(v28, "setBodyView:", 0);
    v32 = self->_messageContentView;
    self->_messageContentView = 0;

  }
  v4 = (void *)v38;
LABEL_30:

}

- (BOOL)_shouldDisplayInterestSummary
{
  int v3;

  v3 = -[PKAccount showBillPaymentInterestSummary](self->_account, "showBillPaymentInterestSummary");
  if (v3)
    LOBYTE(v3) = !self->_isScheduledPayment;
  return v3;
}

- (id)_availableCreditText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  BOOL v10;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;

  -[NSArray pk_firstObjectPassingTest:](self->_payments, "pk_firstObjectPassingTest:", &__block_literal_global_69);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expectedCreditReleaseDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "availableCredit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "compare:", v7) == -1 || -[PKAccount state](self->_account, "state") == 1;

  }
  else
  {
    v9 = -[PKAccount state](self->_account, "state") == 1;
  }
  if (-[PKAccount hideBillPaymentHoldTime](self->_account, "hideBillPaymentHoldTime"))
    v10 = 1;
  else
    v10 = !v9;
  if (!v10 && v4 != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = PKDateRangeNumberOfIntervalsForUnit();
    if ((unint64_t)(v14 - 1) > 4)
    {
      if ((unint64_t)(v14 - 6) > 3)
      {
        if ((unint64_t)(v14 - 10) > 7)
        {
          v12 = 0;
          goto LABEL_24;
        }
        v16 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CONFIRMATION_CREDIT_RELEASE_HOLD_2");
      }
      else
      {
        v16 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CONFIRMATION_CREDIT_RELEASE_HOLD_1");
      }
      PKDynamicLocalizedAppleCardString(&v16->isa);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PKMediumDayAndLongMonthStringFromDate();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PKDynamicLocalizedAppleCardString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CONFIRMATION_CREDIT_RELEASE_DATE"), CFSTR("%1$@"), v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_24:

    goto LABEL_25;
  }
  v12 = 0;
LABEL_25:

  return v12;
}

BOOL __70__PKAccountBillPaymentConfirmationViewController__availableCreditText__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "expectedCreditReleaseDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_trailingInterestMonthMidpoint
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  -[PKCreditAccountSummary balanceSummary](self->_previousAccountSummary, "balanceSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openingDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "closingDate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v14 = 0;
  }
  else
  {
    PKDatesMidpoint();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0C99D48]);
    v10 = (void *)objc_msgSend(v9, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "productTimeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTimeZone:", v12);

    v13 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v13, "setMonth:", -2);
    objc_msgSend(v10, "dateByAddingComponents:toDate:options:", v13, v8, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (BOOL)_shouldShowSetupAutoPayView
{
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = PKBroadwayAutopayPrompt2024Enabled();
  if (v3)
  {
    if (self->_hasRecurringPayments || -[PKAccount feature](self->_account, "feature") != 2)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      v3 = -[PKAccount supportsScheduleRecurringPayments](self->_account, "supportsScheduleRecurringPayments");
      if (v3)
      {
        v3 = +[PKCreditAccountController shouldDisplayScheduledPaymentsWithAccount:andPass:](PKCreditAccountController, "shouldDisplayScheduledPaymentsWithAccount:andPass:", self->_account, self->_paymentPass);
        if (v3)
        {
          -[PKAccount creditDetails](self->_account, "creditDetails");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "accountSummary");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v5, "balanceStatus");

          if (v6 == 2)
            LOBYTE(v3) = 1;
          else
            LOBYTE(v3) = PKAppleCardAutopayPromptPresented() ^ 1;
        }
      }
    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkRingView, 0);
  objc_storeStrong((id *)&self->_messageContentView, 0);
  objc_storeStrong((id *)&self->_productMonthDayFormatter, 0);
  objc_storeStrong((id *)&self->_amountFormatter, 0);
  objc_storeStrong((id *)&self->_pendingPaymentsTotal, 0);
  objc_storeStrong((id *)&self->_paymentsTotal, 0);
  objc_storeStrong((id *)&self->_scheduledDate, 0);
  objc_storeStrong((id *)&self->_interestForStatementBalance, 0);
  objc_storeStrong((id *)&self->_interestForPaymentTotal, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_suggestionList, 0);
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_previousAccountSummary, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
