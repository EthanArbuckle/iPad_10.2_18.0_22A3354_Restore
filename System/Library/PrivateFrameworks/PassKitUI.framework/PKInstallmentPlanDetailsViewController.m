@implementation PKInstallmentPlanDetailsViewController

- (PKInstallmentPlanDetailsViewController)initWithAccount:(id)a3 installmentPlan:(id)a4 accountService:(id)a5 accountUserCollection:(id)a6 familyMemberCollection:(id)a7 transactionSourceCollection:(id)a8
{
  id v15;
  id v16;
  id v17;
  PKInstallmentPlanDetailsViewController *v18;
  PKInstallmentPlanDetailsViewController *v19;
  PKPaymentTransactionDetailAmountLineItemGenerator *v20;
  PKPaymentTransactionDetailAmountLineItemGenerator *lineItemGenerator;
  uint64_t v22;
  NSArray *lineItems;
  void *v24;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v15 = a3;
  v28 = a4;
  v16 = a5;
  v17 = a6;
  v27 = a7;
  v26 = a8;
  v29.receiver = self;
  v29.super_class = (Class)PKInstallmentPlanDetailsViewController;
  v18 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v29, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1), 2);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_account, a3);
    objc_storeStrong((id *)&v19->_installmentPlan, a4);
    objc_storeStrong((id *)&v19->_accountService, a5);
    objc_storeStrong((id *)&v19->_accountUserCollection, a6);
    objc_storeStrong((id *)&v19->_familyMemberCollection, a7);
    objc_storeStrong((id *)&v19->_transactionSourceCollection, a8);
    v20 = objc_alloc_init(PKPaymentTransactionDetailAmountLineItemGenerator);
    lineItemGenerator = v19->_lineItemGenerator;
    v19->_lineItemGenerator = v20;

    -[PKPaymentTransactionDetailAmountLineItemGenerator lineItemsForInstallmentPlan:](v19->_lineItemGenerator, "lineItemsForInstallmentPlan:", v28);
    v22 = objc_claimAutoreleasedReturnValue();
    lineItems = v19->_lineItems;
    v19->_lineItems = (NSArray *)v22;

    -[PKInstallmentPlanDetailsViewController navigationItem](v19, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v24, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);

  }
  return v19;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSDecimalNumber *v7;
  NSString *v8;
  void *v9;
  PKPaymentTransactionDetailHeaderView *v10;
  PKPaymentTransactionDetailHeaderView *headerView;
  PKPaymentTransactionDetailHeaderView *v12;
  void *v13;
  PKPaymentTransactionDetailHeaderView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  PKPaymentTransactionDetailHeaderView *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)PKInstallmentPlanDetailsViewController;
  -[PKSectionTableViewController viewDidLoad](&v34, sel_viewDidLoad);
  -[PKInstallmentPlanDetailsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("StatusCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("LineItemCellReuseIdentifier"));
  -[PKCreditInstallmentPlan totalAmount](self->_installmentPlan, "totalAmount");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        -[PKCreditInstallmentPlan currencyCode](self->_installmentPlan, "currencyCode"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    -[PKCreditInstallmentPlan totalAmount](self->_installmentPlan, "totalAmount");
    v7 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    -[PKCreditInstallmentPlan currencyCode](self->_installmentPlan, "currencyCode");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v10 = objc_alloc_init(PKPaymentTransactionDetailHeaderView);
  headerView = self->_headerView;
  self->_headerView = v10;

  v12 = self->_headerView;
  objc_msgSend(v9, "formattedStringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransactionDetailHeaderView setAmountText:](v12, "setAmountText:", v13);

  v14 = self->_headerView;
  -[PKCreditInstallmentPlan merchant](self->_installmentPlan, "merchant");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransactionDetailHeaderView setSubtitleText:](v14, "setSubtitleText:", v16);

  -[PKCreditInstallmentPlan summary](self->_installmentPlan, "summary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v19, "setDateStyle:", 2);
    objc_msgSend(v19, "setTimeStyle:", 1);
    v20 = self->_headerView;
    objc_msgSend(v19, "stringFromDate:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionDetailHeaderView setSecondarySubtitleText:](v20, "setSecondarySubtitleText:", v21);

  }
  -[PKCreditInstallmentPlan accountUserAltDSID](self->_installmentPlan, "accountUserAltDSID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[PKAccountUserCollection accountUserWithAltDSID:](self->_accountUserCollection, "accountUserWithAltDSID:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFamilyMemberCollection familyMemberForAltDSID:](self->_familyMemberCollection, "familyMemberForAltDSID:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0D66C60];
    objc_msgSend(v23, "nameComponents");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "contactForFamilyMember:nameComponents:imageData:", v24, v26, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v27, "givenName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_MEMBER_PURCHASE_BY"), CFSTR("%@"), v28);
      v33 = v18;
      v29 = v3;
      v30 = v23;
      v31 = v9;
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPaymentTransactionDetailHeaderView setTertiarySubtitleText:](self->_headerView, "setTertiarySubtitleText:", v32);
      v9 = v31;
      v23 = v30;
      v3 = v29;
      v18 = v33;
    }

  }
  objc_msgSend(v3, "setTableHeaderView:", self->_headerView);
  objc_msgSend(v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C80]);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKInstallmentPlanDetailsViewController;
  -[PKInstallmentPlanDetailsViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKInstallmentPlanDetailsViewController _updateHeaderHeight](self, "_updateHeaderHeight");
  -[PKInstallmentPlanDetailsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInstallmentPlanDetailsViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (!a3)
    return 1;
  if (a3 == 1)
    return -[PKAccount accessLevel](self->_account, "accessLevel", v3, v4) == 1;
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5;

  v5 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  if (v5 == 1)
    return 3;
  if (v5)
    return 0;
  return -[NSArray count](self->_lineItems, "count") + 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v7, "section"));
  if (v8 == 1)
  {
    -[PKInstallmentPlanDetailsViewController _progressCellForTableView:atIndexPath:](self, "_progressCellForTableView:atIndexPath:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
    {
      v10 = 0;
      goto LABEL_7;
    }
    -[PKInstallmentPlanDetailsViewController _detailsCellForTableView:atIndexPath:](self, "_detailsCellForTableView:atIndexPath:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_7:

  return v10;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  v8 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v7, "section"));
  if (v8 == 1)
  {
    objc_msgSend(v11, "setSeparatorStyle:", objc_msgSend(v11, "hasTrailingLineSeperator"));
  }
  else if (!v8)
  {
    v9 = objc_msgSend(v7, "row");
    if (v9 >= 1)
    {
      -[NSArray objectAtIndex:](self->_lineItems, "objectAtIndex:", v9 - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSeparatorStyle:", objc_msgSend(v10, "hasTrailingLineSeperator"));

    }
  }

}

- (void)_updateHeaderHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  PKPaymentTransactionDetailHeaderView *headerView;
  id v14;

  if (self->_headerView)
  {
    -[PKInstallmentPlanDetailsViewController tableView](self, "tableView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v4 = v3;
    -[PKPaymentTransactionDetailHeaderView frame](self->_headerView, "frame");
    v6 = v5;
    v8 = v7;
    -[PKPaymentTransactionDetailHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v4, 1.79769313e308);
    if (v6 != v10 || v8 != v9)
    {
      v12 = v9;
      headerView = self->_headerView;
      objc_msgSend(v14, "_rectForTableHeaderView");
      -[PKPaymentTransactionDetailHeaderView setFrame:](headerView, "setFrame:");
      objc_msgSend(v14, "_tableHeaderHeightDidChangeToHeight:", v12);
    }

  }
}

- (id)_detailsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  if (v8)
  {
    -[NSArray objectAtIndex:](self->_lineItems, "objectAtIndex:", v8 - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("LineItemCellReuseIdentifier"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEmphasized"))
      v11 = 2;
    else
      v11 = 0;
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4938], v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHasTrailingLineSeperator:", objc_msgSend(v9, "hasTrailingLineSeperator"));
    objc_msgSend(v10, "setTitleFont:", v12);
    objc_msgSend(v9, "label");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitleText:", v13);

    objc_msgSend(v10, "setValueFont:", v12);
    objc_msgSend(v9, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValueText:", v14);

  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("StatusCellReuseIdentifier"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedBeekmanString(CFSTR("APPLE_CARD_INSTALLMENTS"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPrimaryText:", v15);

    if (-[PKCreditInstallmentPlan periodType](self->_installmentPlan, "periodType") == 1)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
      objc_msgSend(v16, "setNumberStyle:", 3);
      -[PKCreditInstallmentPlan apr](self->_installmentPlan, "apr");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "pk_isIntegralNumber");

      if ((v18 & 1) == 0)
        objc_msgSend(v16, "setMinimumFractionDigits:", 2);
      v19 = -[PKCreditInstallmentPlan duration](self->_installmentPlan, "duration");
      -[PKCreditInstallmentPlan apr](self->_installmentPlan, "apr");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringFromNumber:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedString(CFSTR("PLAN_DURATION_APR_MONTHS"), CFSTR("%lu%@"), v19, v21);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v10, "setSecondaryTitle:", v9);
  }

  return v10;
}

- (id)_progressCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSDecimalNumber *v9;
  NSString *v10;
  NSDecimalNumber *v11;
  NSDecimalNumber *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  NSDecimalNumber *v21;
  void *v22;
  void *v23;
  void *v24;
  NSString *v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  switch(v8)
  {
    case 2:
      -[PKCreditInstallmentPlan remainingAmount](self->_installmentPlan, "remainingAmount");
      v12 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      -[PKCreditInstallmentPlan currencyCode](self->_installmentPlan, "currencyCode");
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      v15 = v16;
      if (v12)
        v17 = v16 == 0;
      else
        v17 = 1;
      if (v17)
      {
        v11 = 0;
      }
      else
      {
        PKCurrencyAmountCreate(v12, v16);
        v11 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      }
      PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC4938]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("LineItemCellReuseIdentifier"), v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHasTrailingLineSeperator:", 1);
      objc_msgSend(v13, "setTitleFont:", v22);
      PKLocalizedBeekmanString(CFSTR("TOTAL_REMAINING"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTitleText:", v23);

      objc_msgSend(v13, "setValueFont:", v22);
      -[NSDecimalNumber formattedStringValue](v11, "formattedStringValue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setValueText:", v24);

      goto LABEL_17;
    case 1:
      -[PKCreditInstallmentPlan summary](self->_installmentPlan, "summary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "paymentsToDateAmount");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        v21 = v19;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v21 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      }
      v11 = v21;

      -[PKCreditInstallmentPlan currencyCode](self->_installmentPlan, "currencyCode");
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v11, v25);
      v12 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

      PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4938], 2, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("LineItemCellReuseIdentifier"), v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHasTrailingLineSeperator:", 0);
      objc_msgSend(v13, "setTitleFont:", v15);
      PKLocalizedBeekmanString(CFSTR("TOTAL_PAID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTitleText:", v26);

      objc_msgSend(v13, "setValueFont:", v15);
      -[NSDecimalNumber formattedStringValue](v12, "formattedStringValue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setValueText:", v22);
LABEL_17:

      goto LABEL_18;
    case 0:
      -[PKCreditInstallmentPlan totalBilled](self->_installmentPlan, "totalBilled");
      v9 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      -[PKCreditInstallmentPlan currencyCode](self->_installmentPlan, "currencyCode");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v9, v10);
      v11 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

      PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC4938]);
      v12 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("LineItemCellReuseIdentifier"), v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHasTrailingLineSeperator:", 1);
      objc_msgSend(v13, "setTitleFont:", v12);
      PKLocalizedBeekmanString(CFSTR("TOTAL_BILLED"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTitleText:", v14);

      objc_msgSend(v13, "setValueFont:", v12);
      -[NSDecimalNumber formattedStringValue](v11, "formattedStringValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setValueText:", v15);
LABEL_18:

      goto LABEL_19;
  }
  v13 = 0;
LABEL_19:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_lineItems, 0);
  objc_storeStrong((id *)&self->_lineItemGenerator, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_installmentPlan, 0);
  objc_storeStrong((id *)&self->_familyMemberCollection, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
