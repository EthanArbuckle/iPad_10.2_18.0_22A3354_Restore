@implementation PKPayLaterMakePaymentSectionController

- (PKPayLaterMakePaymentSectionController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 intentDetails:(id)a5 dynamicContentPage:(id)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  PKPayLaterMakePaymentSectionController *v16;
  PKPayLaterMakePaymentSectionController *v17;
  uint64_t v18;
  NSNumberFormatter *v19;
  NSNumberFormatter *numberFormatter;
  NSDateFormatter *v21;
  NSDateFormatter *mediumDateFormatter;
  NSDateFormatter *v23;
  void *v24;
  objc_super v26;

  v13 = a3;
  v14 = a5;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)PKPayLaterMakePaymentSectionController;
  v16 = -[PKPayLaterSectionController initWithPayLaterAccount:dynamicContentPage:viewControllerDelegate:](&v26, sel_initWithPayLaterAccount_dynamicContentPage_viewControllerDelegate_, a4, a6, v15);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_financingPlan, a3);
    objc_storeStrong((id *)&v17->_intentDetails, a5);
    objc_storeWeak((id *)&v17->_delegate, v15);
    v18 = 0;
    if (-[PKPayLaterMakePaymentSectionController _isItemAvailableToSelect:](v17, "_isItemAvailableToSelect:", 0)
      || (v18 = 1,
          -[PKPayLaterMakePaymentSectionController _isItemAvailableToSelect:](v17, "_isItemAvailableToSelect:", 1))
      || (v18 = 2,
          -[PKPayLaterMakePaymentSectionController _isItemAvailableToSelect:](v17, "_isItemAvailableToSelect:", 2)))
    {
      v17->_selectedItem = v18;
    }
    v19 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    numberFormatter = v17->_numberFormatter;
    v17->_numberFormatter = v19;

    -[NSNumberFormatter setNumberStyle:](v17->_numberFormatter, "setNumberStyle:", 1);
    v21 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    mediumDateFormatter = v17->_mediumDateFormatter;
    v17->_mediumDateFormatter = v21;

    v23 = v17->_mediumDateFormatter;
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v23, "setCalendar:", v24);

    -[NSDateFormatter setDateStyle:](v17->_mediumDateFormatter, "setDateStyle:", 2);
    -[NSDateFormatter setTimeStyle:](v17->_mediumDateFormatter, "setTimeStyle:", 0);
  }

  return v17;
}

- (id)currentSelectedAmount
{
  return -[PKPayLaterMakePaymentSectionController _amountForItemType:](self, "_amountForItemType:", self->_selectedItem);
}

- (id)identifiers
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[PKPayLaterMakePaymentSectionController _isItemAvailableToSelect:](self, "_isItemAvailableToSelect:", 0))
    objc_msgSend(v3, "addObject:", CFSTR("kNextPaymentSection"));
  if (-[PKPayLaterMakePaymentSectionController _isItemAvailableToSelect:](self, "_isItemAvailableToSelect:", 1))
    objc_msgSend(v3, "addObject:", CFSTR("kPastDueAmountSection"));
  if (-[PKPayLaterMakePaymentSectionController _isItemAvailableToSelect:](self, "_isItemAvailableToSelect:", 2))
    objc_msgSend(v3, "addObject:", CFSTR("kTotalPaymentSection"));
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
  if (v7 == CFSTR("kNextPaymentSection"))
    goto LABEL_4;
  if (v7)
  {
    v9 = objc_msgSend(CFSTR("kNextPaymentSection"), "isEqualToString:", v7);

    if (v9)
    {
LABEL_4:
      -[PKPayLaterMakePaymentSectionController _configureNextPaymentSection:](self, "_configureNextPaymentSection:", v6);
      goto LABEL_5;
    }
    v11 = v8;
    if (v11 == CFSTR("kPastDueAmountSection")
      || (v12 = v11, v13 = objc_msgSend(CFSTR("kPastDueAmountSection"), "isEqualToString:", v11), v12, v13))
    {
      -[PKPayLaterMakePaymentSectionController _configurePastDueAmountSection:](self, "_configurePastDueAmountSection:", v6);
    }
    else
    {
      v14 = v12;
      if (v14 == CFSTR("kTotalPaymentSection")
        || (v15 = v14, v16 = objc_msgSend(CFSTR("kTotalPaymentSection"), "isEqualToString:", v14),
                       v15,
                       v16))
      {
        -[PKPayLaterMakePaymentSectionController _configureTotalPaymentSection:](self, "_configureTotalPaymentSection:", v6);
      }
    }
  }
LABEL_5:

  return v6;
}

- (void)configureCellForRegistration:(id)a3 item:(id)a4
{
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterMakePaymentSectionController;
  v5 = a3;
  -[PKPayLaterSectionController configureCellForRegistration:item:](&v6, sel_configureCellForRegistration_item_, v5, a4);
  PKPayLaterConfigureCollectionViewCellWithGreyBackgroundForCell(v5);

}

- (id)footerContentForSectionIdentifier:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  int v6;

  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == CFSTR("kTotalPaymentSection")
    || v4 && (v6 = objc_msgSend(CFSTR("kTotalPaymentSection"), "isEqualToString:", v4), v5, v6))
  {
    -[PKPayLaterFinancingPlan productType](self->_financingPlan, "productType");
  }

  return 0;
}

- (void)_configurePastDueAmountSection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t selectedItem;
  PKPayLaterTitleDetailValueRow *v9;
  uint64_t v10;
  PKPayLaterTitleDetailValueRow *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPayLaterMakePaymentSectionController _amountForItemType:](self, "_amountForItemType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formattedStringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  selectedItem = self->_selectedItem;
  objc_initWeak(&location, self);
  v9 = [PKPayLaterTitleDetailValueRow alloc];
  if (selectedItem == 1)
    v10 = 2;
  else
    v10 = 3;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __73__PKPayLaterMakePaymentSectionController__configurePastDueAmountSection___block_invoke;
  v18 = &unk_1E3E61310;
  objc_copyWeak(&v19, &location);
  v11 = -[PKPayLaterTitleDetailValueRow initWithTitle:detail:value:accessory:selectionHandler:](v9, "initWithTitle:detail:value:accessory:selectionHandler:", CFSTR("Past Due Amount"), CFSTR("Pay the total amount past due"), v7, v10, &v15);
  -[PKPayLaterMakePaymentSectionController _titleFont](self, "_titleFont", v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterTitleDetailValueRow setTitleFont:](v11, "setTitleFont:", v12);

  -[PKPayLaterMakePaymentSectionController _detailFont](self, "_detailFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterTitleDetailValueRow setDetailFont:](v11, "setDetailFont:", v13);

  objc_msgSend(v5, "safelyAddObject:", v11);
  v14 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "appendItems:", v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __73__PKPayLaterMakePaymentSectionController__configurePastDueAmountSection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllerDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0D68858];
    v6[0] = *MEMORY[0x1E0D68888];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reportAnalyticsEvent:", v4);

    objc_msgSend(v2, "_updateSelectedItem:", 1);
  }

}

- (void)_configureNextPaymentSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDateFormatter *mediumDateFormatter;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  __CFString *v17;
  void *v18;
  PKPayLaterTitleDetailValueRow *v19;
  void *v20;
  PKPayLaterTitleDetailValueRow *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id location;

  v27 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v5;
  objc_msgSend(v5, "nextDueInstallment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterMakePaymentSectionController _amountForItemType:](self, "_amountForItemType:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "formattedStringValue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  mediumDateFormatter = self->_mediumDateFormatter;
  v24 = v7;
  objc_msgSend(v7, "dueDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](mediumDateFormatter, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v6;
  if ((objc_msgSend(v6, "isNextInstallmentPastDue") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  else
    -[PKPayLaterMakePaymentSectionController _detailTextColor](self, "_detailTextColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterMakePaymentSectionController _detailFont](self, "_detailFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_selectedItem)
    v14 = 3;
  else
    v14 = 2;
  -[PKPayLaterFinancingPlan fundingSource](self->_financingPlan, "fundingSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "autoPayment");

  if (v16)
    v17 = CFSTR("INSTALLMENT_DUE_DATE_AUTO_PAY");
  else
    v17 = CFSTR("INSTALLMENT_DUE_DATE");
  PKLocalizedCocoonString(&v17->isa, CFSTR("%@"), v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v19 = [PKPayLaterTitleDetailValueRow alloc];
  PKLocalizedCocoonString(CFSTR("MAKE_PAYMENT_NEXT_PAYMENT"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __71__PKPayLaterMakePaymentSectionController__configureNextPaymentSection___block_invoke;
  v29[3] = &unk_1E3E61310;
  objc_copyWeak(&v30, &location);
  v21 = -[PKPayLaterTitleDetailValueRow initWithTitle:detail:value:accessory:selectionHandler:](v19, "initWithTitle:detail:value:accessory:selectionHandler:", v20, v18, v28, v14, v29);

  -[PKPayLaterTitleDetailValueRow setDetailIcon:](v21, "setDetailIcon:", 0);
  -[PKPayLaterTitleDetailValueRow setDetailColor:](v21, "setDetailColor:", v12);
  -[PKPayLaterMakePaymentSectionController _titleFont](self, "_titleFont");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterTitleDetailValueRow setTitleFont:](v21, "setTitleFont:", v22);

  -[PKPayLaterTitleDetailValueRow setDetailFont:](v21, "setDetailFont:", v13);
  objc_msgSend(v4, "safelyAddObject:", v21);
  v23 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v27, "appendItems:", v23);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

void __71__PKPayLaterMakePaymentSectionController__configureNextPaymentSection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllerDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0D68858];
    v6[0] = *MEMORY[0x1E0D68870];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reportAnalyticsEvent:", v4);

    objc_msgSend(v2, "_updateSelectedItem:", 0);
  }

}

- (void)_configureTotalPaymentSection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PKPayLaterTitleDetailValueRow *v10;
  void *v11;
  PKPayLaterTitleDetailValueRow *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPayLaterMakePaymentSectionController _amountForItemType:](self, "_amountForItemType:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formattedStringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedCocoonString(CFSTR("PAY_REMAINING_BALANCE_DETAIL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_selectedItem == 2)
    v9 = 2;
  else
    v9 = 3;
  -[PKPayLaterFinancingPlan productType](self->_financingPlan, "productType");
  objc_initWeak(&location, self);
  v10 = [PKPayLaterTitleDetailValueRow alloc];
  PKLocalizedCocoonString(CFSTR("REMAINING_BALANCE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __72__PKPayLaterMakePaymentSectionController__configureTotalPaymentSection___block_invoke;
  v21 = &unk_1E3E61310;
  objc_copyWeak(&v22, &location);
  v12 = -[PKPayLaterTitleDetailValueRow initWithTitle:detail:value:accessory:selectionHandler:](v10, "initWithTitle:detail:value:accessory:selectionHandler:", v11, v8, v7, v9, &v18);

  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4918], 2, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterTitleDetailValueRow setTitleFont:](v12, "setTitleFont:", v13, v18, v19, v20, v21);

  -[PKPayLaterMakePaymentSectionController _detailTextColor](self, "_detailTextColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterTitleDetailValueRow setDetailColor:](v12, "setDetailColor:", v14);

  -[PKPayLaterMakePaymentSectionController _titleFont](self, "_titleFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterTitleDetailValueRow setTitleFont:](v12, "setTitleFont:", v15);

  -[PKPayLaterMakePaymentSectionController _detailFont](self, "_detailFont");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterTitleDetailValueRow setDetailFont:](v12, "setDetailFont:", v16);

  objc_msgSend(v5, "safelyAddObject:", v12);
  v17 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "appendItems:", v17);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __72__PKPayLaterMakePaymentSectionController__configureTotalPaymentSection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllerDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0D68858];
    v6[0] = *MEMORY[0x1E0D68898];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reportAnalyticsEvent:", v4);

    objc_msgSend(v2, "_updateSelectedItem:", 2);
  }

}

- (id)_amountForItemType:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  switch(a3)
  {
    case 2uLL:
      -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "payoffAmount");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v7;
      if (v7)
      {
        v6 = v7;
      }
      else
      {
        -[PKAccountWebServiceFinancingPlanPaymentIntentResponse payoffAmount](self->_intentDetails, "payoffAmount");
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_10;
    case 1uLL:
      -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pastDueAmount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

      return v8;
    case 0uLL:
      -[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "nextDueInstallment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentBalance");
      v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v8 = v6;

      goto LABEL_11;
  }
  v8 = 0;
  return v8;
}

- (void)_updateSelectedItem:(unint64_t)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  self->_selectedItem = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[PKPayLaterMakePaymentSectionController currentSelectedAmount](self, "currentSelectedAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "sectionController:didUpdateCurrentSelectedAmount:", self, v5);

  -[PKPayLaterSectionController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadDataForSectionIdentifier:animated:", CFSTR("kNextPaymentSection"), 1);

  -[PKPayLaterSectionController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadDataForSectionIdentifier:animated:", CFSTR("kTotalPaymentSection"), 1);

}

- (BOOL)_isItemAvailableToSelect:(unint64_t)a3
{
  char v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  switch(a3)
  {
    case 2uLL:
      -[PKPayLaterMakePaymentSectionController _amountForItemType:](self, "_amountForItemType:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      if (-[PKPayLaterMakePaymentSectionController _isItemAvailableToSelect:](self, "_isItemAvailableToSelect:", 0)
        || (v6 = 1,
            -[PKPayLaterMakePaymentSectionController _isItemAvailableToSelect:](self, "_isItemAvailableToSelect:", 1)))
      {
        -[PKPayLaterMakePaymentSectionController _amountForItemType:](self, "_amountForItemType:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v3 = v5 != 0;
        if (v7 && v5)
          v3 = objc_msgSend(v7, "currencyAmountEqualToCurrencyAmount:", v5) ^ 1;
      }
      else
      {
        v8 = 0;
        v3 = v5 != 0;
      }

      break;
    case 1uLL:
      v3 = -[PKPayLaterFinancingPlan state](self->_financingPlan, "state") == 4;
      break;
    case 0uLL:
      if (-[PKPayLaterFinancingPlan state](self->_financingPlan, "state") == 4)
      {
        v3 = 0;
      }
      else
      {
        -[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "nextDueInstallment");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v10 != 0;

      }
      break;
  }
  return v3 & 1;
}

- (id)_detailTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (id)_titleFont
{
  return PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4918], 2, 0);
}

- (id)_detailFont
{
  return PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4918], 0, 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_intentDetails, 0);
  objc_storeStrong((id *)&self->_mediumDateFormatter, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end
