@implementation PKPayLaterChangeFundingSourceSectionController

- (PKPayLaterChangeFundingSourceSectionController)initWithFinancingPlan:(id)a3 payLaterPass:(id)a4 paymentIntentController:(id)a5 intentDetails:(id)a6 dynamicContentPage:(id)a7 delegate:(id)a8
{
  id v15;
  id v16;
  id v17;
  void *v18;
  PKPayLaterChangeFundingSourceSectionController *v19;
  void *v20;
  uint64_t v21;
  PKPeerPaymentAccount *peerPaymentAccount;
  PKPassSnapshotter *v23;
  PKPassSnapshotter *snapshotter;
  NSMutableDictionary *v25;
  NSMutableDictionary *paymentSourceRows;
  NSDateFormatter *v27;
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v29;
  void *v30;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v33 = a4;
  v15 = a5;
  v32 = a6;
  v16 = a8;
  v17 = a7;
  objc_msgSend(v15, "payLaterAccount");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35.receiver = self;
  v35.super_class = (Class)PKPayLaterChangeFundingSourceSectionController;
  v19 = -[PKPayLaterSectionController initWithPayLaterAccount:dynamicContentPage:viewControllerDelegate:](&v35, sel_initWithPayLaterAccount_dynamicContentPage_viewControllerDelegate_, v18, v17, v16);

  if (v19)
  {
    objc_storeStrong((id *)&v19->_financingPlan, a3);
    -[PKPayLaterFinancingPlan fundingSource](v19->_financingPlan, "fundingSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19->_autoPayment = objc_msgSend(v20, "autoPayment");

    objc_storeStrong((id *)&v19->_intentDetails, a6);
    objc_storeStrong((id *)&v19->_payLaterPass, a4);
    objc_storeStrong((id *)&v19->_paymentIntentController, a5);
    objc_msgSend(v15, "peerPaymentAccount");
    v21 = objc_claimAutoreleasedReturnValue();
    peerPaymentAccount = v19->_peerPaymentAccount;
    v19->_peerPaymentAccount = (PKPeerPaymentAccount *)v21;

    objc_storeWeak((id *)&v19->_delegate, v16);
    v23 = objc_alloc_init(PKPassSnapshotter);
    snapshotter = v19->_snapshotter;
    v19->_snapshotter = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    paymentSourceRows = v19->_paymentSourceRows;
    v19->_paymentSourceRows = v25;

    v27 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v19->_dateFormatter;
    v19->_dateFormatter = v27;

    v29 = v19->_dateFormatter;
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v29, "setCalendar:", v30);

    -[NSDateFormatter setDateStyle:](v19->_dateFormatter, "setDateStyle:", 1);
    -[PKPayLaterChangeFundingSourceSectionController _updateCachedValues](v19, "_updateCachedValues");
  }

  return v19;
}

- (id)footerContentForSectionIdentifier:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  int v6;
  id v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  char v11;
  __CFString *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == CFSTR("kAutoPaymentSection"))
    goto LABEL_4;
  if (!v4)
    goto LABEL_13;
  v6 = objc_msgSend(CFSTR("kAutoPaymentSection"), "isEqualToString:", v4);

  if (v6)
  {
LABEL_4:
    v7 = objc_alloc_init(MEMORY[0x1E0D66B00]);
    PKLocalizedCocoonString(CFSTR("CHANGE_FUNDING_SOURCE_AUTO_PAY_FOOTER"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFooterText:", v8);

    goto LABEL_18;
  }
  v9 = v5;
  if (v9 != CFSTR("kAutoPaymentNextPaymentSection"))
  {
    v10 = v9;
    v11 = objc_msgSend(CFSTR("kAutoPaymentNextPaymentSection"), "isEqualToString:", v9);

    if ((v11 & 1) == 0)
    {
      if ((v12 = v10, v12 != CFSTR("kAutoPaymentAgreementSection"))
        && (v13 = objc_msgSend(CFSTR("kAutoPaymentAgreementSection"), "isEqualToString:", v12), v12, !v13)
        || -[PKPayLaterChangeFundingSourceSectionController _shouldShowNextPaymentSection](self, "_shouldShowNextPaymentSection"))
      {
        if ((v14 = v12, v14 != CFSTR("kAddPaymentMethodSection"))
          && (v15 = v14,
              v16 = objc_msgSend(CFSTR("kAddPaymentMethodSection"), "isEqualToString:", v14),
              v15,
              !v16)
          || -[PKPayLaterChangeFundingSourceSectionController _shouldShowAutoPaymentAgreementSection](self, "_shouldShowAutoPaymentAgreementSection"))
        {
LABEL_13:
          v7 = 0;
          goto LABEL_18;
        }
      }
    }
  }
  v7 = objc_alloc_init(MEMORY[0x1E0D66B00]);
  PKLocalizedCocoonString(CFSTR("APPLE_PAY_LATER_AGREEMENT_BUTTON"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCocoonString(CFSTR("LOAN_AGREEMENT_BUTTON"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCocoonString(CFSTR("NEXT_PAYMENT_FOOTER"), CFSTR("%1$@%2$@"), v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFooterText:", v19);
  v20 = objc_alloc_init(MEMORY[0x1E0D66B08]);
  objc_msgSend(v20, "setLinkText:", v17);
  -[PKPaymentPass localizedValueForFieldKey:](self->_payLaterPass, "localizedValueForFieldKey:", *MEMORY[0x1E0D6AE20]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v19;
  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(v20, "setLinkURL:", v22);
  objc_msgSend(v20, "setAnalyticsIdentifier:", *MEMORY[0x1E0D695C8]);
  v23 = objc_alloc_init(MEMORY[0x1E0D66B08]);
  objc_msgSend(v23, "setLinkText:", v18);
  -[PKPayLaterFinancingPlan termsDetails](self->_financingPlan, "termsDetails");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "installmentAgreementIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTermsIdentifier:", v25);

  objc_msgSend(v23, "setAnalyticsIdentifier:", *MEMORY[0x1E0D68848]);
  v29[0] = v20;
  v29[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLinks:", v26);

LABEL_18:
  return v7;
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  char v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  int v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v4 = v3;
  if (v3 == CFSTR("kFundingSourceSection"))
    goto LABEL_4;
  if (!v3)
  {
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  v5 = objc_msgSend(CFSTR("kFundingSourceSection"), "isEqualToString:", v3);

  if ((v5 & 1) != 0)
  {
LABEL_4:
    v6 = CFSTR("PAYMENT_METHOD_HEADER");
  }
  else
  {
    v15 = v4;
    if (v15 != CFSTR("kAutoPaymentNextPaymentSection"))
    {
      v16 = v15;
      v17 = objc_msgSend(CFSTR("kAutoPaymentNextPaymentSection"), "isEqualToString:", v15);

      if (!v17)
        goto LABEL_10;
    }
    v6 = CFSTR("NEXT_PAYMENT_HEADER");
  }
  PKLocalizedCocoonString(&v6->isa);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_10;
  v8 = (void *)v7;
  v9 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v8, "uppercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = *MEMORY[0x1E0DC1138];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AB8], (void *)*MEMORY[0x1E0DC4918], 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v19[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v9, "initWithString:attributes:", v10, v13);

LABEL_11:
  return v14;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __CFString *v16;
  __CFString *v17;
  double v18;
  char v19;
  __CFString *v20;
  __CFString *v21;
  int v22;
  objc_super v24;

  v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PKPayLaterChangeFundingSourceSectionController;
  -[PKPayLaterSectionController layoutWithLayoutEnvironment:sectionIdentifier:](&v24, sel_layoutWithLayoutEnvironment_sectionIdentifier_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (__CFString *)v6;
  v17 = v16;
  v18 = 16.0;
  if (v16 != CFSTR("kAutoPaymentSection"))
  {
    if (v16)
    {
      v19 = objc_msgSend(CFSTR("kAutoPaymentSection"), "isEqualToString:", v16);

      if ((v19 & 1) == 0)
      {
        v20 = v17;
        if (v20 == CFSTR("kAutoPaymentAgreementSection")
          || (v21 = v20,
              v22 = objc_msgSend(CFSTR("kAutoPaymentAgreementSection"), "isEqualToString:", v20),
              v21,
              v18 = v9,
              v22))
        {
          v18 = v9 + 30.0;
        }
      }
    }
    else
    {
      v18 = v9;
    }
  }
  objc_msgSend(v7, "setContentInsets:", v18, v11, v13, v15);

  return v7;
}

- (id)identifiers
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "addObject:", CFSTR("kAutoPaymentSection"));
  objc_msgSend(v3, "addObject:", CFSTR("kFundingSourceSection"));
  if (-[PKPayLaterChangeFundingSourceSectionController _shouldShowAddPaymentMethodSection](self, "_shouldShowAddPaymentMethodSection"))
  {
    objc_msgSend(v3, "addObject:", CFSTR("kAddPaymentMethodSection"));
  }
  if (-[PKPayLaterChangeFundingSourceSectionController _shouldShowAutoPaymentAgreementSection](self, "_shouldShowAutoPaymentAgreementSection"))
  {
    objc_msgSend(v3, "addObject:", CFSTR("kAutoPaymentAgreementSection"));
    if (-[PKPayLaterChangeFundingSourceSectionController _shouldShowNextPaymentSection](self, "_shouldShowNextPaymentSection"))
    {
      objc_msgSend(v3, "addObject:", CFSTR("kAutoPaymentNextPaymentSection"));
    }
  }
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
  __CFString *v17;
  __CFString *v18;
  int v19;
  __CFString *v20;
  __CFString *v21;
  int v22;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == CFSTR("kAutoPaymentSection"))
    goto LABEL_4;
  if (v7)
  {
    v9 = objc_msgSend(CFSTR("kAutoPaymentSection"), "isEqualToString:", v7);

    if (v9)
    {
LABEL_4:
      -[PKPayLaterChangeFundingSourceSectionController _configureAutoPaymentSection:](self, "_configureAutoPaymentSection:", v6);
      goto LABEL_5;
    }
    v11 = v8;
    if (v11 == CFSTR("kFundingSourceSection")
      || (v12 = v11, v13 = objc_msgSend(CFSTR("kFundingSourceSection"), "isEqualToString:", v11), v12, v13))
    {
      -[PKPayLaterChangeFundingSourceSectionController _configureFundingSourceSection:](self, "_configureFundingSourceSection:", v6);
    }
    else
    {
      v14 = v12;
      if (v14 == CFSTR("kAddPaymentMethodSection")
        || (v15 = v14,
            v16 = objc_msgSend(CFSTR("kAddPaymentMethodSection"), "isEqualToString:", v14),
            v15,
            v16))
      {
        -[PKPayLaterChangeFundingSourceSectionController _configureAddPaymentMethodSection:](self, "_configureAddPaymentMethodSection:", v6);
      }
      else
      {
        v17 = v15;
        if (v17 == CFSTR("kAutoPaymentAgreementSection")
          || (v18 = v17,
              v19 = objc_msgSend(CFSTR("kAutoPaymentAgreementSection"), "isEqualToString:", v17),
              v18,
              v19))
        {
          -[PKPayLaterChangeFundingSourceSectionController _configureAutoPaymentAgreementSection:](self, "_configureAutoPaymentAgreementSection:", v6);
        }
        else
        {
          v20 = v18;
          if (v20 == CFSTR("kAutoPaymentNextPaymentSection")
            || (v21 = v20,
                v22 = objc_msgSend(CFSTR("kAutoPaymentNextPaymentSection"), "isEqualToString:", v20),
                v21,
                v22))
          {
            -[PKPayLaterChangeFundingSourceSectionController _configureAutoPaymentNextPaymentSection:](self, "_configureAutoPaymentNextPaymentSection:", v6);
          }
        }
      }
    }
  }
LABEL_5:

  return v6;
}

- (void)_configureAutoPaymentSection:(id)a3
{
  id v4;
  id v5;
  PKPayLaterSwitchRow *autoPaySwitchRow;
  PKPayLaterSwitchRow *v7;
  void *v8;
  _BOOL8 autoPayment;
  PKPayLaterSwitchRow *v10;
  PKPayLaterSwitchRow *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_initWeak(&location, self);
  autoPaySwitchRow = self->_autoPaySwitchRow;
  if (!autoPaySwitchRow)
  {
    v7 = [PKPayLaterSwitchRow alloc];
    PKLocalizedCocoonString(CFSTR("AUTO_PAY"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    autoPayment = self->_autoPayment;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __79__PKPayLaterChangeFundingSourceSectionController__configureAutoPaymentSection___block_invoke;
    v13[3] = &unk_1E3E70018;
    objc_copyWeak(&v14, &location);
    v13[4] = self;
    v10 = -[PKPayLaterSwitchRow initWithTitle:on:changeHandler:](v7, "initWithTitle:on:changeHandler:", v8, autoPayment, v13);
    v11 = self->_autoPaySwitchRow;
    self->_autoPaySwitchRow = v10;

    objc_destroyWeak(&v14);
    autoPaySwitchRow = self->_autoPaySwitchRow;
  }
  -[PKPayLaterSwitchRow setOn:](autoPaySwitchRow, "setOn:", self->_autoPayment);
  objc_msgSend(v5, "addObject:", self->_autoPaySwitchRow);
  v12 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "appendItems:", v12);

  objc_destroyWeak(&location);
}

void __79__PKPayLaterChangeFundingSourceSectionController__configureAutoPaymentSection___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained && !*((_BYTE *)WeakRetained + 129))
    objc_msgSend(*(id *)(a1 + 32), "_handleAutoPaySwitchEnabled:", objc_msgSend(v5, "BOOLValue"));

}

- (void)_configureFundingSourceSection:(id)a3
{
  id v4;
  NSArray *availableFundingSources;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSString *selectedFundingSourceCellIdentifier;
  void *v18;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  BOOL v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  availableFundingSources = self->_availableFundingSources;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __81__PKPayLaterChangeFundingSourceSectionController__configureFundingSourceSection___block_invoke;
  v32[3] = &unk_1E3E70040;
  v32[4] = self;
  v6 = -[NSArray pk_containsObjectPassingTest:](availableFundingSources, "pk_containsObjectPassingTest:", v32);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = v7;
  if ((v6 & 1) == 0)
    objc_msgSend(v7, "addObject:", self->_selectedFundingSource);
  objc_msgSend(v8, "addObjectsFromArray:", self->_availableFundingSources, v25);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "type");
        switch(v14)
        {
          case 3:
            -[PKPayLaterChangeFundingSourceSectionController _unavailablePaymentSourceRowForFundingSource:](self, "_unavailablePaymentSourceRowForFundingSource:", v13);
            v15 = objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          case 2:
            -[PKPayLaterChangeFundingSourceSectionController _paymentSourceRowForBankFundingSource:](self, "_paymentSourceRowForBankFundingSource:", v13);
            v15 = objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          case 1:
            -[PKPayLaterChangeFundingSourceSectionController _paymentSourceRowForPassFundingSource:](self, "_paymentSourceRowForPassFundingSource:", v13);
            v15 = objc_claimAutoreleasedReturnValue();
LABEL_14:
            v16 = (void *)v15;
            goto LABEL_16;
        }
        v16 = 0;
LABEL_16:
        objc_msgSend(v16, "setDisabled:", !self->_autoPayment);
        selectedFundingSourceCellIdentifier = self->_selectedFundingSourceCellIdentifier;
        objc_msgSend(v13, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = selectedFundingSourceCellIdentifier;
        v20 = v18;
        v21 = v20;
        if (v19 == v20)
        {
          v23 = 1;
        }
        else
        {
          if (v19)
            v22 = v20 == 0;
          else
            v22 = 1;
          v23 = !v22 && -[NSString isEqualToString:](v19, "isEqualToString:", v20);
        }

        objc_msgSend(v16, "setSelected:", v23);
        objc_msgSend(v4, "safelyAddObject:", v16);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v10);
  }

  v24 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v26, "appendItems:", v24);

}

uint64_t __81__PKPayLaterChangeFundingSourceSectionController__configureFundingSourceSection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v4;
  v7 = v5;
  v8 = v7;
  if (v6 == v7)
  {
    v10 = 1;
  }
  else
  {
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
      v10 = 0;
    else
      v10 = objc_msgSend(v6, "isEqualToString:", v7);
  }

  return v10;
}

- (void)_configureAddPaymentMethodSection:(id)a3
{
  id v4;
  id v5;
  PKPayLaterButtonRow *addPaymentMethodRow;
  __CFString *v7;
  void *v8;
  PKPayLaterButtonRow *v9;
  PKPayLaterButtonRow *v10;
  PKPayLaterButtonRow *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  addPaymentMethodRow = self->_addPaymentMethodRow;
  if (!addPaymentMethodRow)
  {
    if ((-[PKAccountWebServiceFinancingPlanPaymentIntentResponse supportedRepaymentTypes](self->_intentDetails, "supportedRepaymentTypes") & 0xA) != 0)v7 = CFSTR("ADD_PAYMENT_METHOD");
    else
      v7 = CFSTR("ADD_DEBIT_CARD");
    PKLocalizedCocoonString(&v7->isa);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v9 = [PKPayLaterButtonRow alloc];
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __84__PKPayLaterChangeFundingSourceSectionController__configureAddPaymentMethodSection___block_invoke;
    v16 = &unk_1E3E61310;
    objc_copyWeak(&v17, &location);
    v10 = -[PKPayLaterButtonRow initWithTitle:selectionHandler:](v9, "initWithTitle:selectionHandler:", v8, &v13);
    v11 = self->_addPaymentMethodRow;
    self->_addPaymentMethodRow = v10;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

    addPaymentMethodRow = self->_addPaymentMethodRow;
  }
  -[PKPayLaterButtonRow setDisabled:](addPaymentMethodRow, "setDisabled:", !self->_autoPayment, v13, v14, v15, v16);
  objc_msgSend(v5, "addObject:", self->_addPaymentMethodRow);
  v12 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "appendItems:", v12);

}

void __84__PKPayLaterChangeFundingSourceSectionController__configureAddPaymentMethodSection___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
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
    v6[0] = *MEMORY[0x1E0D68728];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reportAnalyticsEvent:", v4);

    objc_msgSend(v2, "_presentProvisioningFlowFromRow:", v2[18]);
  }

}

- (void)_configureAutoPaymentAgreementSection:(id)a3
{
  objc_class *v3;
  id v4;
  PKPayLaterTitleDetailRow *v5;
  void *v6;
  void *v7;
  PKPayLaterTitleDetailRow *v8;
  PKPayLaterTitleDetailRow *v9;
  void *v10;
  void *v11;
  PKPayLaterTitleDetailRow *v12;
  void *v13;
  id v14;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v14 = objc_alloc_init(v3);
  v5 = [PKPayLaterTitleDetailRow alloc];
  PKLocalizedCocoonString(CFSTR("PAYMENT_TYPE_ROW"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCocoonString(CFSTR("AUTO_PAY"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKPayLaterTitleDetailRow initWithTitle:detail:selectionHandler:](v5, "initWithTitle:detail:selectionHandler:", v6, v7, 0);

  objc_msgSend(v14, "safelyAddObject:", v8);
  v9 = [PKPayLaterTitleDetailRow alloc];
  PKLocalizedCocoonString(CFSTR("REPEATS_ROW"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCocoonString(CFSTR("PAYMENT_DUE_DATE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PKPayLaterTitleDetailRow initWithTitle:detail:selectionHandler:](v9, "initWithTitle:detail:selectionHandler:", v10, v11, 0);

  objc_msgSend(v14, "safelyAddObject:", v12);
  v13 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v4, "appendItems:", v13);

}

- (void)_configureAutoPaymentNextPaymentSection:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  NSDateFormatter *dateFormatter;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  PKPayLaterTitleDetailRow *v14;
  void *v15;
  PKPayLaterTitleDetailRow *v16;
  PKPayLaterTitleDetailRow *v17;
  void *v18;
  PKPayLaterTitleDetailRow *v19;
  void *v20;
  id v21;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v21 = objc_alloc_init(v4);
  -[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextDueInstallment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  dateFormatter = self->_dateFormatter;
  objc_msgSend(v7, "dueDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "currentBalance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "formattedStringValue");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if ((-[PKPayLaterFinancingPlan state](self->_financingPlan, "state") & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    PKLocalizedCocoonString(CFSTR("NEXT_PAYMENT_ROW_PENDING"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v13;
    v10 = v12;
  }
  v14 = [PKPayLaterTitleDetailRow alloc];
  PKLocalizedCocoonString(CFSTR("NEXT_PAYMENT_ROW_DATE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PKPayLaterTitleDetailRow initWithTitle:detail:selectionHandler:](v14, "initWithTitle:detail:selectionHandler:", v15, v10, 0);

  objc_msgSend(v21, "safelyAddObject:", v16);
  v17 = [PKPayLaterTitleDetailRow alloc];
  PKLocalizedCocoonString(CFSTR("NEXT_PAYMENT_ROW_AMOUNT"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PKPayLaterTitleDetailRow initWithTitle:detail:selectionHandler:](v17, "initWithTitle:detail:selectionHandler:", v18, v12, 0);

  objc_msgSend(v21, "safelyAddObject:", v19);
  v20 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v5, "appendItems:", v20);

}

- (BOOL)_shouldShowNextPaymentSection
{
  BOOL v3;
  void *v4;
  void *v5;

  if ((-[PKPayLaterFinancingPlan state](self->_financingPlan, "state") & 0xFFFFFFFFFFFFFFFELL) == 2)
    return 1;
  -[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextDueInstallment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5 != 0;

  return v3;
}

- (BOOL)_shouldShowAutoPaymentAgreementSection
{
  void *v2;
  char v3;

  -[PKPayLaterFinancingPlan fundingSource](self->_financingPlan, "fundingSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "autoPayment");

  return v3;
}

- (BOOL)_shouldShowAddPaymentMethodSection
{
  return -[PKPayLaterFinancingPlan state](self->_financingPlan, "state") != 3;
}

- (id)_paymentSourceRowForPassFundingSource:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *paymentSourceRows;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;

  v4 = a3;
  objc_msgSend(v4, "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    paymentSourceRows = self->_paymentSourceRows;
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](paymentSourceRows, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
LABEL_15:

      goto LABEL_16;
    }
    -[PKPeerPaymentAccount associatedPassUniqueID](self->_peerPaymentAccount, "associatedPassUniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    -[PKPayLaterChangeFundingSourceSectionController _rowForPaymentSource:](self, "_rowForPaymentSource:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = 3221225472;
    v24[2] = __88__PKPayLaterChangeFundingSourceSectionController__paymentSourceRowForPassFundingSource___block_invoke;
    v24[3] = &unk_1E3E67C70;
    v24[0] = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v26, &location);
    v12 = v4;
    v25 = v12;
    -[PKPayLaterChangeFundingSourceSectionController _snapshotForPass:completion:](self, "_snapshotForPass:completion:", v5, v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", v13);

    objc_msgSend(v5, "uniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v10;
    v16 = v14;
    if (v15 == v16)
    {

    }
    else
    {
      v17 = v16;
      if (!v15 || !v16)
      {
        v20 = v15;
        v19 = v16;
        goto LABEL_13;
      }
      v18 = objc_msgSend(v15, "isEqualToString:", v16);

      if (!v18)
        goto LABEL_14;
    }
    -[PKPeerPaymentAccount currentBalance](self->_peerPaymentAccount, "currentBalance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "formattedStringValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCocoonString(CFSTR("PEER_PAYMENT_IN_APP_BALANCE_FORMAT"), CFSTR("%@"), v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setOverrideSecondaryText:", v17);
LABEL_13:

LABEL_14:
    v21 = self->_paymentSourceRows;
    objc_msgSend(v12, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v11, v22);

    v9 = v11;
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

    goto LABEL_15;
  }
  v9 = 0;
LABEL_16:

  return v9;
}

void __88__PKPayLaterChangeFundingSourceSectionController__paymentSourceRowForPassFundingSource___block_invoke(uint64_t a1, void *a2)
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
  block[2] = __88__PKPayLaterChangeFundingSourceSectionController__paymentSourceRowForPassFundingSource___block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __88__PKPayLaterChangeFundingSourceSectionController__paymentSourceRowForPassFundingSource___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && !*((_BYTE *)WeakRetained + 129))
  {
    v3 = (void *)WeakRetained[22];
    v9 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setImage:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v9, "dynamicCollectionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadItem:animated:", v5, 1);

    v7 = (void *)v9[22];
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);

    WeakRetained = v9;
  }

}

- (id)_paymentSourceRowForBankFundingSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *paymentSourceRows;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;

  v4 = a3;
  objc_msgSend(v4, "accountPaymentFundingSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    paymentSourceRows = self->_paymentSourceRows;
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](paymentSourceRows, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = v9;
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0DC3870];
      PKPassKitUIBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "imageNamed:inBundle:", CFSTR("BankAccountCard"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPayLaterChangeFundingSourceSectionController _rowForPaymentSource:](self, "_rowForPaymentSource:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setImage:", v13);
      v15 = self->_paymentSourceRows;
      objc_msgSend(v4, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v14, v16);

      v10 = v14;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_unavailablePaymentSourceRowForFundingSource:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *paymentSourceRows;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    paymentSourceRows = self->_paymentSourceRows;
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](paymentSourceRows, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
    }
    else
    {
      PKUIImageNamed(CFSTR("PlaceholderCardArt_Large"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc(MEMORY[0x1E0D66DF8]);
      v12 = objc_retainAutorelease(v10);
      v13 = (void *)objc_msgSend(v11, "initWithCGImage:scale:orientation:", objc_msgSend(v12, "CGImage"), 1, PKUIScreenScale());
      v14 = (void *)MEMORY[0x1E0D66E08];
      -[PKPayLaterChangeFundingSourceSectionController _passImageSize](self, "_passImageSize");
      objc_msgSend(v14, "constraintsWithAspectFillToSize:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "resizedImageWithConstraints:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPayLaterChangeFundingSourceSectionController _rowForPaymentSource:](self, "_rowForPaymentSource:", v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setImage:", v17);
      v19 = self->_paymentSourceRows;
      objc_msgSend(v5, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v18, v20);

      v9 = v18;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_rowForPaymentSource:(id)a3
{
  id v4;
  void *v5;
  PKPayLaterPaymentSourceRow *v6;
  id v7;
  id v8;
  PKPayLaterPaymentSourceRow *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = [PKPayLaterPaymentSourceRow alloc];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__PKPayLaterChangeFundingSourceSectionController__rowForPaymentSource___block_invoke;
  v11[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v14, &location);
  v7 = v5;
  v12 = v7;
  v8 = v4;
  v13 = v8;
  v9 = -[PKPayLaterPaymentSourceRow initWithPayLaterPaymentSource:selectionHandler:](v6, "initWithPayLaterPaymentSource:selectionHandler:", v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

void __71__PKPayLaterChangeFundingSourceSectionController__rowForPaymentSource___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && !*((_BYTE *)WeakRetained + 129))
  {
    v20 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(WeakRetained[22], "objectForKeyedSubscript:");
      v4 = objc_claimAutoreleasedReturnValue();
      v3 = v20;
      v5 = (void *)v4;
    }
    else
    {
      v5 = 0;
    }
    v6 = v3[20];
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    v10 = v8;
    if (v9 != v10)
    {
      v11 = v10;
      if (v9)
        v12 = v10 == 0;
      else
        v12 = 1;
      if (v12)
      {

      }
      else
      {
        v13 = objc_msgSend(v9, "isEqualToString:", v10);

        if (v13)
          goto LABEL_15;
      }
      objc_storeStrong(v20 + 21, *(id *)(a1 + 32));
      v15 = objc_loadWeakRetained(v20 + 13);
      objc_msgSend(v15, "didSelectFundingSource:", *(_QWORD *)(a1 + 40));

      if (!v6)
      {
        objc_msgSend(v20, "dynamicCollectionDelegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "reloadDataForSectionIdentifier:animated:", CFSTR("kAutoPaymentSection"), 0);

      }
      objc_msgSend(v20[22], "objectForKeyedSubscript:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v5, "setSelected:", 1);
        objc_msgSend(v20[22], "setObject:forKey:", v5, *(_QWORD *)(a1 + 32));
        if (v14)
        {
          objc_msgSend(v14, "setSelected:", 0);
          objc_msgSend(v20[22], "setObject:forKey:", v14, v9);
          objc_msgSend(v20, "dynamicCollectionDelegate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "reloadItem:animated:", v14, 1);

        }
        objc_msgSend(v20, "dynamicCollectionDelegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "reloadItem:animated:", v5, 1);

      }
      objc_msgSend(v20, "dynamicCollectionDelegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "reloadDataForSectionIdentifier:animated:", CFSTR("kFundingSourceSection"), 1);

      goto LABEL_23;
    }

LABEL_15:
    objc_msgSend(v20, "dynamicCollectionDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reloadItem:animated:", v5, 1);
LABEL_23:

    v3 = v20;
  }

}

- (void)_presentProvisioningFlowFromRow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  PKPayLaterChangeFundingSourceSectionController *v13;
  id v14;
  id location;

  v4 = a3;
  if (!self->_preventTouches)
  {
    self->_preventTouches = 1;
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", v5);
    -[PKAccountWebServiceFinancingPlanPaymentIntentResponse supportedRepaymentNetworks](self->_intentDetails, "supportedRepaymentNetworks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowedPaymentNetworks:", v7);

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowedFeatureIdentifiers:", v8);

    -[PKPayLaterChangeFundingSourceSectionController _showButtonSpinnerForRow:showSpinner:](self, "_showButtonSpinnerForRow:showSpinner:", v4, 1);
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __82__PKPayLaterChangeFundingSourceSectionController__presentProvisioningFlowFromRow___block_invoke;
    v10[3] = &unk_1E3E65C48;
    objc_copyWeak(&v14, &location);
    v11 = v4;
    v9 = v6;
    v12 = v9;
    v13 = self;
    objc_msgSend(v9, "preflightWithCompletion:", v10);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
}

void __82__PKPayLaterChangeFundingSourceSectionController__presentProvisioningFlowFromRow___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  _BYTE *WeakRetained;
  void *v7;
  PKPaymentSetupNavigationController *v8;
  PKPaymentSetupNavigationController *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  PKPaymentSetupNavigationController *v13;
  id v14;
  id v15;
  id location;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 & 1) != 0)
    {
      v8 = -[PKPaymentSetupNavigationController initWithProvisioningController:context:]([PKPaymentSetupNavigationController alloc], "initWithProvisioningController:context:", a1[5], 8);
      -[PKPaymentSetupNavigationController setPaymentSetupMode:](v8, "setPaymentSetupMode:", 1);
      -[PKPaymentSetupNavigationController setAllowsManualEntry:](v8, "setAllowsManualEntry:", 1);
      -[PKPaymentSetupNavigationController setSetupDelegate:](v8, "setSetupDelegate:", v7);
      -[PKNavigationController setCustomFormSheetPresentationStyleForiPad](v8, "setCustomFormSheetPresentationStyleForiPad");
      objc_initWeak(&location, a1[6]);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __82__PKPayLaterChangeFundingSourceSectionController__presentProvisioningFlowFromRow___block_invoke_2;
      v12[3] = &unk_1E3E63B10;
      objc_copyWeak(&v15, &location);
      v9 = v8;
      v13 = v9;
      v14 = a1[4];
      -[PKPaymentSetupNavigationController preflightWithCompletion:](v9, "preflightWithCompletion:", v12);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);

    }
    else
    {
      WeakRetained[129] = 0;
      objc_msgSend(WeakRetained, "_showButtonSpinnerForRow:showSpinner:", a1[4], 0);
      objc_msgSend(a1[5], "alertForDisplayableError:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v7, "dynamicCollectionDelegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, 0);

      }
    }
  }

}

void __82__PKPayLaterChangeFundingSourceSectionController__presentProvisioningFlowFromRow___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dynamicCollectionDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __82__PKPayLaterChangeFundingSourceSectionController__presentProvisioningFlowFromRow___block_invoke_3;
    v7[3] = &unk_1E3E61B68;
    objc_copyWeak(&v9, v2);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, v7);

    objc_destroyWeak(&v9);
  }

}

void __82__PKPayLaterChangeFundingSourceSectionController__presentProvisioningFlowFromRow___block_invoke_3(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[129] = 0;
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_showButtonSpinnerForRow:showSpinner:", *(_QWORD *)(a1 + 32), 0);
    WeakRetained = v3;
  }

}

- (id)_snapshotForPass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKPassSnapshotter *snapshotter;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    snapshotter = self->_snapshotter;
    -[PKPayLaterChangeFundingSourceSectionController _passImageSize](self, "_passImageSize");
    v10 = v9;
    v12 = v11;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __78__PKPayLaterChangeFundingSourceSectionController__snapshotForPass_completion___block_invoke;
    v14[3] = &unk_1E3E627D8;
    objc_copyWeak(&v16, &location);
    v15 = v7;
    -[PKPassSnapshotter snapshotWithPass:size:completion:](snapshotter, "snapshotWithPass:size:completion:", v6, v14, v10, v12);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return 0;
}

void __78__PKPayLaterChangeFundingSourceSectionController__snapshotForPass_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PKPayLaterChangeFundingSourceSectionController__snapshotForPass_completion___block_invoke_2;
  block[3] = &unk_1E3E61478;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __78__PKPayLaterChangeFundingSourceSectionController__snapshotForPass_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      v4 = WeakRetained;
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
      WeakRetained = v4;
    }
  }

}

- (CGSize)_passImageSize
{
  double v2;
  double v3;
  CGSize result;

  PKPassFrontFaceContentSize();
  PKSizeAspectFit();
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_showButtonSpinnerForRow:(id)a3 showSpinner:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "setShowSpinner:", v4);
    -[PKPayLaterSectionController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadItem:animated:", v7, 1);

  }
}

- (void)_handleAutoPaySwitchEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD aBlock[4];
  id v24;
  id location;
  _QWORD v26[3];
  _QWORD v27[4];

  v3 = a3;
  v27[3] = *MEMORY[0x1E0C80C00];
  -[PKPayLaterSectionController viewControllerDelegate](self, "viewControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D68C28];
  v7 = *MEMORY[0x1E0D695D8];
  v26[0] = *MEMORY[0x1E0D68AA0];
  v26[1] = v7;
  v8 = *MEMORY[0x1E0D68788];
  v27[0] = v6;
  v27[1] = v8;
  v26[2] = *MEMORY[0x1E0D695A0];
  PKAnalyticsReportSwitchToggleResultValue();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportAnalyticsEvent:", v10);

  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PKPayLaterChangeFundingSourceSectionController__handleAutoPaySwitchEnabled___block_invoke;
  aBlock[3] = &unk_1E3E61310;
  objc_copyWeak(&v24, &location);
  v12 = _Block_copy(aBlock);
  self->_autoPayment = v3;
  if (v3 && !-[NSArray count](self->_availableFundingSources, "count"))
  {
    -[PKPayLaterChangeFundingSourceSectionController _presentProvisioningFlowFromRow:](self, "_presentProvisioningFlowFromRow:", self->_autoPaySwitchRow);
  }
  else
  {
    -[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "installments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pk_firstObjectPassingTest:", &__block_literal_global_130);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    self->_preventTouches = 1;
    -[PKPayLaterSwitchRow setShowSpinner:](self->_autoPaySwitchRow, "setShowSpinner:", 1);
    -[PKPayLaterSectionController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "reloadItem:animated:", self->_autoPaySwitchRow, 1);

    -[PKPayLaterSectionController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reloadDataAnimated:", 1);

    if (v3 && v15 != 0)
    {
      v21[0] = v11;
      v21[1] = 3221225472;
      v21[2] = __78__PKPayLaterChangeFundingSourceSectionController__handleAutoPaySwitchEnabled___block_invoke_3;
      v21[3] = &unk_1E3E61850;
      v21[4] = self;
      v22 = v12;
      -[PKPayLaterChangeFundingSourceSectionController _presentAutoPayOverdueAlertWithCompletion:](self, "_presentAutoPayOverdueAlertWithCompletion:", v21);

    }
    else
    {
      self->_autoPayment = v3;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __78__PKPayLaterChangeFundingSourceSectionController__handleAutoPaySwitchEnabled___block_invoke_4;
      v19[3] = &unk_1E3E61590;
      v20 = v12;
      objc_msgSend(WeakRetained, "didUpdateAutoPayment:completion:", v3, v19);

    }
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __78__PKPayLaterChangeFundingSourceSectionController__handleAutoPaySwitchEnabled___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 129) = 0;
    v4 = WeakRetained;
    objc_msgSend(*((id *)WeakRetained + 19), "setShowSpinner:", 0);
    objc_msgSend(v4, "dynamicCollectionDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadItem:animated:", v4[19], 1);

    objc_msgSend(v4, "dynamicCollectionDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadDataAnimated:", 1);

    WeakRetained = v4;
  }

}

BOOL __78__PKPayLaterChangeFundingSourceSectionController__handleAutoPaySwitchEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "status") == 4;
}

uint64_t __78__PKPayLaterChangeFundingSourceSectionController__handleAutoPaySwitchEnabled___block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 128) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __78__PKPayLaterChangeFundingSourceSectionController__handleAutoPaySwitchEnabled___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_presentAutoPayOverdueAlertWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedCocoonString(CFSTR("PLAN_DELINQUINT_FUNDING_SOURCE_CHANGE_ALERT_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCocoonString(CFSTR("PLAN_DELINQUINT_FUNDING_SOURCE_CHANGE_ALERT_MESSAGE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedCocoonString(CFSTR("PLAN_DELINQUINT_FUNDING_SOURCE_CHANGE_ALERT_MAKE_PAYMENT_BUTTON"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __92__PKPayLaterChangeFundingSourceSectionController__presentAutoPayOverdueAlertWithCompletion___block_invoke;
  v21[3] = &unk_1E3E683C8;
  v21[4] = self;
  v12 = v4;
  v22 = v12;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedCocoonString(CFSTR("PLAN_DELINQUINT_FUNDING_SOURCE_CHANGE_ALERT_OK_BUTTON"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __92__PKPayLaterChangeFundingSourceSectionController__presentAutoPayOverdueAlertWithCompletion___block_invoke_2;
  v19[3] = &unk_1E3E61CA8;
  v20 = v12;
  v16 = v12;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v13);
  objc_msgSend(v8, "addAction:", v17);
  -[PKPayLaterSectionController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "presentViewController:animated:completion:", v8, 1, 0);

}

uint64_t __92__PKPayLaterChangeFundingSourceSectionController__presentAutoPayOverdueAlertWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentMakePaymentWithCompletion:", *(_QWORD *)(a1 + 40));
}

uint64_t __92__PKPayLaterChangeFundingSourceSectionController__presentAutoPayOverdueAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_presentMakePaymentWithCompletion:(id)a3
{
  id v4;
  PKPayLaterMakePaymentViewController *v5;
  PKNavigationController *v6;
  id v7;
  PKNavigationController *v8;
  _QWORD v9[4];
  PKNavigationController *v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  v5 = -[PKPayLaterMakePaymentViewController initWithFinancingPlan:paymentIntentController:]([PKPayLaterMakePaymentViewController alloc], "initWithFinancingPlan:paymentIntentController:", self->_financingPlan, self->_paymentIntentController);
  v6 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v5);
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__PKPayLaterChangeFundingSourceSectionController__presentMakePaymentWithCompletion___block_invoke;
  v9[3] = &unk_1E3E64460;
  objc_copyWeak(&v12, &location);
  v7 = v4;
  v11 = v7;
  v8 = v6;
  v10 = v8;
  -[PKPayLaterMakePaymentViewController preflightWithCompletion:](v5, "preflightWithCompletion:", v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __84__PKPayLaterChangeFundingSourceSectionController__presentMakePaymentWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v9)
    {
      PKAccountDisplayableError();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);

      if (v6)
      {
        objc_msgSend(WeakRetained, "dynamicCollectionDelegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "presentViewController:animated:completion:", v6, 1, *(_QWORD *)(a1 + 40));

      }
      else
      {
        v8 = *(_QWORD *)(a1 + 40);
        if (v8)
          (*(void (**)(void))(v8 + 16))();
        v6 = 0;
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "dynamicCollectionDelegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40));
    }

  }
}

- (void)paymentSetupDidFinish:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__PKPayLaterChangeFundingSourceSectionController_paymentSetupDidFinish___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __72__PKPayLaterChangeFundingSourceSectionController_paymentSetupDidFinish___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_updateCachedValues");
  objc_msgSend(*(id *)(a1 + 32), "dynamicCollectionDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadDataAnimated:", 1);

  return objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)setPaymentIntentController:(id)a3
{
  PKPayLaterPaymentIntentController *v5;
  PKPayLaterPaymentIntentController *v6;

  v5 = (PKPayLaterPaymentIntentController *)a3;
  if (self->_paymentIntentController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_paymentIntentController, a3);
    -[PKPayLaterChangeFundingSourceSectionController _updateCachedValues](self, "_updateCachedValues");
    v5 = v6;
  }

}

- (void)setIntentDetails:(id)a3
{
  PKAccountWebServiceFinancingPlanPaymentIntentResponse *v5;
  PKAccountWebServiceFinancingPlanPaymentIntentResponse *v6;

  v5 = (PKAccountWebServiceFinancingPlanPaymentIntentResponse *)a3;
  if (self->_intentDetails != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_intentDetails, a3);
    -[PKPayLaterChangeFundingSourceSectionController _updateCachedValues](self, "_updateCachedValues");
    v5 = v6;
  }

}

- (void)setFinancingPlan:(id)a3
{
  objc_storeStrong((id *)&self->_financingPlan, a3);
  -[PKPayLaterChangeFundingSourceSectionController _updateCachedValues](self, "_updateCachedValues");
}

- (void)_updateCachedValues
{
  void *v3;
  PKPayLaterPaymentSource *v4;
  PKPayLaterPaymentSource *selectedFundingSource;
  NSString *v6;
  NSString *selectedFundingSourceCellIdentifier;
  void *v8;
  PKPayLaterPaymentIntentController *paymentIntentController;
  PKAccountWebServiceFinancingPlanPaymentIntentResponse *intentDetails;
  NSArray *v11;
  NSArray *availableFundingSources;
  id v13;

  -[PKPayLaterFinancingPlan fundingSource](self->_financingPlan, "fundingSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_autoPayment = objc_msgSend(v3, "autoPayment");

  -[PKPayLaterFinancingPlan paymentSource](self->_financingPlan, "paymentSource");
  v4 = (PKPayLaterPaymentSource *)objc_claimAutoreleasedReturnValue();
  selectedFundingSource = self->_selectedFundingSource;
  self->_selectedFundingSource = v4;

  -[PKPayLaterPaymentSource identifier](self->_selectedFundingSource, "identifier");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  selectedFundingSourceCellIdentifier = self->_selectedFundingSourceCellIdentifier;
  self->_selectedFundingSourceCellIdentifier = v6;

  -[PKPayLaterPaymentIntentController availableFundingSourcesFilter](self->_paymentIntentController, "availableFundingSourcesFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearCache");

  paymentIntentController = self->_paymentIntentController;
  intentDetails = self->_intentDetails;
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterPaymentIntentController availableFundingSourcesForPaymentIntentDetails:currencyAmount:planIdentifier:primaryPaymentSource:](paymentIntentController, "availableFundingSourcesForPaymentIntentDetails:currencyAmount:planIdentifier:primaryPaymentSource:", intentDetails, 0, v13, self->_selectedFundingSource);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  availableFundingSources = self->_availableFundingSources;
  self->_availableFundingSources = v11;

}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (PKPayLaterPaymentIntentController)paymentIntentController
{
  return self->_paymentIntentController;
}

- (PKAccountWebServiceFinancingPlanPaymentIntentResponse)intentDetails
{
  return self->_intentDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentDetails, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_paymentSourceRows, 0);
  objc_storeStrong((id *)&self->_selectedFundingSourceCellIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedFundingSource, 0);
  objc_storeStrong((id *)&self->_autoPaySwitchRow, 0);
  objc_storeStrong((id *)&self->_addPaymentMethodRow, 0);
  objc_storeStrong((id *)&self->_availableFundingSources, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_snapshotter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
}

@end
