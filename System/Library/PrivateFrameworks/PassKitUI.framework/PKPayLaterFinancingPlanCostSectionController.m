@implementation PKPayLaterFinancingPlanCostSectionController

- (PKPayLaterFinancingPlanCostSectionController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  PKPayLaterFinancingPlanCostSectionController *v11;
  PKPayLaterFinancingPlanCostSectionController *v12;
  NSDateFormatter *v13;
  NSDateFormatter *transactionDateFormatter;
  NSDateFormatter *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  PKPaymentPass *payLaterPass;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PKPayLaterFinancingPlanCostSectionController;
  v11 = -[PKPayLaterSectionController initWithPayLaterAccount:dynamicContentPage:viewControllerDelegate:](&v23, sel_initWithPayLaterAccount_dynamicContentPage_viewControllerDelegate_, v10, 0, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_financingPlan, a3);
    v13 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    transactionDateFormatter = v12->_transactionDateFormatter;
    v12->_transactionDateFormatter = v13;

    v15 = v12->_transactionDateFormatter;
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v15, "setCalendar:", v16);

    -[NSDateFormatter setDateStyle:](v12->_transactionDateFormatter, "setDateStyle:", 1);
    -[NSDateFormatter setTimeStyle:](v12->_transactionDateFormatter, "setTimeStyle:", 1);
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "associatedPassUniqueID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "passWithUniqueID:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "paymentPass");
    v20 = objc_claimAutoreleasedReturnValue();
    payLaterPass = v12->_payLaterPass;
    v12->_payLaterPass = (PKPaymentPass *)v20;

  }
  return v12;
}

- (id)identifiers
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "addObject:", CFSTR("kCostSummarySection"));
  -[PKPayLaterFinancingPlan productType](self->_financingPlan, "productType");
  objc_msgSend(v3, "addObject:", CFSTR("kLoanAgreementSection"));
  objc_msgSend(v3, "addObject:", CFSTR("kIssuerLogoSection"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  __CFString *v11;
  __CFString *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  int v16;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == CFSTR("kCostSummarySection"))
    goto LABEL_4;
  if (v7)
  {
    v9 = objc_msgSend(CFSTR("kCostSummarySection"), "isEqualToString:", v7);

    if (v9)
    {
LABEL_4:
      -[PKPayLaterFinancingPlanCostSectionController _configureCostSummarySection:](self, "_configureCostSummarySection:", v6);
      goto LABEL_5;
    }
    v11 = v8;
    if (v11 == CFSTR("kLoanAgreementSection")
      || (v12 = v11, v13 = objc_msgSend(CFSTR("kLoanAgreementSection"), "isEqualToString:", v11), v12, v13))
    {
      -[PKPayLaterFinancingPlanCostSectionController _configureLoanAgreementSection:](self, "_configureLoanAgreementSection:", v6);
    }
    else
    {
      v14 = v12;
      if (v14 == CFSTR("kIssuerLogoSection")
        || (v15 = v14, v16 = objc_msgSend(CFSTR("kIssuerLogoSection"), "isEqualToString:", v14), v15, v16))
      {
        -[PKPayLaterFinancingPlanCostSectionController _configureIssuerBrandSection:](self, "_configureIssuerBrandSection:", v6);
      }
    }
  }
LABEL_5:

  return v6;
}

- (Class)headerViewClassForSectionIdentifier:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  int v5;
  void *v6;

  v3 = (__CFString *)a3;
  v4 = v3;
  if (v3 == CFSTR("kCostSummarySection")
    || v3 && (v5 = objc_msgSend(CFSTR("kCostSummarySection"), "isEqualToString:", v3), v4, v5))
  {
    objc_opt_class();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (Class)v6;
}

- (id)footerContentForSectionIdentifier:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  int v6;

  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == CFSTR("kCostSummarySection")
    || v4 && (v6 = objc_msgSend(CFSTR("kCostSummarySection"), "isEqualToString:", v4), v5, v6))
  {
    -[PKPayLaterFinancingPlan productType](self->_financingPlan, "productType");
  }

  return 0;
}

- (void)configureHeaderView:(id)a3 forSectionIdentifier:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSDateFormatter *transactionDateFormatter;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = (__CFString *)a4;
  v7 = v6;
  if (v6 == CFSTR("kCostSummarySection")
    || v6 && (v8 = objc_msgSend(CFSTR("kCostSummarySection"), "isEqualToString:", v6), v7, v8))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "headerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "totalAmount");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "formattedStringValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAmountText:", v12);

      PKLocalizedCocoonString(CFSTR("APPLE_PAY_LATER"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSubtitleText:", v13);

      transactionDateFormatter = self->_transactionDateFormatter;
      -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "transactionDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](transactionDateFormatter, "stringFromDate:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSecondarySubtitleText:", v17);

    }
  }

}

- (id)contextMenuForPayLaterItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD aBlock[4];
  id v9;

  if (self->_loanIdentifierRow != a3)
    return 0;
  -[PKPayLaterFinancingPlan displayableLoanIdentifier](self->_financingPlan, "displayableLoanIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__PKPayLaterFinancingPlanCostSectionController_contextMenuForPayLaterItem___block_invoke;
    aBlock[3] = &unk_1E3E6D5A8;
    v9 = v4;
    v6 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __75__PKPayLaterFinancingPlanCostSectionController_contextMenuForPayLaterItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedString(CFSTR("MENU_ACTION_COPY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__PKPayLaterFinancingPlanCostSectionController_contextMenuForPayLaterItem___block_invoke_2;
  v9[3] = &unk_1E3E6D580;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, 0, 0, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0DC39D0];
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuWithTitle:children:", &stru_1E3E7D690, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __75__PKPayLaterFinancingPlanCostSectionController_contextMenuForPayLaterItem___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setString:", *(_QWORD *)(a1 + 32));

}

- (void)_configureCostSummarySection:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  PKPayLaterTitleDetailValueRow *v12;
  void *v13;
  PKPayLaterTitleDetailRow *v14;
  void *v15;
  void *v16;
  PKPayLaterTitleDetailRow *v17;
  PKPayLaterTitleDetailRow *loanIdentifierRow;
  uint64_t v19;
  void *v20;
  PKPayLaterTitleDetailRow *v21;
  void *v22;
  PKPayLaterTitleDetailRow *v23;
  id v24;
  void *v25;
  PKMultiKeyValueCellKeyValueSource *v26;
  void *v27;
  void *v28;
  PKMultiKeyValueCellKeyValueSource *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  PKMultiKeyValueCellKeyValueSource *v37;
  void *v38;
  PKMultiKeyValueCellKeyValueSource *v39;
  void *v40;
  PKMultiKeyValueCellKeyValueSource *v41;
  void *v42;
  void *v43;
  void *v44;
  PKMultiKeyValueCellKeyValueSource *v45;
  void *v46;
  PKMultiKeyValueCellKeyValueSource *v47;
  void *v48;
  void *v49;
  void *v50;
  PKMultiKeyValueCellKeyValueSource *v51;
  void *v52;
  PKMultiKeyValueRow *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v57 = objc_alloc_init(v4);
  -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKPayLaterFinancingPlan state](self->_financingPlan, "state") - 1;
  if (v7 <= 7 && ((0xBFu >> v7) & 1) != 0)
  {
    PKLocalizedCocoonString(&off_1E3E73E08[v7]->isa);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "displayNamePurchase");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = -[PKPayLaterTitleDetailValueRow initWithTitle:detail:value:accessory:selectionHandler:]([PKPayLaterTitleDetailValueRow alloc], "initWithTitle:detail:value:accessory:selectionHandler:", v9, v11, 0, 0, 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterTitleDetailValueRow setDetailColor:](v12, "setDetailColor:", v13);

      objc_msgSend(v57, "safelyAddObject:", v12);
    }
  }
  v14 = [PKPayLaterTitleDetailRow alloc];
  PKLocalizedCocoonString(CFSTR("LOAN_ID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlan displayableLoanIdentifier](self->_financingPlan, "displayableLoanIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PKPayLaterTitleDetailRow initWithTitle:detail:selectionHandler:](v14, "initWithTitle:detail:selectionHandler:", v15, v16, 0);
  loanIdentifierRow = self->_loanIdentifierRow;
  self->_loanIdentifierRow = v17;

  objc_msgSend(v57, "safelyAddObject:", self->_loanIdentifierRow);
  if (-[PKPayLaterFinancingPlan productType](self->_financingPlan, "productType") == 1)
  {
    PKLocalizedCocoonString(CFSTR("BNPL_TYPE"));
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      v21 = [PKPayLaterTitleDetailRow alloc];
      PKLocalizedCocoonString(CFSTR("TYPE"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[PKPayLaterTitleDetailRow initWithTitle:detail:selectionHandler:](v21, "initWithTitle:detail:selectionHandler:", v22, v20, 0);

      objc_msgSend(v57, "safelyAddObject:", v23);
    }
  }
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[PKPayLaterFinancingPlan productType](self->_financingPlan, "productType") == 1)
  {
    objc_msgSend(v6, "initialAmount");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = [PKMultiKeyValueCellKeyValueSource alloc];
      PKLocalizedCocoonString(CFSTR("INITIAL_COST"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "formattedStringValue");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[PKMultiKeyValueCellKeyValueSource initWithTitle:subtitle:](v26, "initWithTitle:subtitle:", v27, v28);

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMultiKeyValueCellKeyValueSource setSubtitleTextColor:](v29, "setSubtitleTextColor:", v30);

      objc_msgSend(v24, "addObject:", v29);
    }
    objc_msgSend(v6, "totalAdjustments");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
    {
      objc_msgSend(v31, "formattedStringValue");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "amount");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "pk_isPositiveNumber");

      if (v35)
      {
        PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v33);
        v36 = objc_claimAutoreleasedReturnValue();

        v33 = (void *)v36;
      }
      v37 = [PKMultiKeyValueCellKeyValueSource alloc];
      PKLocalizedCocoonString(CFSTR("REFUNDS_AND_ADJUSTMENTS"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[PKMultiKeyValueCellKeyValueSource initWithTitle:subtitle:](v37, "initWithTitle:subtitle:", v38, v33);

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMultiKeyValueCellKeyValueSource setSubtitleTextColor:](v39, "setSubtitleTextColor:", v40);

      objc_msgSend(v24, "addObject:", v39);
    }
    v41 = [PKMultiKeyValueCellKeyValueSource alloc];
    PKLocalizedCocoonString(CFSTR("INTEREST_AND_FEES"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "totalInterest");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "formattedStringValue");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[PKMultiKeyValueCellKeyValueSource initWithTitle:subtitle:](v41, "initWithTitle:subtitle:", v42, v44);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMultiKeyValueCellKeyValueSource setSubtitleTextColor:](v45, "setSubtitleTextColor:", v46);

    objc_msgSend(v24, "addObject:", v45);
  }
  v47 = [PKMultiKeyValueCellKeyValueSource alloc];
  PKLocalizedCocoonString(CFSTR("TOTAL_COST"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "totalAmount");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "formattedStringValue");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[PKMultiKeyValueCellKeyValueSource initWithTitle:subtitle:](v47, "initWithTitle:subtitle:", v48, v50);

  -[PKMultiKeyValueCellKeyValueSource setBold:](v51, "setBold:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMultiKeyValueCellKeyValueSource setSubtitleTextColor:](v51, "setSubtitleTextColor:", v52);

  objc_msgSend(v24, "addObject:", v51);
  v53 = [PKMultiKeyValueRow alloc];
  v54 = (void *)objc_msgSend(v24, "copy");
  v55 = -[PKMultiKeyValueRow initKeyValueSources:](v53, "initKeyValueSources:", v54);

  objc_msgSend(v57, "addObject:", v55);
  v56 = (void *)objc_msgSend(v57, "copy");
  objc_msgSend(v5, "appendItems:", v56);

}

- (void)_configureLoanAgreementSection:(id)a3
{
  id v4;
  id v5;
  PKPayLaterButtonRow *v6;
  void *v7;
  PKPayLaterButtonRow *v8;
  PKPayLaterButtonRow *loanAgreementButton;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_initWeak(&location, self);
  v6 = [PKPayLaterButtonRow alloc];
  PKLocalizedCocoonString(CFSTR("VIEW_LOAN_AGREEMENT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __79__PKPayLaterFinancingPlanCostSectionController__configureLoanAgreementSection___block_invoke;
  v13 = &unk_1E3E61310;
  objc_copyWeak(&v14, &location);
  v8 = -[PKPayLaterButtonRow initWithTitle:selectionHandler:](v6, "initWithTitle:selectionHandler:", v7, &v10);
  loanAgreementButton = self->_loanAgreementButton;
  self->_loanAgreementButton = v8;

  objc_msgSend(v5, "addObject:", self->_loanAgreementButton, v10, v11, v12, v13);
  objc_msgSend(v4, "appendItems:", v5);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __79__PKPayLaterFinancingPlanCostSectionController__configureLoanAgreementSection___block_invoke(uint64_t a1)
{
  id *v1;
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  PKAccountTermsAndConditionsController *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v1 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[17], "termsDetails");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "installmentAgreementIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = [PKAccountTermsAndConditionsController alloc];
      objc_msgSend(v3, "payLaterAccount");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PKAccountTermsAndConditionsController initWithAccount:webService:context:termsIdentifier:](v6, "initWithAccount:webService:context:termsIdentifier:", v7, v8, 0, v5);
      v10 = v3[16];
      v3[16] = (id)v9;

      objc_msgSend(v3[13], "setShowSpinner:", 1);
      objc_msgSend(v3, "dynamicCollectionDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reloadItem:animated:", v3[13], 1);

      v12 = v3[16];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __79__PKPayLaterFinancingPlanCostSectionController__configureLoanAgreementSection___block_invoke_2;
      v16[3] = &unk_1E3E62598;
      objc_copyWeak(&v17, v1);
      objc_msgSend(v12, "termsViewControllerWithCompletion:", v16);
      objc_destroyWeak(&v17);
    }
    else
    {
      PKAccountDisplayableError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = PKAlertForDisplayableErrorWithHandlers(v13, 0, 0, 0);

      if (v14)
      {
        objc_msgSend(v3, "dynamicCollectionDelegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "presentViewController:animated:completion:", v14, 1, 0);

      }
    }

  }
}

void __79__PKPayLaterFinancingPlanCostSectionController__configureLoanAgreementSection___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      objc_msgSend(WeakRetained, "dynamicCollectionDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);

    }
    else
    {
      if (!v10)
      {
LABEL_7:
        objc_msgSend(WeakRetained[13], "setShowSpinner:", 0);
        objc_msgSend(WeakRetained, "dynamicCollectionDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "reloadItem:animated:", WeakRetained[13], 1);

        goto LABEL_8;
      }
      objc_msgSend(WeakRetained, "dynamicCollectionDelegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "presentViewController:animated:completion:", v10, 1, 0);
    }

    goto LABEL_7;
  }
LABEL_8:

}

- (void)_configureIssuerBrandSection:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  PKPayLaterImageRow *v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v8 = objc_alloc_init(v3);
  PKUIImageNamed(CFSTR("PayLater_MasterCard_Logo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPayLaterImageRow initWithImage:]([PKPayLaterImageRow alloc], "initWithImage:", v5);
  -[PKPayLaterImageRow setContentEdgeInsets:](v6, "setContentEdgeInsets:", 0.0, 12.0, 0.0, 0.0);
  objc_msgSend(v8, "safelyAddObject:", v6);
  v7 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v4, "appendItems:", v7);

}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (void)setFinancingPlan:(id)a3
{
  objc_storeStrong((id *)&self->_financingPlan, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_loanIdentifierRow, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_loanAgreementButton, 0);
  objc_storeStrong((id *)&self->_transactionDateFormatter, 0);
}

@end
