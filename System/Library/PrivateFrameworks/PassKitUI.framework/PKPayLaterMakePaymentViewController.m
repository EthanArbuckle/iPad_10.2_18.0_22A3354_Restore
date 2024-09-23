@implementation PKPayLaterMakePaymentViewController

- (PKPayLaterMakePaymentViewController)initWithFinancingPlan:(id)a3 paymentIntentController:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PKPayLaterMakePaymentViewController *v10;
  NSDateFormatter *v11;
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSDateFormatter *v21;
  NSDateFormatter *timeFormatter;
  NSDateFormatter *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "payLaterAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)PKPayLaterMakePaymentViewController;
  v10 = -[PKPayLaterViewController initWithPayLaterAccount:](&v28, sel_initWithPayLaterAccount_, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_financingPlan, a3);
    objc_storeStrong((id *)&v10->_paymentIntentController, a4);
    v11 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v10->_dateFormatter;
    v10->_dateFormatter = v11;

    v13 = v10->_dateFormatter;
    v14 = *MEMORY[0x1E0C996C8];
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v13, "setCalendar:", v15);

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v10->_dateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d"));
    -[PKPayLaterViewController payLaterAccount](v10, "payLaterAccount");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "payLaterDetails");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "productForProductType:", objc_msgSend(v7, "productType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "productDetails");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "productTimeZone");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    timeFormatter = v10->_timeFormatter;
    v10->_timeFormatter = v21;

    v23 = v10->_timeFormatter;
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v23, "setCalendar:", v24);

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v10->_timeFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("j:mm a v"));
    -[NSDateFormatter setTimeZone:](v10->_timeFormatter, "setTimeZone:", v20);
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v10, sel__cancelButtonTapped);
    -[PKPayLaterMakePaymentViewController navigationItem](v10, "navigationItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setLeftBarButtonItem:", v25);

  }
  return v10;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  void *v5;
  PKPayLaterPaymentIntentController *paymentIntentController;
  PKPayLaterFinancingPlan *financingPlan;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    paymentIntentController = self->_paymentIntentController;
    financingPlan = self->_financingPlan;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__PKPayLaterMakePaymentViewController_preflightWithCompletion___block_invoke;
    v8[3] = &unk_1E3E676D8;
    v8[4] = self;
    v9 = v4;
    -[PKPayLaterPaymentIntentController intentDetailsForFinancingPlan:intent:completion:](paymentIntentController, "intentDetailsForFinancingPlan:intent:completion:", financingPlan, 1, v8);

  }
}

void __63__PKPayLaterMakePaymentViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__PKPayLaterMakePaymentViewController_preflightWithCompletion___block_invoke_2;
  v10[3] = &unk_1E3E622D8;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __63__PKPayLaterMakePaymentViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  PKPayLaterMakePaymentSectionController *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1360), *(id *)(a1 + 40));
  v2 = [PKPayLaterMakePaymentSectionController alloc];
  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[165];
  objc_msgSend(v3, "payLaterAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPayLaterMakePaymentSectionController initWithFinancingPlan:payLaterAccount:intentDetails:dynamicContentPage:delegate:](v2, "initWithFinancingPlan:payLaterAccount:intentDetails:dynamicContentPage:delegate:", v4, v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1360), 0);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 1336);
  *(_QWORD *)(v7 + 1336) = v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1336), "setDynamicCollectionDelegate:");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)PKPayLaterMakePaymentViewController;
  -[PKPayLaterViewController viewDidLoad](&v22, sel_viewDidLoad);
  if (self->_sectionController)
  {
    v23[0] = self->_sectionController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v3, 0);

  }
  PKLocalizedCocoonString(CFSTR("MAKE_A_PAYMENT_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v4);

  -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "nextInstallmentDueDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 32, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hour");
  -[NSDateFormatter stringFromDate:](self->_timeFormatter, "stringFromDate:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PKPayLaterFinancingPlan state](self->_financingPlan, "state") == 4)
  {
    -[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "installments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "pk_countObjectsPassingTest:", &__block_literal_global_211);

    if (v15 > 1)
      v16 = CFSTR("MAKE_PAST_DUE_PAYMENTS_DESCRIPTION");
    else
      v16 = CFSTR("MAKE_A_PAST_DUE_PAYMENT_DESCRIPTION");
    PKLocalizedCocoonString(&v16->isa, CFSTR("%@"), v12);
  }
  else
  {
    PKLocalizedCocoonString(CFSTR("MAKE_A_PAYMENT_DESCRIPTION"), CFSTR("%ld%@%@%@"), v8, v12, v9, v10);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v17);
  -[PKPayLaterMakePaymentViewController _createDockView](self, "_createDockView");
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterMakePaymentViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBackgroundColor:", v18);

  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBackgroundColor:", v18);

}

BOOL __50__PKPayLaterMakePaymentViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "status") == 4;
}

- (void)sectionController:(id)a3 didUpdateCurrentSelectedAmount:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryButton");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "formattedStringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedCocoonString(CFSTR("PAY_AMOUNT"), CFSTR("%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:forState:", v8, 0);

}

- (id)pageTag
{
  return (id)*MEMORY[0x1E0D68F58];
}

- (id)additionalAnalyticsDictionary
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D68CD8];
  -[PKPayLaterFinancingPlan state](self->_financingPlan, "state");
  PKPayLaterFinancingPlanStateToString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_cancelButtonTapped
{
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D68858];
  v5[0] = *MEMORY[0x1E0D688C0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterViewController reportAnalyticsEvent:](self, "reportAnalyticsEvent:", v3);

  -[PKPayLaterMakePaymentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_didSelectPayNextPaymentAmount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKPayLaterPaymentIntentController *paymentIntentController;
  PKPayLaterFinancingPlan *financingPlan;
  PKAccountWebServiceFinancingPlanPaymentIntentResponse *intentDetails;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18[2];
  id location;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", 1);
  v20 = *MEMORY[0x1E0D68858];
  v21[0] = *MEMORY[0x1E0D68860];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterViewController reportAnalyticsEvent:](self, "reportAnalyticsEvent:", v3);

  objc_initWeak(&location, self);
  -[PKPayLaterMakePaymentSectionController currentSelectedAmount](self->_sectionController, "currentSelectedAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterMakePaymentViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_sceneIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  paymentIntentController = self->_paymentIntentController;
  financingPlan = self->_financingPlan;
  intentDetails = self->_intentDetails;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__PKPayLaterMakePaymentViewController__didSelectPayNextPaymentAmount__block_invoke;
  v15[3] = &unk_1E3E75920;
  objc_copyWeak(v18, &location);
  v13 = v4;
  v16 = v13;
  v14 = v5;
  v17 = v14;
  v18[1] = (id)1;
  -[PKPayLaterPaymentIntentController presentPaymentAuthorizationForFinancingPlan:primaryPaymentSource:intentDetails:intent:currencyAmount:presentationSceneIdentifier:completion:](paymentIntentController, "presentPaymentAuthorizationForFinancingPlan:primaryPaymentSource:intentDetails:intent:currencyAmount:presentationSceneIdentifier:completion:", financingPlan, 0, intentDetails, 1, v13, v9, v15);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __69__PKPayLaterMakePaymentViewController__didSelectPayNextPaymentAmount__block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setShowNavigationBarSpinner:", 0);
    if ((a2 & 1) == 0)
    {
      if (v7 || (a3 & 1) == 0)
      {
        PKAccountDisplayableError();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = PKAlertForDisplayableErrorWithHandlers(v14, 0, 0, 0);

        objc_msgSend(v9, "presentViewController:animated:completion:", v15, 1, 0);
        PKLogFacilityTypeGetObject();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = 138412290;
          v18 = v7;
          _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Failed to present financing plan payment intent authorization %@", (uint8_t *)&v17, 0xCu);
        }

      }
      else
      {
        PKLogFacilityTypeGetObject();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *(void **)(a1 + 32);
          v12 = *(_QWORD *)(a1 + 40);
          PKFinancingPlanPaymentIntentTypeToString();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412802;
          v18 = v11;
          v19 = 2112;
          v20 = v12;
          v21 = 2112;
          v22 = v13;
          _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Completed presenting financing plan payment intent authorization for amount %@, planIdentifier %@, intent %@", (uint8_t *)&v17, 0x20u);

        }
        objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);
      }
    }
  }

}

- (void)_didSelectCustomAmount
{
  void *v3;
  PKPayLaterEnterAmountPaymentViewController *v4;
  void *v5;
  PKPayLaterEnterAmountPaymentViewController *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0D68858];
  v9[0] = *MEMORY[0x1E0D68880];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterViewController reportAnalyticsEvent:](self, "reportAnalyticsEvent:", v3);

  v4 = [PKPayLaterEnterAmountPaymentViewController alloc];
  -[PKPayLaterViewController payLaterAccount](self, "payLaterAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPayLaterEnterAmountPaymentViewController initWithPayLaterAccount:financingPlan:intentDetails:paymentIntentController:](v4, "initWithPayLaterAccount:financingPlan:intentDetails:paymentIntentController:", v5, self->_financingPlan, self->_intentDetails, self->_paymentIntentController);

  -[PKPayLaterMakePaymentViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v6, 1);

}

- (void)_createDockView
{
  void *v3;
  PKPayLaterMakePaymentSectionController *sectionController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "primaryButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__didSelectPayNextPaymentAmount, 0x2000);

  sectionController = self->_sectionController;
  -[PKPayLaterMakePaymentSectionController currentSelectedAmount](sectionController, "currentSelectedAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterMakePaymentViewController sectionController:didUpdateCurrentSelectedAmount:](self, "sectionController:didUpdateCurrentSelectedAmount:", sectionController, v5);

  objc_msgSend(v10, "footerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setForceShowSetupLaterButton:", 1);
  objc_msgSend(v6, "setupLaterButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCocoonString(CFSTR("CUSTOM_AMOUNT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v8, 0);

  objc_msgSend(v6, "setupLaterButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__didSelectCustomAmount, 64);

  objc_msgSend(v6, "setManualEntryButton:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentDetails, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end
