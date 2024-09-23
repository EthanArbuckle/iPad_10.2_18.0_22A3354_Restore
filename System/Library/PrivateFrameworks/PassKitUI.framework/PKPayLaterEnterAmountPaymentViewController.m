@implementation PKPayLaterEnterAmountPaymentViewController

- (PKPayLaterEnterAmountPaymentViewController)initWithPayLaterAccount:(id)a3 financingPlan:(id)a4 intentDetails:(id)a5 paymentIntentController:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKPayLaterEnterAmountPaymentViewController *v14;
  PKPayLaterEnterAmountPaymentViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PKPayLaterEnterAmountPaymentViewController;
  v14 = -[PKPayLaterEnterAmountViewController initWithPayLaterAccount:](&v22, sel_initWithPayLaterAccount_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_financingPlan, a4);
    objc_storeStrong((id *)&v15->_intentDetails, a5);
    objc_storeStrong((id *)&v15->_paymentIntentController, a6);
    -[PKPayLaterFinancingPlan planSummary](v15->_financingPlan, "planSummary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentBalance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "amount");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterEnterAmountViewController setMaxAllowedAmount:](v15, "setMaxAllowedAmount:", v18);

    objc_msgSend(v12, "minimumAmount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "amount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterEnterAmountViewController setMinAllowedAmount:](v15, "setMinAllowedAmount:", v20);

  }
  return v15;
}

- (id)headerTitle
{
  return (id)PKLocalizedCocoonString(CFSTR("PAYMENT_AMOUNT"));
}

- (id)headerSubtitle
{
  void *v2;

  if (-[PKPayLaterFinancingPlan productType](self->_financingPlan, "productType") == 1)
  {
    PKLocalizedCocoonString(CFSTR("PAYMENT_AMOUNT_BNPL_SUBTITLE"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)keypadSuggestions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  PKPayLaterEnterAmountPaymentViewController *v33;
  void *v34;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "installments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_objectsPassingTest:", &__block_literal_global_185);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "currentBalance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "amount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "pk_isPositiveNumber");

    if (v12)
    {
      v33 = self;
      v13 = (void *)MEMORY[0x1E0D66E80];
      PKLocalizedCocoonString(CFSTR("NEXT_PAYMENT_KEYPAD_SUGGESTION"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "amount");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "currency");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "suggestionWithTitle:value:currencyCode:", v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "safelyAddObject:", v17);
      objc_msgSend(v8, "currentBalance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, "amount");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "pk_isPositiveNumber");

        if (v21)
        {
          if (-[PKPayLaterFinancingPlan productType](v33->_financingPlan, "productType") == 1)
          {
            PKLocalizedCocoonString(CFSTR("NEXT_TWO_PAYMENTS_KEYPAD_SUGGESTION"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v22 = 0;
          }
          objc_msgSend(v10, "currencyAmountByAddingCurrencyAmount:", v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23)
          {
            objc_msgSend(v23, "amount");
            v34 = v22;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "pk_isPositiveNumber");

            v22 = v34;
            if (v26)
            {
              v31 = (void *)MEMORY[0x1E0D66E80];
              objc_msgSend(v24, "amount");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "currency");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "suggestionWithTitle:value:currencyCode:", v34, v30, v27);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v3, "safelyAddObject:", v32);
              v22 = v34;
            }
          }

        }
      }

    }
  }
  if ((uint64_t)fmin((double)(unint64_t)objc_msgSend(v3, "count"), 2.0) < 1)
  {
    v28 = 0;
  }
  else
  {
    objc_msgSend(v3, "subarrayWithRange:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v28;
}

uint64_t __63__PKPayLaterEnterAmountPaymentViewController_keypadSuggestions__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "status");
  return (v2 > 5) | (0x12u >> v2) & 1;
}

- (void)nextButtonTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  PKPayLaterPaymentIntentController *paymentIntentController;
  PKPayLaterFinancingPlan *financingPlan;
  PKAccountWebServiceFinancingPlanPaymentIntentResponse *intentDetails;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19[2];
  id location;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PKPayLaterEnterAmountViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
  objc_initWeak(&location, self);
  -[PKPayLaterEnterAmountViewController currencyAmount](self, "currencyAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterEnterAmountPaymentViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_sceneIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "formattedStringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v10;
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Presenting one time payment with %@", buf, 0xCu);

  }
  paymentIntentController = self->_paymentIntentController;
  financingPlan = self->_financingPlan;
  intentDetails = self->_intentDetails;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__PKPayLaterEnterAmountPaymentViewController_nextButtonTapped__block_invoke;
  v16[3] = &unk_1E3E75920;
  objc_copyWeak(v19, &location);
  v14 = v3;
  v17 = v14;
  v15 = v4;
  v18 = v15;
  v19[1] = (id)1;
  -[PKPayLaterPaymentIntentController presentPaymentAuthorizationForFinancingPlan:primaryPaymentSource:intentDetails:intent:currencyAmount:presentationSceneIdentifier:completion:](paymentIntentController, "presentPaymentAuthorizationForFinancingPlan:primaryPaymentSource:intentDetails:intent:currencyAmount:presentationSceneIdentifier:completion:", financingPlan, 0, intentDetails, 1, v14, v8, v16);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

void __62__PKPayLaterEnterAmountPaymentViewController_nextButtonTapped__block_invoke(uint64_t a1, char a2, char a3, void *a4)
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
    objc_msgSend(WeakRetained, "showNavigationBarSpinner:", 0);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentDetails, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end
