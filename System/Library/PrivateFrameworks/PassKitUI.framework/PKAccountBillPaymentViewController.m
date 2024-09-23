@implementation PKAccountBillPaymentViewController

+ (BOOL)canPayBillForAccount:(id)a3 displayableError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "schedulePaymentFeatureDescriptor");
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_msgSend(v7, "stateReason");
      LOBYTE(v8) = v9 != 14;
      v10 = 2 * (v9 == 14);
      if (!a4)
        goto LABEL_10;
    }
    else
    {
      v10 = 1;
      if (!a4)
        goto LABEL_10;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
    v10 = 0;
    if (!a4)
      goto LABEL_10;
  }
  if ((v8 & 1) == 0)
  {
    objc_msgSend(a1, "displayableErrorForAccount:reason:", v7, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:

  return v8;
}

+ (id)displayableErrorForAccount:(id)a3 reason:(unint64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a3, "feature");
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      PKLocalizedFeatureString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
LABEL_8:
    PKLocalizedFeatureString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_9;
    goto LABEL_6;
  }
  PKLocalizedMadisonString(CFSTR("ACCOUNT_MERGE_INITIATED_ERROR_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("ACCOUNT_MERGE_INITIATED_ERROR_MESSAGE"));
  v7 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v7;
  if (!v6)
    goto LABEL_8;
  if (!v7)
  {
LABEL_9:
    PKLocalizedFeatureString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_6:
  PKDisplayableErrorCustom();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)alertControllerForDisplayableError:(id)a3
{
  return (id)objc_msgSend(a1, "alertControllerForDisplayableError:handler:", a3, 0);
}

+ (id)alertControllerForDisplayableError:(id)a3 handler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  if (a3)
  {
    v6 = (void *)MEMORY[0x1E0DC3450];
    v7 = a3;
    PKTitleForDisplayableError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A1AE46BC](v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
    a3 = (id)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("CANCEL_BUTTON_TITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __81__PKAccountBillPaymentViewController_alertControllerForDisplayableError_handler___block_invoke;
    v14[3] = &unk_1E3E61CA8;
    v15 = v5;
    objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a3, "addAction:", v12);
  }

  return a3;
}

uint64_t __81__PKAccountBillPaymentViewController_alertControllerForDisplayableError_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)backgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

+ (void)billPaymentViewControllerForAccount:(id)a3 accountUserCollection:(id)a4 transactionSource:(id)a5 configuration:(id)a6 withCompletion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, PKAccountBillPaymentViewController *);
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  int v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  int v27;
  _BOOL4 v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  PKAccountBillPaymentViewController *v37;
  int v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;

  v50 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, PKAccountBillPaymentViewController *))a7;
  if (v15)
  {
    v39 = a1;
    v42 = v50;
    objc_msgSend(v42, "creditDetails");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accountSummary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "balanceSummary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "adjustedBalance");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pastDueAmount");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pendingPurchases");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v17, "cyclesPastDue");
    objc_msgSend(v16, "createdDate");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x1E0C99D48]);
    v21 = (void *)objc_msgSend(v20, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v22 = objc_claimAutoreleasedReturnValue();
    v46 = v18;
    v45 = (void *)v19;
    if (v19 && objc_msgSend(v21, "isDate:equalToDate:toUnitGranularity:", v19, v22, 8))
      v23 = objc_msgSend(v21, "isDate:equalToDate:toUnitGranularity:", v19, v22, 4) ^ 1;
    else
      v23 = 1;
    v38 = v23;
    v24 = (int)v47;
    v44 = (void *)v22;
    if (v47)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v47, "compare:", v25) == 1;

    }
    v40 = v12;
    v41 = v13;
    if (v49)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v49, "compare:", v26) == 1;

    }
    else
    {
      v27 = 0;
    }
    v28 = (int)v48;
    if (v43 <= 0)
    {
      v29 = v42;
      if (v48)
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v30 = v24;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v48, "compare:", v31) == 1;

        v24 = v30;
      }
    }
    else
    {
      v29 = v42;
      v28 = 1;
    }
    objc_msgSend(v14, "earlyInstallmentPlan");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v16, "numberOfActiveStatementedInstallments");
    if (v32)
    {
      if (v33 <= 1)
        v34 = 6;
      else
        v34 = 7;
    }
    else
    {
      v35 = newInstallmentsForAccount(v29, 0);
      v36 = 5;
      if (!v35)
        v36 = 0;
      if ((v38 | v27 | v24) == 1)
      {
        if ((v27 | v24) == 1)
        {
          if (v28)
            v36 = 4;
          if ((v24 & ~v27) != 0)
            v34 = 3;
          else
            v34 = v36;
        }
        else
        {
          v34 = 2;
        }
      }
      else
      {
        v34 = 1;
      }
    }
    v12 = v40;
    v13 = v41;

    if (v34)
    {
      v37 = -[PKAccountBillPaymentViewController initWithAccount:accountUserCollection:transactionSource:suggestedAmountController:configuration:interstitalState:]([PKAccountBillPaymentViewController alloc], "initWithAccount:accountUserCollection:transactionSource:suggestedAmountController:configuration:interstitalState:", v29, v40, v41, 0, v14, v34);
      v15[2](v15, v37);

    }
    else
    {
      objc_msgSend(v39, "_billPaymentViewControllerForAccount:accountUserCollection:transactionSource:configuration:withCompletion:", v29, v40, v41, v14, v15);
    }
  }

}

+ (void)_billPaymentViewControllerForAccount:(id)a3 accountUserCollection:(id)a4 transactionSource:(id)a5 configuration:(id)a6 withCompletion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (void *)MEMORY[0x1E0D66BE8];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __144__PKAccountBillPaymentViewController__billPaymentViewControllerForAccount_accountUserCollection_transactionSource_configuration_withCompletion___block_invoke;
  v22[3] = &unk_1E3E65078;
  v26 = v14;
  v27 = v15;
  v23 = v11;
  v24 = v12;
  v25 = v13;
  v17 = v14;
  v18 = v13;
  v19 = v12;
  v20 = v11;
  v21 = v15;
  objc_msgSend(v16, "defaultControllerForAccount:accountUserCollection:transactionSource:configuration:completion:", v20, v19, v18, v17, v22);

}

void __144__PKAccountBillPaymentViewController__billPaymentViewControllerForAccount_accountUserCollection_transactionSource_configuration_withCompletion___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;
  PKAccountBillPaymentViewController *v5;

  v3 = a1[8];
  v4 = a2;
  v5 = -[PKAccountBillPaymentViewController initWithAccount:accountUserCollection:transactionSource:suggestedAmountController:configuration:interstitalState:]([PKAccountBillPaymentViewController alloc], "initWithAccount:accountUserCollection:transactionSource:suggestedAmountController:configuration:interstitalState:", a1[4], a1[5], a1[6], v4, a1[7], 0);

  (*(void (**)(uint64_t, PKAccountBillPaymentViewController *))(v3 + 16))(v3, v5);
}

+ (UIEdgeInsets)contentMargins
{
  unint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = PKUIGetMinScreenWidthType();
  if (v2 > 3)
    v3 = 44.0;
  else
    v3 = dbl_19DF151B0[v2];
  v4 = 0.0;
  v5 = 0.0;
  v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v3;
  result.top = v4;
  return result;
}

+ (double)ringTopMargin
{
  double v2;
  unint64_t v3;

  v2 = 21.0;
  if ((PKUserInterfaceIdiomSupportsLargeLayouts() & 1) == 0)
  {
    v3 = PKUIGetMinScreenType();
    if (v3 > 7)
      return 64.0;
    else
      return dbl_19DF151D0[v3];
  }
  return v2;
}

+ (double)smallRingTopMargin
{
  double v2;
  unint64_t v3;

  v2 = 14.0;
  if ((PKUserInterfaceIdiomSupportsLargeLayouts() & 1) == 0)
  {
    v3 = PKUIGetMinScreenType();
    v2 = 21.0;
    if (v3 <= 7)
      return dbl_19DF15210[v3];
  }
  return v2;
}

+ (CGSize)smallRingSizeWithAccessibilityLayout:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v4;
  double v5;
  double v6;
  CGSize result;

  v3 = a3;
  v4 = PKUIGetMinScreenWidthType();
  v5 = 120.0;
  if (v3)
    v5 = 64.0;
  if (!v4)
    v5 = 54.0;
  v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (PKAccountBillPaymentViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (PKAccountBillPaymentViewController)initWithSuggestedAmountController:(id)a3 transactionSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PKAccountBillPaymentViewController *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountUserCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKAccountBillPaymentViewController initWithSuggestedAmountController:account:accountUserCollection:transactionSource:configuration:interstitialState:](self, "initWithSuggestedAmountController:account:accountUserCollection:transactionSource:configuration:interstitialState:", v7, v8, v9, v6, 0, 0);

  return v10;
}

- (PKAccountBillPaymentViewController)initWithSuggestedAmountController:(id)a3 account:(id)a4 accountUserCollection:(id)a5 transactionSource:(id)a6 configuration:(id)a7 interstitialState:(unint64_t)a8
{
  return -[PKAccountBillPaymentViewController initWithAccount:accountUserCollection:transactionSource:suggestedAmountController:configuration:interstitalState:](self, "initWithAccount:accountUserCollection:transactionSource:suggestedAmountController:configuration:interstitalState:", a4, a5, a6, a3, a7, a8);
}

- (PKAccountBillPaymentViewController)initWithAccount:(id)a3 accountUserCollection:(id)a4 transactionSource:(id)a5 suggestedAmountController:(id)a6 configuration:(id)a7 interstitalState:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  PKAccountBillPaymentViewController *v18;
  PKAccountBillPaymentViewController *v19;
  unint64_t v20;
  CGPoint v21;
  CGSize v22;
  uint64_t v23;
  PKBillPaymentSuggestedAmountList *suggestionList;
  unint64_t interstitialState;
  id v26;
  void *v27;
  uint64_t v28;
  PKAccountBillPaymentController *billPaymentCoordinator;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSArray *installmentPlans;
  uint64_t v34;
  NSArray *v35;
  id v36;
  NSArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSDecimalNumber *apr;
  NSDateFormatter *v49;
  NSDateFormatter *interestDateFormatter;
  NSDateFormatter *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSNumberFormatter *amountFormatter;
  void *v56;
  void *v57;
  void *v58;
  id v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  objc_super v70;
  uint64_t v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v63 = a6;
  v64 = a7;
  v70.receiver = self;
  v70.super_class = (Class)PKAccountBillPaymentViewController;
  v18 = -[PKAccountBillPaymentViewController initWithNibName:bundle:](&v70, sel_initWithNibName_bundle_, 0, 0);
  v19 = v18;
  if (v18)
  {
    v60 = v16;
    v62 = v17;
    objc_storeStrong((id *)&v18->_account, a3);
    objc_storeStrong((id *)&v19->_accountUserCollection, a4);
    objc_storeStrong((id *)&v19->_transactionSource, a5);
    v19->_interstitialState = a8;
    if (a8 > 5)
      v20 = 0;
    else
      v20 = qword_19DF15250[a8];
    v19->_featuredViewState = v20;
    objc_storeStrong((id *)&v19->_configuration, a7);
    v19->_viewIsEnabled = 1;
    v19->_payButtonsEnabled = 1;
    v19->_shouldEnablePayLaterButton = 1;
    v21 = (CGPoint)*MEMORY[0x1E0C9D628];
    v22 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v19->_lastKeyboardFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v19->_lastKeyboardFrame.size = v22;
    v19->_keyboardFrame.origin = v21;
    v19->_keyboardFrame.size = v22;
    objc_storeStrong((id *)&v19->_suggestedAmountController, a6);
    -[PKBillPaymentSuggestedAmountController generateAmountSuggestionListWithFinHealth:](v19->_suggestedAmountController, "generateAmountSuggestionListWithFinHealth:", PKFinHealthBillPaymentSuggestionsEnabled());
    v23 = objc_claimAutoreleasedReturnValue();
    suggestionList = v19->_suggestionList;
    v19->_suggestionList = (PKBillPaymentSuggestedAmountList *)v23;

    interstitialState = v19->_interstitialState;
    if (interstitialState - 6 < 2)
    {
      objc_msgSend(v64, "earlyInstallmentPlan");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v30;
      if (v30)
      {
        v71 = v30;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
        v32 = objc_claimAutoreleasedReturnValue();
        installmentPlans = v19->_installmentPlans;
        v19->_installmentPlans = (NSArray *)v32;

      }
    }
    else if (interstitialState == 5)
    {
      v69 = objc_alloc_init(MEMORY[0x1E0C99D20]);
      newInstallmentsForAccount(v15, &v69);
      v34 = objc_msgSend(v69, "copy");
      v35 = v19->_installmentPlans;
      v19->_installmentPlans = (NSArray *)v34;

      v36 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v37 = v19->_installmentPlans;
      v38 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v66 != v40)
              objc_enumerationMutation(v37);
            objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "identifier", v60);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "addObject:", v42);

          }
          v39 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
        }
        while (v39);
      }

      if (objc_msgSend(v36, "count"))
      {
        objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKAccount accountIdentifier](v19->_account, "accountIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "markUserViewedIntroduction:forInstallmentIdentifiers:accountIdentifier:", 1, v36, v44);

      }
    }
    else if (!interstitialState)
    {
      v26 = objc_alloc(MEMORY[0x1E0D66838]);
      objc_msgSend(v17, "paymentPass");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "initWithAccount:paymentPass:", v15, v27);
      billPaymentCoordinator = v19->_billPaymentCoordinator;
      v19->_billPaymentCoordinator = (PKAccountBillPaymentController *)v28;

      -[PKAccountBillPaymentController setDelegate:](v19->_billPaymentCoordinator, "setDelegate:", v19);
    }
    objc_msgSend(v15, "creditDetails", v60);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "rates");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "aprForPurchases");
    v47 = objc_claimAutoreleasedReturnValue();
    apr = v19->_apr;
    v19->_apr = (NSDecimalNumber *)v47;

    v49 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    interestDateFormatter = v19->_interestDateFormatter;
    v19->_interestDateFormatter = v49;

    v51 = v19->_interestDateFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v51, "setLocale:", v52);

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v19->_interestDateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d"));
    objc_msgSend(v45, "currencyCode");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    PKMutableNumberFormatterForCurrencyCode();
    v54 = objc_claimAutoreleasedReturnValue();
    amountFormatter = v19->_amountFormatter;
    v19->_amountFormatter = (NSNumberFormatter *)v54;

    -[PKAccountBillPaymentViewController navigationItem](v19, "navigationItem");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v56, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v19, sel__cancelButtonTapped_);
    objc_msgSend(v57, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AF8]);
    objc_msgSend(v56, "setLeftBarButtonItem:", v57);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addObserver:selector:name:object:", v19, sel__accountDidChange_, *MEMORY[0x1E0D68290], 0);

    v16 = v61;
    v17 = v62;
  }

  return v19;
}

- (void)dealloc
{
  void *v3;
  CLInUseAssertion *CLInUse;
  CLInUseAssertion *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  CLInUse = self->_CLInUse;
  if (CLInUse)
  {
    -[CLInUseAssertion invalidate](CLInUse, "invalidate");
    v5 = self->_CLInUse;
    self->_CLInUse = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)PKAccountBillPaymentViewController;
  -[PKAccountBillPaymentViewController dealloc](&v6, sel_dealloc);
}

- (void)loadView
{
  unint64_t featuredViewState;
  unint64_t v4;
  UILabel *v5;
  UILabel *titleLabel;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  BOOL v14;
  void **v15;
  void **v16;
  UILabel *v17;
  UILabel *subtitleLabel;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  UILabel *smallRingInterestLabel;
  PKBillPaymentRingView *v23;
  PKBillPaymentRingView *ringView;
  void *v25;
  PKAccountBillPaymentAmountDescriptionView *v26;
  PKAccountBillPaymentAmountDescriptionView *amountDescriptionView;
  PKAccountBillPaymentAmountDescriptionView *v28;
  void *v29;
  void *v30;
  PKAccountBillPaymentAmountDescriptionView *v31;
  void *v32;
  NSString *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  PKLegacyButtonInterface *v37;
  PKLegacyButtonInterface *primaryButton;
  unint64_t interstitialState;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  PKLegacyButtonInterface *v44;
  PKLegacyButtonInterface *secondaryButton;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  UIButton *v53;
  UIButton *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  UIButton *v61;
  UIButton *tertiaryButton;
  UIImageView *v63;
  UIImageView *productHeroView;
  UIScrollView *v65;
  UIScrollView *scrollView;
  _PKVisibilityBackdropView *v67;
  _PKVisibilityBackdropView *v68;
  _PKVisibilityBackdropView *blurringView;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _BOOL8 v74;
  _BOOL8 v75;
  void *v76;
  NSString *v77;
  NSString *v78;
  _BOOL4 v79;
  void *v80;
  NSString *v81;
  NSString *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  NSMutableDictionary *v87;
  NSMutableDictionary *smallRingInterestAttributes;
  void *v89;
  uint64_t v90;
  void *v91;
  NSDictionary *v92;
  NSDictionary *smallRingInterestDateAttributes;
  void *v94;
  void *v95;
  NSString *v96;
  void *v97;
  void (**v98)(void *, void *, void *);
  _QWORD v99[4];
  id v100;
  _QWORD v101[4];
  id v102;
  id location;
  _QWORD aBlock[5];
  objc_super v105;
  _QWORD v106[2];
  _QWORD v107[2];
  uint64_t v108;
  _QWORD v109[3];

  v109[1] = *MEMORY[0x1E0C80C00];
  v105.receiver = self;
  v105.super_class = (Class)PKAccountBillPaymentViewController;
  -[PKAccountBillPaymentViewController loadView](&v105, sel_loadView);
  -[PKAccount feature](self->_account, "feature");
  featuredViewState = self->_featuredViewState;
  v4 = PKUIGetMinScreenType();
  if (featuredViewState != 1 || PKUIGetMinScreenWidthType() || PKIsVision())
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v5;

    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    v7 = self->_titleLabel;
    -[PKAccountBillPaymentViewController _title](self, "_title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v7, "setText:", v8);

    v9 = self->_titleLabel;
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B48], (void *)*MEMORY[0x1E0DC48F8], 32770, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9, "setFont:", v10);

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  }
  v14 = featuredViewState != 1 || v4 == 4 || v4 == 5 || v4 == 6 || v4 > 7;
  v15 = (void **)MEMORY[0x1E0DC4A88];
  v16 = (void **)MEMORY[0x1E0DC48D0];
  if (v14 || PKIsVision())
  {
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v17;

    -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
    v19 = self->_subtitleLabel;
    PKFontForDefaultDesign(*v15, *v16, 0x8000, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v19, "setFont:", v20);

    -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](self->_subtitleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
  }
  -[PKAccountBillPaymentViewController _updateSubtitle](self, "_updateSubtitle");
  v21 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  smallRingInterestLabel = self->_smallRingInterestLabel;
  self->_smallRingInterestLabel = v21;

  -[UILabel setBaselineAdjustment:](self->_smallRingInterestLabel, "setBaselineAdjustment:", 1);
  -[UILabel setTextAlignment:](self->_smallRingInterestLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_smallRingInterestLabel, "setNumberOfLines:", 0);
  -[UILabel setAlpha:](self->_smallRingInterestLabel, "setAlpha:", 0.0);
  v23 = -[PKBillPaymentRingView initWithSuggestedAmountList:delegate:dataSource:]([PKBillPaymentRingView alloc], "initWithSuggestedAmountList:delegate:dataSource:", self->_suggestionList, self, self);
  ringView = self->_ringView;
  self->_ringView = v23;

  -[PKBillPaymentRingView setEnabled:](self->_ringView, "setEnabled:", self->_interstitialState == 0);
  -[PKBillPaymentRingView setHidden:](self->_ringView, "setHidden:", featuredViewState != 1);
  -[PKBillPaymentRingView layer](self->_ringView, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAnchorPoint:", 0.5, 0.0);

  v26 = -[PKAccountBillPaymentAmountDescriptionView initWithSuggestedAmountList:account:configuration:delegate:]([PKAccountBillPaymentAmountDescriptionView alloc], "initWithSuggestedAmountList:account:configuration:delegate:", self->_suggestionList, self->_account, self->_configuration, self);
  amountDescriptionView = self->_amountDescriptionView;
  self->_amountDescriptionView = v26;

  v28 = self->_amountDescriptionView;
  -[PKAccount schedulePaymentFeatureDescriptor](self->_account, "schedulePaymentFeatureDescriptor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "minimumAmount");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountBillPaymentAmountDescriptionView setMinimumAmount:](v28, "setMinimumAmount:", v30);

  v31 = self->_amountDescriptionView;
  if (PKBroadwayAllowOverpaymentViaKeypadKey())
  {
    -[PKAccountBillPaymentAmountDescriptionView setMaximumAmount:](v31, "setMaximumAmount:", 0);
  }
  else
  {
    -[PKBillPaymentSuggestedAmountList maximumAmount](self->_suggestionList, "maximumAmount");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentAmountDescriptionView setMaximumAmount:](v31, "setMaximumAmount:", v32);

  }
  -[PKAccountBillPaymentViewController _setupAmountDescriptionViewForInterstitial](self, "_setupAmountDescriptionViewForInterstitial");
  v33 = (NSString *)*v16;
  v96 = (NSString *)*v15;
  PKFontForDefaultDesign(*v15, *v16, 2, 0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PKAccountBillPaymentViewController_loadView__block_invoke;
  aBlock[3] = &unk_1E3E650A0;
  aBlock[4] = v97;
  v98 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "backgroundColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v98[2](v98, v35, v36);
  v37 = (PKLegacyButtonInterface *)objc_claimAutoreleasedReturnValue();
  primaryButton = self->_primaryButton;
  self->_primaryButton = v37;

  -[PKLegacyButtonInterface setAccessibilityIdentifier:](self->_primaryButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67EE8]);
  interstitialState = self->_interstitialState;
  if (interstitialState - 4 >= 3)
  {
    if (interstitialState == 7)
    {
      PKLocalizedFeatureString();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (void *)MEMORY[0x1E0DC3520];
      PKLocalizedFeatureString();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      PKFontForDefaultDesign(v96, v33);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "pkui_plainConfigurationWithTitle:font:", v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      v59 = (void *)MEMORY[0x1E0DC3428];
      v99[0] = v34;
      v99[1] = 3221225472;
      v99[2] = __46__PKAccountBillPaymentViewController_loadView__block_invoke_4;
      v99[3] = &unk_1E3E62BD0;
      objc_copyWeak(&v100, &location);
      objc_msgSend(v59, "actionWithHandler:", v99);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v58, v60);
      v61 = (UIButton *)objc_claimAutoreleasedReturnValue();
      tertiaryButton = self->_tertiaryButton;
      self->_tertiaryButton = v61;

      -[UIButton setConfigurationUpdateHandler:](self->_tertiaryButton, "setConfigurationUpdateHandler:", &__block_literal_global_65);
      -[UIButton sizeToFit](self->_tertiaryButton, "sizeToFit");

      objc_destroyWeak(&v100);
      goto LABEL_31;
    }
    if (!interstitialState)
    {
      self->_buttonsArePayButtons = 1;
      -[PKAccountBillPaymentViewController _paymentAmount](self, "_paymentAmount");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountBillPaymentViewController _updatePayNowButtonTitleWithAmount:](self, "_updatePayNowButtonTitleWithAmount:", v41);

      -[PKLegacyButtonInterface addTarget:action:forControlEvents:](self->_primaryButton, "addTarget:action:forControlEvents:", self, sel__payNowButtonTapped_, 64);
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v98[2](v98, v42, v43);
      v44 = (PKLegacyButtonInterface *)objc_claimAutoreleasedReturnValue();
      secondaryButton = self->_secondaryButton;
      self->_secondaryButton = v44;

      PKLocalizedFeatureString();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKLegacyButtonInterface setTitle:forState:](self->_secondaryButton, "setTitle:forState:", v46, 0);
      -[PKLegacyButtonInterface addTarget:action:forControlEvents:](self->_secondaryButton, "addTarget:action:forControlEvents:", self, sel__payLaterButtonTapped_, 64);
      -[PKLegacyButtonInterface sizeToFit](self->_secondaryButton, "sizeToFit");
      -[PKLegacyButtonInterface setAccessibilityIdentifier:](self->_secondaryButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FE0]);
      v47 = (void *)MEMORY[0x1E0DC3428];
      v101[0] = v34;
      v101[1] = 3221225472;
      v101[2] = __46__PKAccountBillPaymentViewController_loadView__block_invoke_2;
      v101[3] = &unk_1E3E62BD0;
      objc_copyWeak(&v102, &location);
      objc_msgSend(v47, "actionWithHandler:", v101);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)MEMORY[0x1E0DC3520];
      PKFontForDefaultDesign(v96, v33);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "pkui_plainConfigurationWithTitle:font:", v49, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v52, v48);
      v53 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v54 = self->_tertiaryButton;
      self->_tertiaryButton = v53;

      -[UIButton setConfigurationUpdateHandler:](self->_tertiaryButton, "setConfigurationUpdateHandler:", &__block_literal_global_37);
      -[UIButton sizeToFit](self->_tertiaryButton, "sizeToFit");
      -[UIButton setAccessibilityIdentifier:](self->_tertiaryButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68108]);

      objc_destroyWeak(&v102);
      goto LABEL_33;
    }
    PKLocalizedString(CFSTR("DONE"));
    v40 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("CONTINUE"));
    v40 = objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v40;
LABEL_31:
  -[PKLegacyButtonInterface setTitle:forState:](self->_primaryButton, "setTitle:forState:", v46, 0);
  -[PKLegacyButtonInterface addTarget:action:forControlEvents:](self->_primaryButton, "addTarget:action:forControlEvents:", self, sel__interstitialButtonTapped_, 64);
  if (self->_featuredViewState == 2)
  {
    v63 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    productHeroView = self->_productHeroView;
    self->_productHeroView = v63;

    -[UIImageView setAccessibilityIgnoresInvertColors:](self->_productHeroView, "setAccessibilityIgnoresInvertColors:", 1);
    -[PKAccountBillPaymentViewController _configureProductHeroView](self, "_configureProductHeroView");
  }
LABEL_33:

  -[PKLegacyButtonInterface sizeToFit](self->_primaryButton, "sizeToFit");
  v65 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
  scrollView = self->_scrollView;
  self->_scrollView = v65;

  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  v67 = [_PKVisibilityBackdropView alloc];
  v68 = -[_PKVisibilityBackdropView initWithFrame:privateStyle:](v67, "initWithFrame:privateStyle:", -2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  blurringView = self->_blurringView;
  self->_blurringView = v68;

  -[_PKVisibilityBackdropView setDelegate:](self->_blurringView, "setDelegate:", self);
  -[_PKVisibilityBackdropView setUserInteractionEnabled:](self->_blurringView, "setUserInteractionEnabled:", 1);
  -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_blurringView, "pkui_setVisibility:animated:", 0, 0.0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "addObserver:selector:name:object:", self, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);
  objc_msgSend(v70, "addObserver:selector:name:object:", self, sel_keyboardWillChange_, *MEMORY[0x1E0DC4FD8], 0);
  objc_msgSend(v70, "addObserver:selector:name:object:", self, sel_keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);
  v95 = v70;
  -[PKAccountBillPaymentViewController view](self, "view");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "backgroundColor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setBackgroundColor:", v72);

  objc_msgSend(v71, "addSubview:", self->_scrollView);
  objc_msgSend(v71, "addSubview:", self->_blurringView);
  -[_UIBackdropView contentView](self->_blurringView, "contentView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "addSubview:", self->_tertiaryButton);
  objc_msgSend(v73, "addSubview:", self->_secondaryButton);
  objc_msgSend(v73, "addSubview:", self->_primaryButton);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_ringView);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_productHeroView);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_amountDescriptionView);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_titleLabel);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_subtitleLabel);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_smallRingInterestLabel);
  objc_msgSend(v71, "setUserInteractionEnabled:", self->_viewIsEnabled);
  v74 = !self->_buttonsArePayButtons || self->_payButtonsEnabled;
  -[PKLegacyButtonInterface setEnabled:](self->_primaryButton, "setEnabled:", v74);
  v75 = self->_shouldEnablePayLaterButton && self->_payButtonsEnabled;
  -[PKLegacyButtonInterface setEnabled:](self->_secondaryButton, "setEnabled:", v75);
  -[PKLegacyButtonInterface setShowSpinner:](self->_primaryButton, "setShowSpinner:", !self->_viewIsEnabled);
  -[UIButton setEnabled:](self->_tertiaryButton, "setEnabled:", self->_viewIsEnabled);
  -[PKAccountBillPaymentViewController traitCollection](self, "traitCollection");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "preferredContentSizeCategory");
  v77 = (NSString *)objc_claimAutoreleasedReturnValue();

  v78 = (NSString *)*MEMORY[0x1E0DC4918];
  self->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v77, (UIContentSizeCategory)*MEMORY[0x1E0DC4918]) == NSOrderedDescending;
  self->_usesLargestAccessibilityLayout = (unint64_t)UIContentSizeCategoryCompareToCategory(v77, (UIContentSizeCategory)*MEMORY[0x1E0DC48B8]) < 2;
  v79 = -[PKAccountBillPaymentViewController _interestLabelIsOutsideSmallRing](self, "_interestLabelIsOutsideSmallRing");
  v80 = (void *)*MEMORY[0x1E0DC4AB8];
  if (v79)
    v81 = (NSString *)*MEMORY[0x1E0DC4AB8];
  else
    v81 = v96;
  if (v79)
    v82 = v33;
  else
    v82 = v78;
  PKFontForDesign((void *)*MEMORY[0x1E0DC13A8], v81, v82, 0x8000, 0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "pk_fixedWidthFont");
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  v108 = *MEMORY[0x1E0DC1138];
  v85 = v108;
  v109[0] = v84;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v109, &v108, 1);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = (NSMutableDictionary *)objc_msgSend(v86, "mutableCopy");
  smallRingInterestAttributes = self->_smallRingInterestAttributes;
  self->_smallRingInterestAttributes = v87;

  PKFontForDefaultDesign(v80, v33, 0x8000, 0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v107[0] = v89;
  v90 = *MEMORY[0x1E0DC1140];
  v106[0] = v85;
  v106[1] = v90;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v107[1] = v91;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, v106, 2);
  v92 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  smallRingInterestDateAttributes = self->_smallRingInterestDateAttributes;
  self->_smallRingInterestDateAttributes = v92;

  -[PKAccountBillPaymentViewController _updateNavigationTitle](self, "_updateNavigationTitle");
  -[PKAccountBillPaymentViewController _updateForShowKeyboardAnimated:](self, "_updateForShowKeyboardAnimated:", 0);
  -[PKAccountBillPaymentViewController view](self, "view");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67968]);

  objc_destroyWeak(&location);
}

PKContinuousButton *__46__PKAccountBillPaymentViewController_loadView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  PKContinuousButton *v7;
  void *v8;
  uint64_t v10;
  __int128 v11;
  int64x2_t v12;

  v5 = a3;
  v6 = a2;
  v10 = 0x402C000000000000;
  v11 = xmmword_19DEE0240;
  v12 = vdupq_n_s64(2uLL);
  v7 = -[PKContinuousButton initWithConfiguration:]([PKContinuousButton alloc], "initWithConfiguration:", &v10);
  -[PKContinuousButton setTintColor:](v7, "setTintColor:", v6);

  -[PKContinuousButton updateTitleColorWithColor:](v7, "updateTitleColorWithColor:", v5);
  -[PKContinuousButton updateActivityIndicatorColorWithColor:](v7, "updateActivityIndicatorColorWithColor:", v5);

  -[PKContinuousButton setContentEdgeInsets:](v7, "setContentEdgeInsets:", 0.0, 14.0, 0.0, 14.0);
  -[PKContinuousButton titleLabel](v7, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);

  return v7;
}

void __46__PKAccountBillPaymentViewController_loadView__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_showKeyboardButtonTapped:", v4);
}

void __46__PKAccountBillPaymentViewController_loadView__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "setExclusiveTouch:", 1);
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextAlignment:", 1);

  objc_msgSend(v2, "titleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setNumberOfLines:", 0);
}

void __46__PKAccountBillPaymentViewController_loadView__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_contactSupportButtonTapped:", v4);
}

void __46__PKAccountBillPaymentViewController_loadView__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "setExclusiveTouch:", 1);
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextAlignment:", 1);

  objc_msgSend(v2, "titleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setNumberOfLines:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSComparisonResult v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountBillPaymentViewController;
  -[PKAccountBillPaymentViewController traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[PKAccountBillPaymentViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v4 && v5)
  {
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = UIContentSizeCategoryCompareToCategory(v7, v6);

    if (v8 == NSOrderedSame)
      goto LABEL_10;
  }
  else if (!v5 || v4)
  {
    goto LABEL_10;
  }
  self->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v6, (UIContentSizeCategory)*MEMORY[0x1E0DC4918]) == NSOrderedDescending;
  -[PKAccountBillPaymentViewController viewIfLoaded](self, "viewIfLoaded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "setNeedsLayout");

LABEL_10:
}

- (void)viewWillLayoutSubviews
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  int v26;
  double v27;
  double v28;
  _BOOL4 v29;
  double v30;
  double v31;
  double v32;
  int *v33;
  double y;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGSize v45;
  double v46;
  double v47;
  double *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  UIScrollView *scrollView;
  void *v66;
  double v67;
  double v68;
  double v69;
  CGFloat rect;
  double rect_8;
  double rect_16;
  double rect_24;
  double v74;
  CGFloat v75;
  double v76;
  _QWORD v77[6];
  char v78;
  _BYTE v79[7];
  CGRect remainder;
  CGRect slice;
  objc_super v82;
  CGRect v83;
  CGRect v84;

  v82.receiver = self;
  v82.super_class = (Class)PKAccountBillPaymentViewController;
  v3 = -[PKAccountBillPaymentViewController viewWillLayoutSubviews](&v82, sel_viewWillLayoutSubviews);
  v4 = (void *)MEMORY[0x1A1AE621C](v3);
  self->_inLayoutSubviews = 1;
  -[PKAccountBillPaymentViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaInsets");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "bounds");
  v11 = v10;
  v13 = v12;
  v75 = v15;
  v76 = v14;
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:");
  memset(&slice, 0, sizeof(slice));
  objc_msgSend((id)objc_opt_class(), "contentMargins");
  objc_msgSend(v5, "pkui_readableContentBoundsWithMargins:");
  v17 = v16;
  v18 = PKUIGetMinScreenWidthType();
  v19 = 15.0;
  if (!v18)
    v19 = 10.0;
  rect_16 = v19;
  PKFloatRoundToPixel();
  v21 = fmin(v20, 360.0);
  v22 = fmin(v17, 360.0);
  v23 = __60__PKAccountBillPaymentViewController_viewWillLayoutSubviews__block_invoke(self->_secondaryButton);
  v24 = __60__PKAccountBillPaymentViewController_viewWillLayoutSubviews__block_invoke(self->_primaryButton);
  v25 = v23 <= v21 && v24 <= v21;
  if (v25 && self->_primaryButton && self->_secondaryButton)
  {
    v26 = 0;
  }
  else
  {
    v26 = 1;
    v21 = v22;
  }
  -[PKAccountBillPaymentViewController _buttonHeightForButtonWidth:](self, "_buttonHeightForButtonWidth:", v21);
  v28 = v27;
  remainder.origin.x = v11;
  remainder.origin.y = v76;
  remainder.size.width = v75;
  remainder.size.height = v13;
  rect = v11;
  rect_8 = v22;
  if (PKUIGetMinScreenWidthType())
  {
    v29 = -[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts");
    v30 = 19.0;
    if (!v29)
      v30 = 24.0;
    v31 = 35.0;
    if (v29)
      v31 = 24.0;
  }
  else
  {
    v30 = 19.0;
    v31 = 24.0;
  }
  v32 = v28 + v30;
  rect_24 = v17;
  v74 = v7;
  if (self->_showKeyboard)
  {
    v67 = v31;
    v33 = &OBJC_IVAR___PKAddCredentialToWatchViewController__heroCardView;
    v68 = v28;
    v69 = v13;
    if (PKViewVisibilityStateIsVisible())
    {
      x = *MEMORY[0x1E0C9D628];
      y = *(double *)(MEMORY[0x1E0C9D628] + 8);
      width = *(double *)(MEMORY[0x1E0C9D628] + 16);
      height = *(double *)(MEMORY[0x1E0C9D628] + 24);
      if (!CGRectIsNull(self->_keyboardFrame))
      {
        objc_msgSend(v5, "window");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        if (v38)
        {
          objc_msgSend(v38, "convertRect:fromWindow:", 0, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
          objc_msgSend(v5, "convertRect:fromView:", 0);
          x = v40;
          y = v41;
          width = v42;
          height = v43;
        }

        v33 = &OBJC_IVAR___PKAddCredentialToWatchViewController__heroCardView;
      }
    }
    else
    {
      x = self->_lastKeyboardFrame.origin.x;
      y = self->_lastKeyboardFrame.origin.y;
      width = self->_lastKeyboardFrame.size.width;
      height = self->_lastKeyboardFrame.size.height;
    }
    v83.origin.x = x;
    v83.origin.y = y;
    v83.size.width = width;
    v83.size.height = height;
    v46 = 0.0;
    if (!CGRectIsNull(v83) && (objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode") & 1) == 0)
    {
      v47 = fmax(v76 + v69 - y - v9, 0.0);
      v32 = v32 + v47;
      v46 = v47 + 0.0;
    }
    v48 = (double *)((char *)self + v33[740]);
    *v48 = x;
    v48[1] = y;
    v48[2] = width;
    v48[3] = height;
    v13 = v69;
    v31 = v67;
    v28 = v68;
    if (v26)
    {
LABEL_34:
      if (self->_primaryButton && self->_secondaryButton)
        v32 = v28 + 15.0 + v32;
    }
  }
  else
  {
    v44 = v28 + 3.0 + 3.0;
    if (!self->_tertiaryButton)
      v44 = -0.0;
    v32 = v32 + v44;
    v45 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    self->_lastKeyboardFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->_lastKeyboardFrame.size = v45;
    v46 = 0.0;
    if (v26)
      goto LABEL_34;
  }
  if (self->_showKeyboard || v9 <= 0.0 && !self->_tertiaryButton)
  {
    v49 = v28;
    if (v9 <= 0.0)
      v50 = v31;
    else
      v50 = v9;
    v32 = v50 + v32;
    v46 = v50 + v46;
  }
  else
  {
    v49 = v28;
  }
  v51 = v9 + v32;
  v84.origin.x = rect;
  v84.size.width = v75;
  v84.origin.y = v76;
  v84.size.height = v13;
  CGRectDivide(v84, &slice, &remainder, v9 + v32, CGRectMaxYEdge);
  -[_PKVisibilityBackdropView setFrame:](self->_blurringView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  -[_PKVisibilityBackdropView layoutIfNeeded](self->_blurringView, "layoutIfNeeded");
  -[UIScrollView contentInset](self->_scrollView, "contentInset");
  v52 = v9 + v32 - v9;
  if (v52 != v53)
    -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:");
  v54 = v9 + v46;
  -[UIScrollView verticalScrollIndicatorInsets](self->_scrollView, "verticalScrollIndicatorInsets");
  if (v52 != v55)
    -[UIScrollView setVerticalScrollIndicatorInsets:](self->_scrollView, "setVerticalScrollIndicatorInsets:");
  *(double *)v77 = rect_24;
  *(double *)&v77[1] = rect_8;
  *(double *)&v77[2] = v21;
  *(double *)&v77[3] = v49;
  *(double *)&v77[4] = rect_16;
  *(double *)&v77[5] = v54;
  v78 = v26;
  memset(v79, 0, sizeof(v79));
  -[PKAccountBillPaymentViewController _layoutFooterWithState:](self, "_layoutFooterWithState:", v77);
  -[PKAccountBillPaymentViewController _layoutScrollViewWithContentWidth:](self, "_layoutScrollViewWithContentWidth:", rect_24);
  v57 = v56;
  v59 = v58;
  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  if (v57 != v61 || v59 != v60)
    -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v57, v59);
  -[UIScrollView bounds](self->_scrollView, "bounds");
  if (v59 <= v63 - v74 - v51)
    v64 = 0.0;
  else
    v64 = fmin(fmax((v59 - v62 - (v13 - v51)) / (v13 - v51 + 8.0 - (v13 - v51)), 0.0), 1.0);
  -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_blurringView, "pkui_setVisibility:animated:", 0, v64);
  scrollView = self->_scrollView;
  -[PKAccountBillPaymentViewController navigationItem](self, "navigationItem");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:](scrollView, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v66);

  objc_autoreleasePoolPop(v4);
}

double __60__PKAccountBillPaymentViewController_viewWillLayoutSubviews__block_invoke(void *a1)
{
  id v1;
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  if (!a1)
    return 0.0;
  v1 = a1;
  objc_msgSend(v1, "contentEdgeInsets");
  v3 = v2;
  v5 = v4;
  objc_msgSend(v1, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pkui_sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v8 = v7;

  return v5 + v3 + v8;
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAccountBillPaymentViewController;
  -[PKAccountBillPaymentViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  self->_inLayoutSubviews = 0;
}

- (CGSize)_layoutScrollViewWithContentWidth:(double)a3
{
  double v5;
  uint64_t v6;
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
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 *v29;
  double v30;
  double v31;
  BOOL v32;
  UILabel *smallRingInterestLabel;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double (**v45)(_QWORD, double, double);
  double *v46;
  unint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  unint64_t v84;
  PKBillPaymentRingView *ringView;
  UILabel *titleLabel;
  UILabel *subtitleLabel;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  CGFloat sx;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  uint64_t v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  CATransform3D v122;
  CATransform3D v123;
  CATransform3D v124;
  __int128 v125;
  __int128 v126;
  _QWORD aBlock[7];
  uint64_t v128;
  double *v129;
  uint64_t v130;
  void *v131;
  __int128 v132;
  CGSize result;

  -[UIScrollView bounds](self->_scrollView, "bounds");
  v116 = v5;
  v106 = v6;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3, 1.79769313e308);
  v112 = v8;
  v114 = v7;
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", a3, 1.79769313e308);
  v108 = v10;
  v110 = v9;
  -[PKAccountBillPaymentAmountDescriptionView sizeThatFits:](self->_amountDescriptionView, "sizeThatFits:", a3, 1.79769313e308);
  v118 = v12;
  v120 = v11;
  v104 = a3;
  -[PKBillPaymentRingView sizeThatFits:](self->_ringView, "sizeThatFits:", a3, 1.79769313e308);
  v14 = v13;
  v16 = v15;
  -[UIImageView image](self->_productHeroView, "image");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "size");
  PKSizeAspectFit();
  v19 = v18;
  v21 = v20;

  objc_msgSend((id)objc_opt_class(), "smallRingSizeWithAccessibilityLayout:", self->_usesAccessibilityLayout);
  v24 = v22;
  v25 = v22 / v14;
  if (self->_showKeyboard)
    v26 = v23;
  else
    v26 = v16;
  if (!self->_showKeyboard)
    v22 = v14;
  v97 = v22;
  v99 = v26;
  v27 = 1.0;
  v102 = v25;
  if (self->_showKeyboard)
    v28 = v25;
  else
    v28 = 1.0;
  sx = v28;
  if (self->_showKeyboard)
    v27 = 0.05;
  v117 = v27;
  v29 = (__int128 *)MEMORY[0x1E0C9D538];
  v30 = *MEMORY[0x1E0C9D538];
  v31 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[UILabel setBounds:](self->_titleLabel, "setBounds:", *MEMORY[0x1E0C9D538], v31, v114, v112);
  -[UILabel setBounds:](self->_subtitleLabel, "setBounds:", v30, v31, v110, v108);
  -[PKAccountBillPaymentAmountDescriptionView setBounds:](self->_amountDescriptionView, "setBounds:", v30, v31, v120, v118);
  -[UIImageView setBounds:](self->_productHeroView, "setBounds:", v30, v31, v19, v21);
  -[PKBillPaymentRingView setBounds:](self->_ringView, "setBounds:", v30, v31, v14, v16);
  -[PKBillPaymentRingView layoutIfNeeded](self->_ringView, "layoutIfNeeded");
  v32 = -[PKAccountBillPaymentViewController _interestLabelIsOutsideSmallRing](self, "_interestLabelIsOutsideSmallRing");
  if (v32)
  {
    smallRingInterestLabel = self->_smallRingInterestLabel;
    v34 = v104;
    v35 = 1.79769313e308;
  }
  else
  {
    -[PKBillPaymentRingView ringWidth](self->_ringView, "ringWidth");
    v34 = v24 + v36 * -2.0 * v102 + -10.0;
    smallRingInterestLabel = self->_smallRingInterestLabel;
    v35 = v34;
  }
  -[UILabel sizeThatFits:](smallRingInterestLabel, "sizeThatFits:", v34, v35);
  v38 = v37;
  v40 = v39;
  -[UILabel setBounds:](self->_smallRingInterestLabel, "setBounds:", v30, v31, v37, v39);
  v42 = *MEMORY[0x1E0C9D648];
  v41 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v43 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v44 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v128 = 0;
  v129 = (double *)&v128;
  v130 = 0x3010000000;
  v131 = &unk_19E0C78CE;
  v132 = *v29;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKAccountBillPaymentViewController__layoutScrollViewWithContentWidth___block_invoke;
  aBlock[3] = &unk_1E3E65108;
  aBlock[4] = &v128;
  *(double *)&aBlock[5] = v116;
  aBlock[6] = v106;
  v45 = (double (**)(_QWORD, double, double))_Block_copy(aBlock);
  v46 = v129;
  v126 = *((_OWORD *)v129 + 2);
  if (self->_titleLabel)
  {
    v47 = PKUIGetMinScreenWidthType();
    v48 = 7.0;
    if (v47 > 3)
      v48 = 15.0;
    v46 = v129;
    v49 = v129[5] + v117 * v48;
  }
  else
  {
    if (!self->_subtitleLabel)
    {
      v105 = v41;
      v107 = v42;
      v101 = v44;
      v103 = v43;
      goto LABEL_25;
    }
    v49 = v129[5] + v117 * 20.0;
  }
  v46[5] = v49;
  v101 = v44;
  v103 = v43;
  v105 = v41;
  v107 = v42;
  if (self->_titleLabel)
  {
    v50 = v45[2](v45, v114 * v117, v112 * v117);
    v105 = v51;
    v107 = v50;
    v101 = v53;
    v103 = v52;
    v46 = v129;
    v129[5] = v129[5] + v117 * 15.0;
  }
  if (self->_subtitleLabel)
  {
    v42 = v45[2](v45, v110 * v117, v108 * v117);
    v41 = v54;
    v43 = v55;
    v44 = v56;
    v46 = v129;
  }
LABEL_25:
  if (self->_showKeyboard)
    *((_OWORD *)v46 + 2) = v126;
  v125 = *((_OWORD *)v46 + 2);
  v113 = v43;
  v115 = v41;
  v111 = v44;
  if (self->_featuredViewState == 1)
  {
    if (self->_showKeyboard)
      objc_msgSend((id)objc_opt_class(), "smallRingTopMargin");
    else
      objc_msgSend((id)objc_opt_class(), "ringTopMargin");
    v58 = v129 + 5;
    v60 = v129[5];
  }
  else
  {
    v59 = v46[5];
    v58 = v46 + 5;
    v57 = v59;
    v60 = 20.0;
  }
  *v58 = v60 + v57;
  v61 = v45[2](v45, v97, v99);
  v63 = v62;
  v65 = v64;
  v67 = v66;
  PKSizeAlignedInRect();
  v109 = v68;
  v98 = v70;
  v100 = v69;
  v96 = v71;
  if (!self->_featuredViewState)
    *((_OWORD *)v129 + 2) = v125;
  if (v32)
  {
    v129[5] = v129[5] + 8.0;
    v45[2](v45, v38, v40);
  }
  else
  {
    PKSizeAlignedInRect();
  }
  v91 = v75;
  v92 = v74;
  v93 = v73;
  v95 = v72;
  v76 = v42;
  v129[5] = v129[5] + 20.0;
  v77 = v45[2](v45, v120, v118);
  v119 = v79;
  v121 = v78;
  v80 = v77;
  v82 = v81;
  if (self->_showKeyboard)
    v83 = 0.0;
  else
    v83 = 1.0;
  -[UILabel setAlpha:](self->_titleLabel, "setAlpha:", v83);
  -[UILabel setAlpha:](self->_subtitleLabel, "setAlpha:", v83);
  -[UIButton setAlpha:](self->_tertiaryButton, "setAlpha:", v83);
  -[UIImageView setAlpha:](self->_productHeroView, "setAlpha:", v83);
  LOBYTE(v84) = self->_showKeyboard;
  -[UILabel setAlpha:](self->_smallRingInterestLabel, "setAlpha:", (double)v84);
  ringView = self->_ringView;
  CATransform3DMakeScale(&v124, sx, sx, 1.0);
  -[PKBillPaymentRingView setTransform3D:](ringView, "setTransform3D:", &v124);
  memset(&v123, 0, sizeof(v123));
  CATransform3DMakeScale(&v123, v117, v117, 1.0);
  titleLabel = self->_titleLabel;
  v122 = v123;
  -[UILabel setTransform3D:](titleLabel, "setTransform3D:", &v122);
  subtitleLabel = self->_subtitleLabel;
  v122 = v123;
  -[UILabel setTransform3D:](subtitleLabel, "setTransform3D:", &v122);
  __72__PKAccountBillPaymentViewController__layoutScrollViewWithContentWidth___block_invoke_2(self->_titleLabel, v107, v105, v103, v101);
  __72__PKAccountBillPaymentViewController__layoutScrollViewWithContentWidth___block_invoke_2(self->_subtitleLabel, v76, v115, v113, v111);
  __72__PKAccountBillPaymentViewController__layoutScrollViewWithContentWidth___block_invoke_2(self->_ringView, v61, v63, v65, v67);
  __72__PKAccountBillPaymentViewController__layoutScrollViewWithContentWidth___block_invoke_2(self->_productHeroView, v109, v100, v98, v96);
  __72__PKAccountBillPaymentViewController__layoutScrollViewWithContentWidth___block_invoke_2(self->_smallRingInterestLabel, v95, v93, v92, v91);
  __72__PKAccountBillPaymentViewController__layoutScrollViewWithContentWidth___block_invoke_2(self->_amountDescriptionView, v80, v121, v82, v119);
  v88 = fmax(v129[5], 0.0);

  _Block_object_dispose(&v128, 8);
  v89 = v116;
  v90 = v88;
  result.height = v90;
  result.width = v89;
  return result;
}

uint64_t __72__PKAccountBillPaymentViewController__layoutScrollViewWithContentWidth___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t result;

  result = PKSizeAlignedInRect();
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a3
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 40);
  return result;
}

void __72__PKAccountBillPaymentViewController__layoutScrollViewWithContentWidth___block_invoke_2(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  double v10;
  double v11;
  id v12;

  v9 = a1;
  objc_msgSend(v9, "layer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "anchorPoint");
  objc_msgSend(v9, "setCenter:", a2 + v10 * a4, a3 + v11 * a5);

}

- (void)_layoutFooterWithState:(id *)a3
{
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGRectEdge v14;
  UIButton *tertiaryButton;
  CGFloat height;
  UIButton *v17;
  UIButton *v18;
  PKLegacyButtonInterface *v19;
  PKLegacyButtonInterface *secondaryButton;
  PKLegacyButtonInterface *primaryButton;
  CGRect v22;
  CGRect slice;
  CGRect v24;
  CGRect v25;

  -[_UIBackdropView contentView](self->_blurringView, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&slice, 0, sizeof(slice));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  if (objc_msgSend(v5, "_shouldReverseLayoutDirection"))
    v14 = CGRectMaxXEdge;
  else
    v14 = CGRectMinXEdge;
  v24.origin.x = v7;
  v24.origin.y = v9;
  v24.size.width = v11;
  v24.size.height = v13;
  CGRectDivide(v24, &slice, &v22, a3->var4, CGRectMaxYEdge);
  tertiaryButton = self->_tertiaryButton;
  if (tertiaryButton)
  {
    -[UIButton sizeThatFits:](tertiaryButton, "sizeThatFits:", a3->var1, 1.79769313e308);
    height = a3->var2.height;
    if (self->_showKeyboard)
    {
      slice.origin.x = v22.origin.x;
      slice.origin.y = v22.origin.y + v22.size.height + 3.0;
      slice.size.width = v22.size.width;
      slice.size.height = height;
      v17 = self->_tertiaryButton;
      PKSizeAlignedInRect();
      -[UIButton setFrame:](v17, "setFrame:");
    }
    else
    {
      CGRectDivide(v22, &slice, &v22, 3.0, CGRectMaxYEdge);
      CGRectDivide(v22, &slice, &v22, a3->var2.height, CGRectMaxYEdge);
      v18 = self->_tertiaryButton;
      PKSizeAlignedInRect();
      -[UIButton setFrame:](v18, "setFrame:");
      CGRectDivide(v22, &slice, &v22, 3.0, CGRectMaxYEdge);
    }
  }
  if (!a3->var5)
  {
    PKSizeAlignedInRect();
    v22 = v25;
    CGRectDivide(v25, &v22, &slice, a3->var2.height, CGRectMaxYEdge);
    CGRectDivide(v22, &slice, &v22, a3->var2.width, v14);
    secondaryButton = self->_secondaryButton;
    PKSizeAlignedInRect();
    -[PKLegacyButtonInterface setFrame:](secondaryButton, "setFrame:");
    CGRectDivide(v22, &slice, &v22, a3->var3, v14);
    primaryButton = self->_primaryButton;
LABEL_16:
    PKSizeAlignedInRect();
    -[PKLegacyButtonInterface setFrame:](primaryButton, "setFrame:");
    goto LABEL_17;
  }
  if (self->_primaryButton)
  {
    CGRectDivide(v22, &slice, &v22, a3->var2.height, CGRectMaxYEdge);
    v19 = self->_primaryButton;
    PKSizeAlignedInRect();
    -[PKLegacyButtonInterface setFrame:](v19, "setFrame:");
    if (self->_primaryButton)
    {
      if (self->_secondaryButton)
        CGRectDivide(v22, &slice, &v22, 15.0, CGRectMaxYEdge);
    }
  }
  if (self->_secondaryButton)
  {
    CGRectDivide(v22, &slice, &v22, a3->var2.height, CGRectMaxYEdge);
    primaryButton = self->_secondaryButton;
    goto LABEL_16;
  }
LABEL_17:

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  PKAccountServiceAccountResolutionConfiguration *configuration;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKAccountBillPaymentViewController;
  -[PKAccountBillPaymentViewController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  self->_visibility = 1;
  -[PKAccountBillPaymentController setDelegate:](self->_billPaymentCoordinator, "setDelegate:", self);
  if (self->_hasAnimatedRing || !-[PKBillPaymentRingView isEnabled](self->_ringView, "isEnabled"))
    goto LABEL_14;
  -[PKBillPaymentSuggestedAmountList suggestedAmountWithCategory:](self->_suggestionList, "suggestedAmountWithCategory:", 18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "amount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PKBillPaymentSuggestedAmountList maximumAmount](self->_suggestionList, "maximumAmount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  configuration = self->_configuration;
  if (configuration)
  {
    v7 = -[PKAccountServiceAccountResolutionConfiguration billPayAmountType](configuration, "billPayAmountType");
    switch(v7)
    {
      case 3:
        -[PKAccountServiceAccountResolutionConfiguration billPayAmount](self->_configuration, "billPayAmount");
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 2:
        -[PKBillPaymentSuggestedAmountList minimumAmount](self->_suggestionList, "minimumAmount");
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 1:
        -[PKBillPaymentSuggestedAmountList remainingStatementAmount](self->_suggestionList, "remainingStatementAmount");
        v8 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v9 = (void *)v8;

        v5 = v9;
        break;
    }
  }
  -[PKBillPaymentRingView prepareForInitialDisplayWithAmount:](self->_ringView, "prepareForInitialDisplayWithAmount:", v5);

LABEL_14:
  if (self->_showKeyboard)
  {
    -[PKAccountBillPaymentViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsLayout");

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)PKAccountBillPaymentViewController;
  -[PKAccountBillPaymentViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  self->_visibility = 2;
  if (!self->_hasAnimatedRing)
  {
    -[PKBillPaymentRingView completeInitialDisplayAnimated:](self->_ringView, "completeInitialDisplayAnimated:", 1);
    self->_hasAnimatedRing = 1;
  }
  -[PKAccountBillPaymentViewController _showOrHideKeypad](self, "_showOrHideKeypad");
  if (self->_showKeyboard)
  {
    -[PKAccountBillPaymentViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

  }
  v7 = *MEMORY[0x1E0D68AA0];
  v8[0] = *MEMORY[0x1E0D68C50];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountBillPaymentViewController _reportEventForPassIfNecessary:](self, "_reportEventForPassIfNecessary:", v5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  CLInUseAssertion *CLInUse;
  CLInUseAssertion *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKAccountBillPaymentViewController;
  -[PKAccountBillPaymentViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  self->_visibility = 3;
  CLInUse = self->_CLInUse;
  if (CLInUse)
  {
    -[CLInUseAssertion invalidate](CLInUse, "invalidate");
    v5 = self->_CLInUse;
    self->_CLInUse = 0;

  }
  if (self->_showKeyboard)
  {
    -[PKAccountBillPaymentViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)PKAccountBillPaymentViewController;
  -[PKAccountBillPaymentViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  self->_visibility = 0;
  if (self->_showKeyboard)
  {
    -[PKAccountBillPaymentViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

  }
  v7 = *MEMORY[0x1E0D68AA0];
  v8[0] = *MEMORY[0x1E0D68C58];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountBillPaymentViewController _reportEventForPassIfNecessary:](self, "_reportEventForPassIfNecessary:", v5);

}

- (void)billPaymentRingView:(id)a3 selectedSuggestedAmount:(id)a4 selectedSuggestedAmountIsTarget:(BOOL)a5 userInitiatedChange:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v6 = a6;
  v7 = a5;
  v20[2] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (!self->_interstitialState)
  {
    -[PKBillPaymentSuggestedAmountList suggestedAmountGapMessageForStartSuggestedAmount:](self->_suggestionList, "suggestedAmountGapMessageForStartSuggestedAmount:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v7 || !v10)
    {
      objc_msgSend(v9, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v9;
    }
    else
    {
      objc_msgSend(v10, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11;
    }
    objc_msgSend(v13, "message");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentAmountDescriptionView setTitleText:](self->_amountDescriptionView, "setTitleText:", v12);
    -[PKAccountBillPaymentAmountDescriptionView setDescriptionText:](self->_amountDescriptionView, "setDescriptionText:", v14);
    -[PKAccountBillPaymentViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNeedsLayout");

    if (v6)
    {
      v16 = *MEMORY[0x1E0D687F8];
      v19[0] = *MEMORY[0x1E0D68AA0];
      v19[1] = v16;
      v17 = CFSTR("false");
      if (v7)
        v17 = CFSTR("true");
      v20[0] = *MEMORY[0x1E0D68800];
      v20[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountBillPaymentViewController _reportEventForPassIfNecessary:](self, "_reportEventForPassIfNecessary:", v18);

    }
  }

}

- (void)billPaymentRingView:(id)a3 amountChanged:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v8 = v5;
  if (self->_showKeyboard)
  {
    -[PKAccountBillPaymentViewController _paymentAmount](self, "_paymentAmount");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v5;
  }
  v7 = v6;
  -[PKAccountBillPaymentViewController _updatePayNowButtonTitleWithAmount:](self, "_updatePayNowButtonTitleWithAmount:", v6);

}

- (id)billPaymentRingView:(id)a3 topCurvedTextForSuggestedAmount:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;

  -[PKAccount feature](self->_account, "feature", a3, a4);
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountServiceAccountResolutionConfiguration earlyInstallmentPlan](self->_configuration, "earlyInstallmentPlan");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "totalBalance");
  else
    objc_msgSend(v5, "cardBalance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "amount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "compare:", v9);

  if (v10 == -1)
  {
    objc_msgSend(v7, "negativeValue");
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }
  objc_msgSend(v7, "formattedStringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v10 == -1)
    {
      v17 = v12;
      PKLocalizedFeatureString();
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v13;
    }
    -[PKAccountServiceAccountResolutionConfiguration earlyInstallmentPlan](self->_configuration, "earlyInstallmentPlan", v17);

    v17 = v12;
    PKLocalizedFeatureString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v14, "pk_uppercaseStringForPreferredLocale", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)billPaymentRingView:(id)a3 bottomCurvedTextForSuggestedAmount:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;

  v5 = a4;
  if (-[PKAccount showBillPaymentInterest](self->_account, "showBillPaymentInterest"))
  {
    -[PKAccount feature](self->_account, "feature");
    objc_msgSend(v5, "amount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentViewController _interestForAmount:](self, "_interestForAmount:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7
      && (objc_msgSend(MEMORY[0x1E0CB3598], "zero"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "compare:", v8),
          v8,
          v9 == 1))
    {
      -[PKAccountBillPaymentViewController _interestPostDate](self, "_interestPostDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](self->_interestDateFormatter, "stringFromDate:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PKAccount creditDetails](self->_account, "creditDetails");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "accountSummary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "unpostedInterest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "inGrace"))
        v15 = v11 == 0;
      else
        v15 = 1;
      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "compare:", v16);

      }
      PKLocalizedFeatureString();
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v12;

    objc_msgSend(v17, "pk_uppercaseStringForPreferredLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)disabledTopCurvedTextForBillPaymentRingView:(id)a3
{
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
  void *v15;

  -[PKAccount feature](self->_account, "feature", a3);
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_interstitialState - 1 > 2)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v4, "cardBalance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "amount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "compare:", v8);

    if (v9 == -1)
    {
      objc_msgSend(v6, "negativeValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "formattedStringValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v12;
    }
    else
    {
      objc_msgSend(v6, "formattedStringValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v5, "numberOfActiveStatementedInstallments", v15) >= 1)
    {
      -[PKAccountServiceAccountResolutionConfiguration earlyInstallmentPlan](self->_configuration, "earlyInstallmentPlan");

    }
    v15 = v10;
    PKLocalizedFeatureString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v11, "pk_uppercaseStringForPreferredLocale", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)disabledBottomCurvedTextForBillPaymentRingView:(id)a3
{
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  NSDecimalNumber *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  -[PKAccount feature](self->_account, "feature", a3);
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currencyCode");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_interstitialState - 1 > 2)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v6, "availableCredit");
    v8 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "formattedStringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v10, "pk_uppercaseStringForPreferredLocale", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)billPaymentRingView:(id)a3 interestTextForAmount:(id)a4
{
  return -[PKAccountBillPaymentViewController _interestStringForAmount:](self, "_interestStringForAmount:", a4);
}

- (id)billPaymentRingViewZeroInterestText:(id)a3
{
  NSNumberFormatter *amountFormatter;
  void *v4;
  void *v5;

  amountFormatter = self->_amountFormatter;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](amountFormatter, "stringFromNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateSmallRingInterestString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  __CFString *v9;
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
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  if (-[PKAccount showBillPaymentInterest](self->_account, "showBillPaymentInterest"))
  {
    -[PKAccountBillPaymentViewController _interestPostDate](self, "_interestPostDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentViewController _paymentAmount](self, "_paymentAmount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentViewController _interestStringForAmount:](self, "_interestStringForAmount:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKAccount feature](self->_account, "feature");
    -[PKBillPaymentRingView currentStartColor](self->_ringView, "currentStartColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[NSMutableDictionary setObject:forKey:](self->_smallRingInterestAttributes, "setObject:forKey:", v6, *MEMORY[0x1E0DC1140]);
    if (!v3 || !objc_msgSend(v5, "length"))
      goto LABEL_10;
    v7 = -[PKAccountBillPaymentViewController _interestLabelIsOutsideSmallRing](self, "_interestLabelIsOutsideSmallRing");
    v8 = objc_alloc(MEMORY[0x1E0CB3498]);
    v9 = v7 ? CFSTR("%@ ") : CFSTR("%@\n");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithString:attributes:", v10, self->_smallRingInterestAttributes);

    -[NSDateFormatter stringFromDate:](self->_interestDateFormatter, "stringFromDate:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pk_uppercaseStringForPreferredLocale", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v14, self->_smallRingInterestDateAttributes);
    v16 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v16, "appendAttributedString:", v15);
    v24 = (id)objc_msgSend(v16, "copy");

    if (!v24)
    {
LABEL_10:
      -[PKAccount creditDetails](self->_account, "creditDetails");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "accountSummary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "unpostedInterest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "inGrace"))
        v20 = v19 == 0;
      else
        v20 = 1;
      if (!v20)
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "compare:", v21);

      }
      PKLocalizedFeatureString();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pk_uppercaseStringForPreferredLocale");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v23, self->_smallRingInterestDateAttributes);
    }
    -[UILabel setAttributedText:](self->_smallRingInterestLabel, "setAttributedText:", v24);

  }
}

- (void)billPaymentAmountDescriptionView:(id)a3 hasChangedAmount:(id)a4 isValidAmount:(BOOL)a5
{
  _BOOL8 v5;
  PKBillPaymentRingView *ringView;
  id v8;
  id v9;

  v5 = a5;
  ringView = self->_ringView;
  v8 = a4;
  -[PKBillPaymentRingView setAmount:animated:userInitiatedWithKeypad:](ringView, "setAmount:animated:userInitiatedWithKeypad:", v8, 1, 1);
  -[PKAccountBillPaymentViewController _updatePayNowButtonTitleWithAmount:](self, "_updatePayNowButtonTitleWithAmount:", v8);

  -[PKAccountBillPaymentViewController _setPayButtonsEnabled:](self, "_setPayButtonsEnabled:", v5);
  -[PKAccountBillPaymentViewController _updateSmallRingInterestString](self, "_updateSmallRingInterestString");
  -[PKBillPaymentRingView setNeedsLayout](self->_ringView, "setNeedsLayout");
  -[PKAccountBillPaymentViewController view](self, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsLayout");

}

- (void)billPaymentAmountDescriptionViewHasTappedLearnMore:(id)a3
{
  PKAccountBillPaymentLearnMoreViewController *v4;
  PKNavigationController *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = -[PKAccountBillPaymentLearnMoreViewController initWithAccount:]([PKAccountBillPaymentLearnMoreViewController alloc], "initWithAccount:", self->_account);
  v5 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v4);
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    -[PKNavigationController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 3);
    -[PKAccountBillPaymentViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:withTransition:completion:", v5, 8, 0);
  }
  else
  {
    -[PKAccountBillPaymentViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);
  }

  v7 = *MEMORY[0x1E0D68B18];
  v8 = *MEMORY[0x1E0D68858];
  v11[0] = *MEMORY[0x1E0D68AA0];
  v11[1] = v8;
  v9 = *MEMORY[0x1E0D68DB0];
  v12[0] = v7;
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountBillPaymentViewController _reportEventForPassIfNecessary:](self, "_reportEventForPassIfNecessary:", v10);

}

- (void)accountBillPaymentController:(id)a3 hasChangedState:(unint64_t)a4 error:(id)a5 updatedAccount:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  PKAccountBillPaymentConfirmationViewController *v20;
  PKAccountBillPaymentConfirmationViewController *v21;
  _QWORD v22[4];
  PKAccountBillPaymentConfirmationViewController *v23;
  id v24;
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  self->_performingAction = 0;
  switch(a4)
  {
    case 2uLL:
      -[PKAccountBillPaymentViewController _setEnabled:](self, "_setEnabled:", 1);
      -[PKAccountBillPaymentViewController _showOrHideKeypad](self, "_showOrHideKeypad");
      -[PKBillPaymentSuggestedAmountController recordPaymentActionWithDifferentialPrivacy:](self->_suggestedAmountController, "recordPaymentActionWithDifferentialPrivacy:", 0);
      -[PKBillPaymentSuggestedAmountController recordPaymentRingAction:](self->_suggestedAmountController, "recordPaymentRingAction:", 1);
      break;
    case 1uLL:
      if (v12)
        -[PKAccountBillPaymentViewController _setAccount:](self, "_setAccount:", v12);
      WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[PKAccountBillPaymentController payments](self->_billPaymentCoordinator, "payments");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "accountBillPaymentViewController:didSchedulePayments:", self, v15);

      }
      if (-[PKBillPaymentRingView isSmall](self->_ringView, "isSmall"))
        v16 = 3;
      else
        v16 = 1;
      -[PKBillPaymentSuggestedAmountController recordPaymentActionWithDifferentialPrivacy:](self->_suggestedAmountController, "recordPaymentActionWithDifferentialPrivacy:", v16);
      if (-[PKBillPaymentRingView isSmall](self->_ringView, "isSmall"))
        v17 = 2;
      else
        v17 = 4;
      -[PKBillPaymentSuggestedAmountController recordPaymentRingAction:](self->_suggestedAmountController, "recordPaymentRingAction:", v17);
      -[PKAccountBillPaymentController payments](self->_billPaymentCoordinator, "payments");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "count"))
      {
        -[PKTransactionSource paymentPass](self->_transactionSource, "paymentPass");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[PKAccountBillPaymentConfirmationViewController initWithAccount:previousAccountSummary:paymentPass:payments:suggestionList:interestForPaymentTotal:interestForStatementBalance:]([PKAccountBillPaymentConfirmationViewController alloc], "initWithAccount:previousAccountSummary:paymentPass:payments:suggestionList:interestForPaymentTotal:interestForStatementBalance:", self->_account, self->_previousAccountSummary, v19, v18, self->_suggestionList, self->_interestForPaymentTotal, self->_interestForStatementBalance);
        objc_initWeak(&location, self);
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __104__PKAccountBillPaymentViewController_accountBillPaymentController_hasChangedState_error_updatedAccount___block_invoke;
        v22[3] = &unk_1E3E62FA0;
        objc_copyWeak(&v24, &location);
        v21 = v20;
        v23 = v21;
        -[PKAccountBillPaymentConfirmationViewController preflightWithCompletion:](v21, "preflightWithCompletion:", v22);

        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);

      }
      else
      {
        -[PKAccountBillPaymentViewController _dismissViewControllerWithSuccess:](self, "_dismissViewControllerWithSuccess:", 1);
      }

      break;
    case 0uLL:
      -[PKAccountBillPaymentViewController _presentAlertControllerForError:](self, "_presentAlertControllerForError:", v11);
      break;
  }

}

void __104__PKAccountBillPaymentViewController_accountBillPaymentController_hasChangedState_error_updatedAccount___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __104__PKAccountBillPaymentViewController_accountBillPaymentController_hasChangedState_error_updatedAccount___block_invoke_2;
  v2[3] = &unk_1E3E61B68;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

void __104__PKAccountBillPaymentViewController_accountBillPaymentController_hasChangedState_error_updatedAccount___block_invoke_2(uint64_t a1)
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

  -[PKAccountBillPaymentViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)accountAutomaticPaymentsController:(id)a3 didSchedulePayment:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "accountBillPaymentViewController:didSchedulePayments:", self, v7);

  }
}

- (void)accountAutomaticPaymentsControllerDidSelectSetupCompletionDone:(id)a3 viewController:(id)a4
{
  -[PKAccountBillPaymentViewController _dismissViewControllerWithSuccess:](self, "_dismissViewControllerWithSuccess:", 1, a4);
}

- (id)presentationSceneIdentifierForAccountAutomaticPaymentsController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKAccountBillPaymentViewController view](self, "view", a3);
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
  v3[2] = __87__PKAccountBillPaymentViewController_addBankAccountInformationViewControllerDidFinish___block_invoke;
  v3[3] = &unk_1E3E612E8;
  v3[4] = self;
  -[PKAccountBillPaymentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
}

void __87__PKAccountBillPaymentViewController_addBankAccountInformationViewControllerDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1312);
  *(_QWORD *)(v2 + 1312) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_showOrHideKeypad");
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[126];
  objc_msgSend(v4, "_paymentAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__PKAccountBillPaymentViewController_addBankAccountInformationViewControllerDidFinish___block_invoke_2;
  v7[3] = &unk_1E3E65130;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "canPerformBillPaymentWithAmount:scheduledDate:completion:", v6, 0, v7);

}

void __87__PKAccountBillPaymentViewController_addBankAccountInformationViewControllerDidFinish___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = v5;
    objc_msgSend(*(id *)(a1 + 32), "_payNowButtonTapped:", 0);
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

- (void)_performBillPaymentWithAmount:(id)a3 billPaymentSuggestedAmountDataEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  CLInUseAssertion *v10;
  CLInUseAssertion *CLInUse;
  NSObject *v12;
  void *v13;
  PKCreditAccountSummary *v14;
  PKCreditAccountSummary *previousAccountSummary;
  NSDecimalNumber *v16;
  NSDecimalNumber *interestForPaymentTotal;
  void *v18;
  NSDecimalNumber *v19;
  NSDecimalNumber *interestForStatementBalance;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_CLInUse)
  {
    v8 = (void *)MEMORY[0x1E0C9E3A8];
    PKPassKitCoreBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (CLInUseAssertion *)objc_msgSend(v8, "newAssertionForBundle:withReason:", v9, CFSTR("Perform Account Service Now Payment"));
    CLInUse = self->_CLInUse;
    self->_CLInUse = v10;

  }
  if (self->_performingAction)
  {
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315138;
      v22 = "-[PKAccountBillPaymentViewController _performBillPaymentWithAmount:billPaymentSuggestedAmountDataEvent:]";
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "%s: Cannot Present - already performing action", (uint8_t *)&v21, 0xCu);
    }

  }
  else
  {
    self->_performingAction = 1;
    -[PKAccountBillPaymentViewController _setEnabled:](self, "_setEnabled:", 0);
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accountSummary");
    v14 = (PKCreditAccountSummary *)objc_claimAutoreleasedReturnValue();
    previousAccountSummary = self->_previousAccountSummary;
    self->_previousAccountSummary = v14;

    -[PKAccountBillPaymentViewController _roundedInterestForAmount:](self, "_roundedInterestForAmount:", v6);
    v16 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    interestForPaymentTotal = self->_interestForPaymentTotal;
    self->_interestForPaymentTotal = v16;

    -[PKCreditAccountSummary remainingStatementBalance](self->_previousAccountSummary, "remainingStatementBalance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentViewController _roundedInterestForAmount:](self, "_roundedInterestForAmount:", v18);
    v19 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    interestForStatementBalance = self->_interestForStatementBalance;
    self->_interestForStatementBalance = v19;

    -[PKAccountBillPaymentController performBillPaymentActionWithAmount:billPaymentSuggestedAmountDataEvent:](self->_billPaymentCoordinator, "performBillPaymentActionWithAmount:billPaymentSuggestedAmountDataEvent:", v6, v7);
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[PKAccountBillPaymentViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)accountServiceAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  -[PKAccountBillPaymentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, a5, 0);
}

- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4
{
  if (objc_msgSend(a4, "userInterfaceStyle", a3) == 2)
    return 2030;
  else
    return 2010;
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
    v6[2] = __56__PKAccountBillPaymentViewController__accountDidChange___block_invoke;
    v6[3] = &unk_1E3E61D40;
    v6[4] = self;
    objc_msgSend(v4, "accountWithIdentifier:completion:", v5, v6);

  }
}

void __56__PKAccountBillPaymentViewController__accountDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__PKAccountBillPaymentViewController__accountDidChange___block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __56__PKAccountBillPaymentViewController__accountDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAccount:", *(_QWORD *)(a1 + 40));
}

- (void)_setAccount:(id)a3
{
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = -[PKAccount isContentEqualToAccount:](self->_account, "isContentEqualToAccount:");
  objc_storeStrong((id *)&self->_account, a3);
  if ((v5 & 1) == 0)
  {
    -[PKCompoundInterestCalculator configuration](self->_interestCalculator, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateWithCreditAccount:", v7);

    -[NSMutableDictionary removeAllObjects](self->_cachedInterestResults, "removeAllObjects");
  }

}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__PKAccountBillPaymentViewController_keyboardWillShow___block_invoke;
  v7[3] = &unk_1E3E618F0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PKAccountBillPaymentViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v7);

}

BOOL __55__PKAccountBillPaymentViewController_keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  CGRect v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(double *)(v2 + 1136);
  v4 = *(double *)(v2 + 1144);
  v5 = *(double *)(v2 + 1152);
  v6 = *(double *)(v2 + 1160);
  *(_BYTE *)(v2 + 1129) = 1;
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v9 = (_QWORD *)(v8 + 1136);
  if (v7)
  {
    objc_msgSend(v7, "CGRectValue");
    *v9 = v10;
    v9[1] = v11;
    v9[2] = v12;
    v9[3] = v13;
  }
  else
  {
    v14 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)v9 = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v8 + 1152) = v14;
  }
  v16.origin.x = v3;
  v16.origin.y = v4;
  v16.size.width = v5;
  v16.size.height = v6;
  return !CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1136), v16);
}

- (void)keyboardWillChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if (self->_keyboardVisible)
  {
    objc_msgSend(a3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v5 = v6;
    if (v6)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __57__PKAccountBillPaymentViewController_keyboardWillChange___block_invoke;
      v7[3] = &unk_1E3E618F0;
      v7[4] = self;
      v8 = v6;
      -[PKAccountBillPaymentViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v7);

      v5 = v6;
    }

  }
}

BOOL __57__PKAccountBillPaymentViewController_keyboardWillChange___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGRect v13;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2 + 142;
  v4 = *((double *)v2 + 142);
  v5 = *((double *)v2 + 143);
  v6 = *((double *)v2 + 144);
  v7 = *((double *)v2 + 145);
  objc_msgSend(*(id *)(a1 + 40), "CGRectValue");
  *v3 = v8;
  v3[1] = v9;
  v3[2] = v10;
  v3[3] = v11;
  v13.origin.x = v4;
  v13.origin.y = v5;
  v13.size.width = v6;
  v13.size.height = v7;
  return !CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 1136), v13);
}

- (void)keyboardWillHide:(id)a3
{
  _QWORD v3[5];

  if (self->_keyboardVisible)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __55__PKAccountBillPaymentViewController_keyboardWillHide___block_invoke;
    v3[3] = &unk_1E3E61918;
    v3[4] = self;
    -[PKAccountBillPaymentViewController _updateLayoutForKeyboardAction:](self, "_updateLayoutForKeyboardAction:", v3);
  }
}

BOOL __55__PKAccountBillPaymentViewController_keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _OWORD *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGRect v8;

  v1 = *(_QWORD *)(a1 + 32);
  v8 = *(CGRect *)(v1 + 1136);
  *(_BYTE *)(v1 + 1129) = 0;
  v2 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 1136);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *v2 = *MEMORY[0x1E0C9D628];
  v2[1] = v3;
  *(_QWORD *)&v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1136);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1144);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1152);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1160);
  return !CGRectEqualToRect(*(CGRect *)&v3, v8);
}

- (void)_updateLayoutForKeyboardAction:(id)a3
{
  uint64_t (**v4)(_QWORD);
  void *v5;
  int IsVisible;
  int v7;
  int v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = (uint64_t (**)(_QWORD))a3;
  if (v4)
  {
    if (self->_showKeyboard)
    {
      -[PKAccountBillPaymentViewController viewIfLoaded](self, "viewIfLoaded");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    IsVisible = PKViewVisibilityStateIsVisible();
    v7 = IsVisible;
    if (v5 && IsVisible)
      objc_msgSend(v5, "layoutIfNeeded");
    v8 = v4[2](v4);
    if (v5)
    {
      if (v8)
      {
        objc_msgSend(v5, "setNeedsLayout");
        if (v7)
        {
          v9 = (void *)MEMORY[0x1E0DC3F10];
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 3221225472;
          v10[2] = __69__PKAccountBillPaymentViewController__updateLayoutForKeyboardAction___block_invoke;
          v10[3] = &unk_1E3E612E8;
          v11 = v5;
          objc_msgSend(v9, "_animateUsingDefaultTimingWithOptions:animations:completion:", 134, v10, 0);

        }
      }
    }

  }
}

uint64_t __69__PKAccountBillPaymentViewController__updateLayoutForKeyboardAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_cancelButtonTapped:(id)a3
{
  id v4;

  -[PKAccountBillPaymentAmountDescriptionView dismissKeyboard](self->_amountDescriptionView, "dismissKeyboard", a3);
  -[PKAccountBillPaymentViewController presentingViewController](self, "presentingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_contactSupportButtonTapped:(id)a3
{
  PKBusinessChatInstallmentPaymentContext *v4;
  PKAccount *account;
  void *v6;
  id v7;
  PKAccountServiceAccountResolutionController *v8;
  PKAccount *v9;
  PKAccountUserCollection *accountUserCollection;
  void *v11;
  PKAccountServiceAccountResolutionController *v12;
  PKAccountServiceAccountResolutionController *accountResolutionController;
  uint64_t v14;
  PKBusinessChatInstallmentPaymentContext *v15;

  v4 = [PKBusinessChatInstallmentPaymentContext alloc];
  account = self->_account;
  -[PKTransactionSource paymentPass](self->_transactionSource, "paymentPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PKBusinessChatInstallmentPaymentContext initWithAccount:paymentPass:](v4, "initWithAccount:paymentPass:", account, v6);

  v7 = objc_alloc_init(MEMORY[0x1E0D668F0]);
  objc_msgSend(v7, "setBusinessChatContext:", v15);
  if (!self->_accountResolutionController)
  {
    v8 = [PKAccountServiceAccountResolutionController alloc];
    v9 = self->_account;
    accountUserCollection = self->_accountUserCollection;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67738]), "initWithTransactionSource:", self->_transactionSource);
    v12 = -[PKAccountServiceAccountResolutionController initWithAccount:accountUserCollection:transactionSourceCollection:](v8, "initWithAccount:accountUserCollection:transactionSourceCollection:", v9, accountUserCollection, v11);
    accountResolutionController = self->_accountResolutionController;
    self->_accountResolutionController = v12;

    -[PKAccountServiceAccountResolutionController setDelegate:](self->_accountResolutionController, "setDelegate:", self);
  }
  if (+[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat"))
  {
    v14 = 3;
  }
  else
  {
    v14 = 2;
  }
  -[PKAccountServiceAccountResolutionController presentFlowForAccountResolution:configuration:completion:](self->_accountResolutionController, "presentFlowForAccountResolution:configuration:completion:", v14, v7, 0);

}

- (void)_showKeyboardButtonTapped:(id)a3
{
  -[PKAccountBillPaymentViewController _setShowKeyboard:](self, "_setShowKeyboard:", 1);
}

- (void)_tappedSmallRingView:(id)a3
{
  -[PKAccountBillPaymentViewController _setShowKeyboard:](self, "_setShowKeyboard:", 0);
}

- (void)_tappedNormalRingViewAmount:(id)a3
{
  -[PKAccountBillPaymentViewController _setShowKeyboard:](self, "_setShowKeyboard:", 1);
}

- (void)_setShowKeyboard:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 showKeyboard;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  if (((!self->_showKeyboard ^ a3) & 1) == 0)
  {
    v3 = a3;
    -[PKAccountBillPaymentViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");
    self->_showKeyboard = v3;
    objc_msgSend(v5, "setNeedsLayout");
    if (v3)
    {
      -[PKBillPaymentRingView amount](self->_ringView, "amount");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountBillPaymentAmountDescriptionView setAmount:](self->_amountDescriptionView, "setAmount:", v6);

      -[PKAccountBillPaymentViewController _updateNavigationTitle](self, "_updateNavigationTitle");
      -[PKAccountBillPaymentViewController _updateForShowKeyboardAnimated:](self, "_updateForShowKeyboardAnimated:", 1);
      -[PKAccountBillPaymentViewController _showOrHideKeypad](self, "_showOrHideKeypad");
    }
    else
    {
      -[PKAccountBillPaymentViewController _updateNavigationTitle](self, "_updateNavigationTitle");
      -[PKAccountBillPaymentViewController _updateForShowKeyboardAnimated:](self, "_updateForShowKeyboardAnimated:", 1);
      -[PKAccountBillPaymentViewController _showOrHideKeypad](self, "_showOrHideKeypad");
      -[PKAccountBillPaymentViewController _setPayButtonsEnabled:](self, "_setPayButtonsEnabled:", 1);
      -[PKAccountBillPaymentViewController _paymentAmount](self, "_paymentAmount");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountBillPaymentViewController _updatePayNowButtonTitleWithAmount:](self, "_updatePayNowButtonTitleWithAmount:", v7);

      -[PKAccountBillPaymentAmountDescriptionView normalizeEnteredAmount](self->_amountDescriptionView, "normalizeEnteredAmount");
    }
    -[UIScrollView pkui_naturalRestingBounds](self->_scrollView, "pkui_naturalRestingBounds");
    v9 = v8;
    v11 = v10;
    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
    if (v9 != v13 || v11 != v12)
      -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 1, v9, v11);
    v15 = *MEMORY[0x1E0D68B18];
    v16 = *MEMORY[0x1E0D68858];
    showKeyboard = self->_showKeyboard;
    v21[0] = *MEMORY[0x1E0D68AA0];
    v21[1] = v16;
    v18 = (uint64_t *)MEMORY[0x1E0D69560];
    if (!showKeyboard)
      v18 = (uint64_t *)MEMORY[0x1E0D68CF8];
    v19 = *v18;
    v22[0] = v15;
    v22[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentViewController _reportEventForPassIfNecessary:](self, "_reportEventForPassIfNecessary:", v20);

  }
}

- (void)_updateForShowKeyboardAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void **v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  BOOL showKeyboard;
  void (**v13)(void *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  BOOL v19;
  id location;
  _QWORD aBlock[5];
  id v22;
  BOOL v23;

  v3 = a3;
  if (self->_showKeyboard)
    v5 = 1280;
  else
    v5 = 1272;
  v6 = (void **)((char *)&self->super.super.super.isa + v5);
  if (*(Class *)((char *)&self->super.super.super.isa + v5))
  {
    -[PKBillPaymentRingView removeGestureRecognizer:](self->_ringView, "removeGestureRecognizer:");
    v7 = *v6;
    *v6 = 0;

  }
  -[PKAccountBillPaymentViewController viewIfLoaded](self, "viewIfLoaded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__PKAccountBillPaymentViewController__updateForShowKeyboardAnimated___block_invoke;
    aBlock[3] = &unk_1E3E64908;
    aBlock[4] = self;
    v23 = v3;
    v22 = v8;
    v11 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_initWeak(&location, self);
    showKeyboard = self->_showKeyboard;
    v14 = v10;
    v15 = 3221225472;
    v16 = __69__PKAccountBillPaymentViewController__updateForShowKeyboardAnimated___block_invoke_2;
    v17 = &unk_1E3E62FC8;
    objc_copyWeak(&v18, &location);
    v19 = showKeyboard;
    v13 = (void (**)(void *, uint64_t))_Block_copy(&v14);
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 134, v11, v13, v14, v15, v16, v17);
    }
    else
    {
      v11[2](v11);
      v13[2](v13, 1);
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
}

uint64_t __69__PKAccountBillPaymentViewController__updateForShowKeyboardAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1208), "setShowAmount:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1128));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "setIsSmall:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1128));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 1128))
  {
    v3 = PKUIGetMinScreenType();
    v2 = *(_QWORD *)(a1 + 32);
    if (v3 < 4)
    {
      v4 = 0;
    }
    else if (*(_BYTE *)(v2 + 1127))
    {
      v4 = objc_msgSend((id)v2, "pkui_userInterfaceIdiomSupportsLargeLayouts");
      v2 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v4 = 1;
    }
    if (v3 > 7)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v4 = 1;
    v5 = 1;
  }
  objc_msgSend(*(id *)(v2 + 1208), "setShowDescriptionLabels:", v4);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1208), "setShowDescriptionSubtitle:", v5);
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  return result;
}

void __69__PKAccountBillPaymentViewController__updateForShowKeyboardAnimated___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      if (*((_BYTE *)WeakRetained + 1128) && !*((_QWORD *)WeakRetained + 159) && *((_QWORD *)WeakRetained + 152))
      {
        v8 = WeakRetained;
        v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", WeakRetained, sel__tappedSmallRingView_);
        v4 = (void *)*((_QWORD *)v8 + 159);
        *((_QWORD *)v8 + 159) = v3;

        objc_msgSend(*((id *)v8 + 152), "addGestureRecognizer:", *((_QWORD *)v8 + 159));
LABEL_11:
        WeakRetained = v8;
      }
    }
    else if (!*((_BYTE *)WeakRetained + 1128) && !*((_QWORD *)WeakRetained + 160) && *((_QWORD *)WeakRetained + 152))
    {
      v8 = WeakRetained;
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", WeakRetained, sel__tappedNormalRingViewAmount_);
      v6 = (void *)*((_QWORD *)v8 + 160);
      *((_QWORD *)v8 + 160) = v5;

      objc_msgSend(*((id *)v8 + 152), "enterCurrencyAmountView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addGestureRecognizer:", *((_QWORD *)v8 + 160));

      goto LABEL_11;
    }
  }

}

- (void)_payNowButtonTapped:(id)a3
{
  void *v4;
  PKAccountBillPaymentController *billPaymentCoordinator;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

  }
  else
  {
    -[PKAccountBillPaymentViewController _paymentAmount](self, "_paymentAmount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentViewController _setEnabled:](self, "_setEnabled:", 0);
    billPaymentCoordinator = self->_billPaymentCoordinator;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__PKAccountBillPaymentViewController__payNowButtonTapped___block_invoke;
    v8[3] = &unk_1E3E64E38;
    v8[4] = self;
    v9 = v4;
    v6 = v4;
    -[PKAccountBillPaymentController canPerformBillPaymentWithAmount:scheduledDate:completion:](billPaymentCoordinator, "canPerformBillPaymentWithAmount:scheduledDate:completion:", v6, 0, v8);

  }
}

void __58__PKAccountBillPaymentViewController__payNowButtonTapped___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "accountIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "creditDetails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountSummary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentStatement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "billPaymentSelectedSuggestedAmountDataEventForAmount:accountIdentifier:statementIdentifier:", *(_QWORD *)(a1 + 40), v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_performBillPaymentWithAmount:billPaymentSuggestedAmountDataEvent:", *(_QWORD *)(a1 + 40), v11);

  }
  else
  {
    v12 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v12, "_presentAlertControllerForError:", v5);
    }
    else
    {
      objc_msgSend(v12, "_presentAddBankAccount");
      objc_msgSend(*(id *)(a1 + 32), "_setEnabled:", 1);
    }
  }
  v13 = *(void **)(a1 + 32);
  v14 = *MEMORY[0x1E0D68858];
  v17[0] = *MEMORY[0x1E0D68AA0];
  v17[1] = v14;
  v15 = *MEMORY[0x1E0D69088];
  v18[0] = *MEMORY[0x1E0D68B18];
  v18[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_reportEventForPassIfNecessary:", v16);

}

- (void)_payLaterButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id location;

  v4 = a3;
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

  }
  else
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke;
    v8[3] = &unk_1E3E651E8;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    objc_msgSend(v6, "scheduledPaymentsWithAccountIdentifier:includeFailedRecurringPayments:completion:", v7, 1, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  BOOL v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id *v40;
  uint64_t v41;
  BOOL v42;
  _QWORD v43[5];
  _QWORD v44[2];
  _QWORD v45[4];

  v45[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "pk_objectsPassingTest:", &__block_literal_global_154);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = WeakRetained[121];
    objc_msgSend(v4, "feature");
    v35 = objc_msgSend(v3, "count") != 0;
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedFeatureString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke_4;
    v43[3] = &unk_1E3E61D68;
    v43[4] = WeakRetained;
    objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, v43);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68080]);
    if ((objc_msgSend(v4, "isClosedAndChargedOff") & 1) == 0)
    {
      objc_msgSend(v4, "creditDetails");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "accountSummary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "paymentDueDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = objc_alloc(MEMORY[0x1E0C99D48]);
        v33 = (void *)objc_msgSend(v12, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "components:fromDate:toDate:options:", 16, v13, v11, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v8;
        v16 = objc_msgSend(v14, "day");

        v17 = v16 <= 0;
        v8 = v15;
        v18 = !v17;
        objc_msgSend(v15, "setEnabled:", v18);

      }
    }
    objc_msgSend(v5, "addAction:", v8);
    PKLocalizedFeatureString();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0DC3448];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke_5;
    v37[3] = &unk_1E3E651C0;
    v42 = v35;
    v38 = v4;
    v39 = v3;
    v21 = *(_QWORD *)(a1 + 40);
    v40 = WeakRetained;
    v41 = v21;
    v36 = v3;
    v34 = v4;
    v22 = (void *)v19;
    objc_msgSend(v20, "actionWithTitle:style:handler:", v19, 0, v37);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67F48]);
    objc_msgSend(v5, "addAction:", v23);
    v24 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedFeatureString();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "actionWithTitle:style:handler:", v25, 1, 0);
    v26 = v8;
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AF8]);
    objc_msgSend(v5, "addAction:", v27);
    objc_msgSend(v5, "popoverPresentationController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setSourceView:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1256));
    objc_msgSend(v28, "setPermittedArrowDirections:", 2);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v5, 1, 0);
    v29 = *MEMORY[0x1E0D68B18];
    v30 = *MEMORY[0x1E0D68858];
    v44[0] = *MEMORY[0x1E0D68AA0];
    v44[1] = v30;
    v31 = *MEMORY[0x1E0D69058];
    v45[0] = v29;
    v45[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_reportEventForPassIfNecessary:", v32);

    objc_msgSend(WeakRetained[127], "recordPaymentActionWithDifferentialPrivacy:", 2);
    objc_msgSend(WeakRetained[127], "recordPaymentRingAction:", 3);

  }
}

uint64_t __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isRecurring");
}

void __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke_4(uint64_t a1)
{
  PKAccountBillPaymentPayLaterViewController *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  PKAccountBillPaymentPayLaterViewController *v12;

  v2 = [PKAccountBillPaymentPayLaterViewController alloc];
  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[121];
  v5 = v3[168];
  v6 = v3[126];
  v7 = v3[122];
  v8 = v3[128];
  objc_msgSend(v3, "_paymentAmount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PKAccountBillPaymentPayLaterViewController initWithAccount:accountUserCollection:billPaymentController:transactionSource:suggestionList:selectedAmount:](v2, "initWithAccount:accountUserCollection:billPaymentController:transactionSource:suggestionList:selectedAmount:", v4, v5, v6, v7, v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1352));
  -[PKAccountBillPaymentPayLaterViewController setObserver:](v12, "setObserver:", WeakRetained);

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pushViewController:animated:", v12, 1);

}

void __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke_5(uint64_t a1)
{
  void *v2;
  PKCreditAccountPaymentDetailsViewController *v3;
  uint64_t v4;
  void *v5;
  PKCreditAccountPaymentDetailsViewController *v6;
  void *v7;
  PKAccountAutomaticPaymentsController *v8;
  _QWORD v9[4];
  int8x16_t v10;

  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 64))
  {
    v3 = [PKCreditAccountPaymentDetailsViewController alloc];
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKCreditAccountPaymentDetailsViewController initWithAccount:payment:paymentWebService:overrideViewStyle:](v3, "initWithAccount:payment:paymentWebService:overrideViewStyle:", v4, v5, v2, 2);

    objc_msgSend(*(id *)(a1 + 48), "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v6, 1);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v6 = (PKCreditAccountPaymentDetailsViewController *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKAccountAutomaticPaymentsController initWithAccountService:paymentWebService:account:context:]([PKAccountAutomaticPaymentsController alloc], "initWithAccountService:paymentWebService:account:context:", v6, v2, *(_QWORD *)(a1 + 32), 0);
    -[PKAccountAutomaticPaymentsController setDelegate:](v8, "setDelegate:", *(_QWORD *)(a1 + 48));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke_6;
    v9[3] = &unk_1E3E65198;
    v10 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    -[PKAccountAutomaticPaymentsController nextViewControllerFromViewController:withCompletion:](v8, "nextViewControllerFromViewController:withCompletion:", 0, v9);

  }
}

void __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  PKNavigationController *v4;

  v3 = a2;
  v4 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v3);

  if (objc_msgSend(*(id *)(a1 + 32), "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    -[PKNavigationController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 2);
  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_interstitialButtonTapped:(id)a3
{
  id v4;
  void *v5;
  PKAccount *account;
  PKAccountUserCollection *accountUserCollection;
  PKTransactionSource *transactionSource;
  PKAccountServiceAccountResolutionConfiguration *configuration;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  if ((self->_interstitialState & 0xFFFFFFFFFFFFFFFCLL) == 4)
  {
    objc_initWeak(&location, self);
    v5 = (void *)objc_opt_class();
    account = self->_account;
    accountUserCollection = self->_accountUserCollection;
    transactionSource = self->_transactionSource;
    configuration = self->_configuration;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__PKAccountBillPaymentViewController__interstitialButtonTapped___block_invoke;
    v10[3] = &unk_1E3E65210;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v5, "_billPaymentViewControllerForAccount:accountUserCollection:transactionSource:configuration:withCompletion:", account, accountUserCollection, transactionSource, configuration, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PKAccountBillPaymentViewController _cancelButtonTapped:](self, "_cancelButtonTapped:", v4);
  }

}

void __64__PKAccountBillPaymentViewController__interstitialButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PKAccountBillPaymentViewController__interstitialButtonTapped___block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __64__PKAccountBillPaymentViewController__interstitialButtonTapped___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  int IsVisible;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v10 = WeakRetained;
      IsVisible = PKViewVisibilityStateIsVisible();
      WeakRetained = v10;
      if (IsVisible)
      {
        objc_msgSend(v10, "navigationController");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "viewControllers");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v5, "mutableCopy");

        v7 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", v10);
        v8 = objc_msgSend(v6, "count");
        if (v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v9 = v8 - v7;
          if (v8 > v7)
            objc_msgSend(v6, "removeObjectsInRange:", v7, v9);
        }
        objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 32), v9);
        objc_msgSend(v4, "setViewControllers:animated:", v6, 1);

        WeakRetained = v10;
      }
    }
  }

}

- (double)_buttonHeightForButtonWidth:(double)a3
{
  PKLegacyButtonInterface *primaryButton;
  double v6;
  double v7;
  PKLegacyButtonInterface *secondaryButton;
  double v9;

  primaryButton = self->_primaryButton;
  if (primaryButton)
  {
    -[PKLegacyButtonInterface sizeThatFits:](primaryButton, "sizeThatFits:", a3, 1.79769313e308);
    v7 = fmax(v6, 50.0);
    secondaryButton = self->_secondaryButton;
    if (!secondaryButton)
      return v7;
LABEL_6:
    -[PKLegacyButtonInterface sizeThatFits:](secondaryButton, "sizeThatFits:", a3, 1.79769313e308);
    return fmax(v9, v7);
  }
  secondaryButton = self->_secondaryButton;
  if (secondaryButton)
  {
    v7 = 50.0;
    goto LABEL_6;
  }
  return 0.0;
}

- (void)_updatePayNowButtonTitleWithAmount:(id)a3
{
  PKAccount *account;
  id v5;
  void *v6;
  id v7;

  if (self->_buttonsArePayButtons)
  {
    account = self->_account;
    v5 = a3;
    -[PKAccount feature](account, "feature");
    -[NSNumberFormatter stringFromNumber:](self->_amountFormatter, "stringFromNumber:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    PKLocalizedFeatureString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKLegacyButtonInterface setTitle:forState:](self->_primaryButton, "setTitle:forState:", v6, 0, v7);

  }
}

- (id)_interestForAmount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKCompoundInterestCalculator *v7;
  PKCompoundInterestCalculator *interestCalculator;
  NSMutableDictionary *v9;
  NSMutableDictionary *cachedInterestResults;
  void *v11;
  PKAccountUserCollection *accountUserCollection;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[5];

  v4 = a3;
  if (v4)
  {
    if (!self->_interestCalculator)
    {
      objc_msgSend(MEMORY[0x1E0D66C40], "configurationWithCreditAccount:", self->_account);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCalculationMethod:", 1);
      v7 = (PKCompoundInterestCalculator *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C38]), "initWithConfiguration:", v6);
      interestCalculator = self->_interestCalculator;
      self->_interestCalculator = v7;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      cachedInterestResults = self->_cachedInterestResults;
      self->_cachedInterestResults = v9;

      -[PKTransactionSource transactionSourceIdentifiers](self->_transactionSource, "transactionSourceIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      accountUserCollection = self->_accountUserCollection;
      if (accountUserCollection)
      {
        -[PKAccountUserCollection transactionSourceIdentifiers](accountUserCollection, "transactionSourceIdentifiers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v11, "setByAddingObjectsFromSet:", v13);
          v14 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v14;
        }

      }
      v15 = objc_alloc_init(MEMORY[0x1E0D672B0]);
      objc_msgSend(v6, "periodStartDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "periodEndDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = 3221225472;
      v19[2] = __57__PKAccountBillPaymentViewController__interestForAmount___block_invoke;
      v19[3] = &unk_1E3E65238;
      v19[4] = self;
      v19[0] = MEMORY[0x1E0C809B0];
      objc_msgSend(v15, "approvedTransactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:limit:completion:", v11, 0, 1, v16, v17, 0, v19);

    }
    -[NSMutableDictionary objectForKey:](self->_cachedInterestResults, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[PKCompoundInterestCalculator compoundInterestWithPaymentOfAmount:](self->_interestCalculator, "compoundInterestWithPaymentOfAmount:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_cachedInterestResults, "setObject:forKey:", v5, v4);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __57__PKAccountBillPaymentViewController__interestForAmount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PKAccountBillPaymentViewController__interestForAmount___block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __57__PKAccountBillPaymentViewController__interestForAmount___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPeriodTransactions:", v3);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "removeAllObjects");
}

- (id)_paymentAmount
{
  uint64_t v2;

  v2 = 23;
  if (!self->_showKeyboard)
    v2 = 22;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKAccountBillPaymentViewController__account[v2]), "amount");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setEnabled:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (((!self->_viewIsEnabled ^ a3) & 1) == 0)
  {
    self->_viewIsEnabled = a3;
    -[PKAccountBillPaymentViewController viewIfLoaded](self, "viewIfLoaded");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", self->_viewIsEnabled);
    -[PKAccountBillPaymentViewController _setPayButtonsEnabled:](self, "_setPayButtonsEnabled:", self->_viewIsEnabled);
    -[PKLegacyButtonInterface setShowSpinner:](self->_primaryButton, "setShowSpinner:", !self->_viewIsEnabled);
    -[UIButton setEnabled:](self->_tertiaryButton, "setEnabled:", self->_viewIsEnabled);
    -[PKAccountBillPaymentViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leftBarButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", self->_viewIsEnabled);

    objc_msgSend(v6, "setNeedsLayout");
  }
}

- (void)_setPayButtonsEnabled:(BOOL)a3
{
  PKLegacyButtonInterface *primaryButton;
  _BOOL8 v5;
  _BOOL8 v6;

  if (((!self->_payButtonsEnabled ^ a3) & 1) == 0)
  {
    self->_payButtonsEnabled = a3;
    primaryButton = self->_primaryButton;
    if (self->_buttonsArePayButtons)
      v5 = a3;
    else
      *(_QWORD *)&a3 = 1;
    -[PKLegacyButtonInterface setEnabled:](primaryButton, "setEnabled:", a3);
    v6 = self->_shouldEnablePayLaterButton && self->_payButtonsEnabled;
    -[PKLegacyButtonInterface setEnabled:](self->_secondaryButton, "setEnabled:", v6);
  }
}

- (void)_dismissViewControllerWithSuccess:(BOOL)a3
{
  id v3;

  -[PKAccountBillPaymentViewController presentingViewController](self, "presentingViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_presentAddBankAccount
{
  PKNavigationController *v3;
  id v4;

  -[PKAccountBillPaymentViewController _addBankAccountInformationViewController](self, "_addBankAccountInformationViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOfferKeychainPreFill:", 1);
  v3 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v4);
  -[PKNavigationController setSupportedInterfaceOrientations:](v3, "setSupportedInterfaceOrientations:", 2);
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    -[PKNavigationController setModalPresentationStyle:](v3, "setModalPresentationStyle:", 2);
  }
  -[PKAccountBillPaymentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

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

- (id)_interestPostDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PKAccount creditDetails](self->_account, "creditDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "balanceSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "closingDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_roundedInterestForAmount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (-[PKAccount showBillPaymentInterest](self->_account, "showBillPaymentInterest"))
  {
    -[PKAccountBillPaymentViewController _interestForAmount:](self, "_interestForAmount:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D66BF0], "roundingHandler");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decimalNumberByRoundingAccordingToBehavior:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v7, "isEqualToNumber:", v8);

    if ((v6 & 1) != 0)
      v9 = 0;
    else
      v9 = v7;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_interestStringForAmount:(id)a3
{
  void *v4;
  void *v5;

  -[PKAccountBillPaymentViewController _roundedInterestForAmount:](self, "_roundedInterestForAmount:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSNumberFormatter stringFromNumber:](self->_amountFormatter, "stringFromNumber:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_interestLabelIsOutsideSmallRing
{
  if ((PKIsVision() & 1) != 0)
    return 0;
  if (PKUIGetMinScreenWidthType() && !self->_usesAccessibilityLayout)
    return -[PKBillPaymentRingView isHidden](self->_ringView, "isHidden");
  return 1;
}

- (void)_updateNavigationTitle
{
  uint64_t v3;
  id v4;

  if (self->_showKeyboard || self->_titleLabel)
  {
    v3 = 0;
  }
  else
  {
    -[PKAccountBillPaymentViewController _title](self, "_title");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (id)v3;
  -[PKAccountBillPaymentViewController setTitle:](self, "setTitle:", v3);

}

- (id)_title
{
  __CFString *v3;
  void *v4;

  -[PKAccount feature](self->_account, "feature");
  switch(self->_interstitialState)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
      PKLocalizedFeatureString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
        goto LABEL_4;
      return v4;
    case 5uLL:
      if (-[NSArray count](self->_installmentPlans, "count") < 2)
        v3 = CFSTR("BILL_PAYMENT_INTERSTITIAL_NEW_INSTALLMENT_TITLE");
      else
        v3 = CFSTR("BILL_PAYMENT_INTERSTITIAL_NEW_MULTI_INSTALLMENT_TITLE");
      goto LABEL_9;
    case 6uLL:
    case 7uLL:
      v3 = CFSTR("BILL_PAYMENT_INTERSTITIAL_EARLY_INSTALLMENT_PAYMENT_TITLE");
LABEL_9:
      PKLocalizedBeekmanString(&v3->isa);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
        goto LABEL_4;
      return v4;
    default:
LABEL_4:
      PKLocalizedFeatureString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
  }
}

- (void)_updateSubtitle
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _BOOL4 v24;
  int IsSingular;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  _BOOL8 v29;
  uint64_t v30;
  NSDecimalNumber *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  int v39;
  __CFString *v40;
  __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSString *v48;
  NSDecimalNumber *v49;
  void *v50;
  void *v51;
  NSDecimalNumber *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;

  if (self->_subtitleLabel)
  {
    -[PKAccount feature](self->_account, "feature");
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v57 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "accountSummary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentStatement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    createDateFormatter();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    switch(self->_interstitialState)
    {
      case 1uLL:
      case 2uLL:
      case 3uLL:
        PKLocalizedFeatureString();
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      case 4uLL:
        objc_msgSend(v57, "currencyCode");
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (accountCurrentStatementIsLastMonthsStatement(self->_account))
        {
          objc_msgSend(v4, "closingDate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            objc_msgSend(v5, "stringFromDate:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = 0;
          }
        }
        else
        {
          v9 = 0;
          v8 = 0;
        }
        objc_msgSend(v3, "pastDueAmount");
        v31 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        v52 = v31;
        if (v31)
        {
          PKCurrencyAmountCreate(v31, v7);
          v31 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        }
        v49 = v31;
        -[NSDecimalNumber formattedStringValue](v31, "formattedStringValue");
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v32;
        v55 = (void *)v9;
        if (v32 && v9)
        {
          v45 = (void *)v9;
          v46 = (void *)v32;
LABEL_49:
          PKLocalizedFeatureString();
          v34 = objc_claimAutoreleasedReturnValue();
          goto LABEL_50;
        }
        if (v32)
        {
          v45 = (void *)v32;
          goto LABEL_49;
        }
        if (v9)
        {
          v45 = (void *)v9;
          goto LABEL_49;
        }
        PKLocalizedFeatureString();
        v34 = objc_claimAutoreleasedReturnValue();
LABEL_50:
        v14 = (__CFString *)v34;
        if (objc_msgSend(v3, "requiresDebtCollectionNotices", v45, v46))
        {
          PKLocalizedFeatureString();
          v48 = v7;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", v35);
          v47 = v8;
          v36 = v5;
          v37 = objc_claimAutoreleasedReturnValue();

          v14 = (__CFString *)v37;
          v5 = v36;
          v8 = v47;
          v7 = v48;
        }

        if (v14)
        {
LABEL_35:
          v29 = 0;
          goto LABEL_62;
        }
LABEL_13:
        objc_msgSend(v3, "pastDueAmount");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v5;
        v51 = v15;
        if (objc_msgSend(v3, "cyclesPastDue") <= 0)
        {
          if (v15)
          {
            objc_msgSend(MEMORY[0x1E0CB3598], "zero");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v15) = objc_msgSend(v15, "compare:", v16) == 1;

          }
        }
        else
        {
          LODWORD(v15) = 1;
        }
        -[PKBillPaymentSuggestedAmountList remainingStatementAmount](self->_suggestionList, "remainingStatementAmount");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "paymentDueDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v4;
        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0CB3598], "zero");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v17, "compare:", v19) == 1;

        }
        else
        {
          v20 = 0;
        }
        objc_msgSend(v57, "productTimeZone");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[PKAccount stateReason](self->_account, "stateReason");
        createBaseDateFormatter();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setTimeStyle:", 1);
        if ((_DWORD)v15)
          goto LABEL_21;
        if (v18)
          v24 = v20;
        else
          v24 = 0;
        if (v24)
        {
          IsSingular = PKHourOfDateIsSingular();
          v26 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_PAYMENT_DUE_BY");
          if (IsSingular)
            v26 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_PAYMENT_DUE_BY_HOUR_ONE");
          v27 = v26;
          objc_msgSend(v22, "stringFromDate:", v18);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "stringFromDate:", v18);
          v45 = v28;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedFeatureString();
          v23 = objc_claimAutoreleasedReturnValue();

        }
        else if (v20)
        {
          v23 = 0;
        }
        else if (v21 == 2)
        {
LABEL_21:
          PKLocalizedFeatureString();
          v23 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v18)
          {
            PKEndOfNextMonthAndTimeZone();
            v30 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            PKEndOfNextMonthAndTimeZone();
            v30 = objc_claimAutoreleasedReturnValue();

          }
          v39 = PKHourOfDateIsSingular();
          v40 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_NO_PAYMENTS_DUE_UNTIL");
          if (v39)
            v40 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_NO_PAYMENTS_DUE_UNTIL_HOUR_ONE");
          v41 = v40;
          objc_msgSend(v22, "stringFromDate:", v30);
          v42 = objc_claimAutoreleasedReturnValue();
          v43 = v30;
          v50 = (void *)v30;
          v44 = (void *)v42;
          objc_msgSend(v56, "stringFromDate:", v43);
          v45 = v44;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedFeatureString();
          v23 = objc_claimAutoreleasedReturnValue();

        }
        v29 = v23 == 0;
        if (v23)
          v14 = (__CFString *)v23;
        else
          v14 = CFSTR(" ");
        v4 = v53;
        v5 = v56;
LABEL_62:
        -[UILabel setText:](self->_subtitleLabel, "setText:", v14, v45, v46);
        -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", v29);

        break;
      case 5uLL:
        if (-[NSArray count](self->_installmentPlans, "count") < 2)
          v10 = CFSTR("BILL_PAYMENT_INTERSTITIAL_NEW_INSTALLMENT_MESSAGE");
        else
          v10 = CFSTR("BILL_PAYMENT_INTERSTITIAL_NEW_MULTI_INSTALLMENT_MESSAGE");
        PKLocalizedBeekmanString(&v10->isa);
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_34:
        v14 = (__CFString *)v6;
        if (v6)
          goto LABEL_35;
        goto LABEL_13;
      case 6uLL:
        objc_msgSend(v57, "rates");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "formattedAPRForPurchasesPercentageString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        PKLocalizedBeekmanString(CFSTR("BILL_PAYMENT_INTERSTITIAL_EARLY_INSTALLMENT_PAYMENT_MESSAGE"), CFSTR("%@"), v12);
        goto LABEL_12;
      case 7uLL:
        objc_msgSend(v57, "rates");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "formattedAPRForPurchasesPercentageString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        PKLocalizedBeekmanString(CFSTR("BILL_PAYMENT_INTERSTITIAL_EARLY_MULTI_INSTALLMENT_PAYMENT_MESSAGE"), CFSTR("%@"), v12);
LABEL_12:
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!v14)
          goto LABEL_13;
        goto LABEL_35;
      default:
        goto LABEL_13;
    }
  }
}

- (void)_setupAmountDescriptionViewForInterstitial
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  if (self->_interstitialState)
  {
    -[PKAccount feature](self->_account, "feature");
    v3 = 0;
    v4 = 0;
    switch(self->_interstitialState)
    {
      case 1uLL:
        -[PKAccount creditDetails](self->_account, "creditDetails");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "createdDate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        PKLocalizedFeatureString();
        v14 = (id)objc_claimAutoreleasedReturnValue();
        createDateFormatter();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        PKEndOfNextMonth();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringFromDate:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      case 2uLL:
        -[PKAccount creditDetails](self->_account, "creditDetails");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "accountSummary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "paymentDueDate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        PKLocalizedFeatureString();
        v14 = (id)objc_claimAutoreleasedReturnValue();
        createDateFormatter();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        PKEndOfNextMonth();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringFromDate:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
        v13 = v9;
        PKLocalizedFeatureString();
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = v14;
        break;
      case 3uLL:
        PKLocalizedFeatureString();
        v15 = (id)objc_claimAutoreleasedReturnValue();
        PKLocalizedFeatureString();
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 4uLL:
        break;
      case 5uLL:
        PKLocalizedBeekmanString(CFSTR("BILL_PAYMENT_INTERSTITIAL_DESCRIPTION_TITLE"));
        v15 = (id)objc_claimAutoreleasedReturnValue();
        PKLocalizedBeekmanString(CFSTR("BILL_PAYMENT_INTERSTITIAL_DESCRIPTION_MESSAGE"));
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v4 = v15;
        v3 = (void *)v12;
        break;
      default:
        v4 = 0;
        break;
    }
    v16 = v4;
    -[PKAccountBillPaymentAmountDescriptionView setTitleText:](self->_amountDescriptionView, "setTitleText:", v4, v13);
    -[PKAccountBillPaymentAmountDescriptionView setDescriptionText:](self->_amountDescriptionView, "setDescriptionText:", v3);

  }
}

- (void)_configureProductHeroView
{
  uint64_t v3;
  void (**v4)(void *, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  void (**v12)(void *, void *);
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKAccountBillPaymentViewController__configureProductHeroView__block_invoke;
  aBlock[3] = &unk_1E3E613B0;
  aBlock[4] = self;
  v4 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[NSArray firstObject](self->_installmentPlans, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "product");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconURLForScale:suffix:", 0, PKUIScreenScale());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D66EA8], "sharedImageAssetDownloader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cachedDataForURL:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v10);
    }
    else
    {
      v11[0] = v3;
      v11[1] = 3221225472;
      v11[2] = __63__PKAccountBillPaymentViewController__configureProductHeroView__block_invoke_2;
      v11[3] = &unk_1E3E65260;
      v12 = v4;
      objc_msgSend(v8, "downloadFromUrl:completionHandler:", v7, v11);
      v10 = v12;
    }

  }
  else
  {
    PKUIImageNamed(CFSTR("Hero_Apply-CCS"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8);
  }

}

void __63__PKAccountBillPaymentViewController__configureProductHeroView__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1304), "setImage:", a2);
    objc_msgSend(*(id *)(a1 + 32), "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
}

void __63__PKAccountBillPaymentViewController__configureProductHeroView__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v6 = a2;
  if (v6 && !a4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__PKAccountBillPaymentViewController__configureProductHeroView__block_invoke_3;
    v7[3] = &unk_1E3E618A0;
    v9 = *(id *)(a1 + 32);
    v8 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

void __63__PKAccountBillPaymentViewController__configureProductHeroView__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)_showOrHideKeypad
{
  _BOOL4 showKeyboard;
  PKAccountBillPaymentAmountDescriptionView *amountDescriptionView;

  showKeyboard = self->_showKeyboard;
  amountDescriptionView = self->_amountDescriptionView;
  if (showKeyboard)
    -[PKAccountBillPaymentAmountDescriptionView showKeyboard](amountDescriptionView, "showKeyboard");
  else
    -[PKAccountBillPaymentAmountDescriptionView dismissKeyboard](amountDescriptionView, "dismissKeyboard");
}

- (void)_presentAlertControllerForError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", v4, -[PKAccount feature](self->_account, "feature"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = (void *)objc_opt_class();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __70__PKAccountBillPaymentViewController__presentAlertControllerForError___block_invoke;
  v11 = &unk_1E3E61310;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v6, "alertControllerForDisplayableError:handler:", v5, &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[PKAccountBillPaymentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0, v8, v9, v10, v11);
  else
    -[PKAccountBillPaymentViewController _setEnabled:](self, "_setEnabled:", 1, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __70__PKAccountBillPaymentViewController__presentAlertControllerForError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showOrHideKeypad");
  objc_msgSend(WeakRetained, "_setEnabled:", 1);

}

- (void)_reportEventForPassIfNecessary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)MEMORY[0x1E0D66A58];
  -[PKTransactionSource paymentPass](self->_transactionSource, "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subjectToReportDashboardAnalyticsForPass:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v6)
  {
    v7 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v7, "setObject:forKey:", *MEMORY[0x1E0D689E8], *MEMORY[0x1E0D68F50]);
    v8 = (void *)MEMORY[0x1E0D66A58];
    v9 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v8, "subject:sendEvent:", v6, v9);

  }
}

- (PKAccount)account
{
  return self->_account;
}

- (PKAccountUserCollection)accountUserCollection
{
  return self->_accountUserCollection;
}

- (PKTransactionSource)transactionSource
{
  return self->_transactionSource;
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
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_CLInUse, 0);
  objc_storeStrong((id *)&self->_accountResolutionController, 0);
  objc_storeStrong((id *)&self->_addBankAccountViewController, 0);
  objc_storeStrong((id *)&self->_productHeroView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_blurringView, 0);
  objc_storeStrong((id *)&self->_ringViewAmountTapRecognizer, 0);
  objc_storeStrong((id *)&self->_ringViewTapRecognizer, 0);
  objc_storeStrong((id *)&self->_smallRingInterestLabel, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_tertiaryButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_ringView, 0);
  objc_storeStrong((id *)&self->_amountDescriptionView, 0);
  objc_storeStrong((id *)&self->_interestForStatementBalance, 0);
  objc_storeStrong((id *)&self->_interestForPaymentTotal, 0);
  objc_storeStrong((id *)&self->_previousAccountSummary, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_smallRingInterestDateAttributes, 0);
  objc_storeStrong((id *)&self->_smallRingInterestAttributes, 0);
  objc_storeStrong((id *)&self->_apr, 0);
  objc_storeStrong((id *)&self->_amountFormatter, 0);
  objc_storeStrong((id *)&self->_interestDateFormatter, 0);
  objc_storeStrong((id *)&self->_cachedInterestResults, 0);
  objc_storeStrong((id *)&self->_interestCalculator, 0);
  objc_storeStrong((id *)&self->_suggestionList, 0);
  objc_storeStrong((id *)&self->_suggestedAmountController, 0);
  objc_storeStrong((id *)&self->_billPaymentCoordinator, 0);
  objc_storeStrong((id *)&self->_installmentPlans, 0);
  objc_storeStrong((id *)&self->_transactionSource, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
