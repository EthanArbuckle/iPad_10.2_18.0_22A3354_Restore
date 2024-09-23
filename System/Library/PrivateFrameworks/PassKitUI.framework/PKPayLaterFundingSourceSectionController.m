@implementation PKPayLaterFundingSourceSectionController

- (PKPayLaterFundingSourceSectionController)initWithPayLaterAccount:(id)a3 dynamicContentPage:(id)a4 peerPaymentAccount:(id)a5 selectedFundingSource:(id)a6 autoPayment:(BOOL)a7 availableFundingSources:(id)a8 setupController:(id)a9 delegate:(id)a10
{
  id v16;
  id v17;
  id v18;
  PKPayLaterFundingSourceSectionController *v19;
  PKPayLaterFundingSourceSectionController *v20;
  uint64_t v21;
  PKPayLaterFinancingOption *selectedFinancingOption;
  NSMutableDictionary *v23;
  NSMutableDictionary *paymentSourceRows;
  id v27;
  id v28;
  objc_super v29;

  v28 = a5;
  v27 = a6;
  v16 = a8;
  v17 = a9;
  v18 = a10;
  v29.receiver = self;
  v29.super_class = (Class)PKPayLaterFundingSourceSectionController;
  v19 = -[PKPayLaterSectionController initWithPayLaterAccount:dynamicContentPage:viewControllerDelegate:](&v29, sel_initWithPayLaterAccount_dynamicContentPage_viewControllerDelegate_, a3, a4, v18);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_setupController, a9);
    objc_storeStrong((id *)&v20->_peerPaymentAccount, a5);
    objc_msgSend(v17, "selectedFinancingOption");
    v21 = objc_claimAutoreleasedReturnValue();
    selectedFinancingOption = v20->_selectedFinancingOption;
    v20->_selectedFinancingOption = (PKPayLaterFinancingOption *)v21;

    objc_storeStrong((id *)&v20->_selectedFundingSource, a6);
    objc_storeStrong((id *)&v20->_availableFundingSources, a8);
    objc_storeWeak((id *)&v20->_delegate, v18);
    v20->_autoPayment = a7;
    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    paymentSourceRows = v20->_paymentSourceRows;
    v20->_paymentSourceRows = v23;

  }
  return v20;
}

- (void)didTapHyperLink:(id)a3
{
  PKPayLaterFundingSourceSectionControllerDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "didTapHyperLink:", v4);

}

- (void)configureCellForRegistration:(id)a3 item:(id)a4
{
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterFundingSourceSectionController;
  v5 = a3;
  -[PKPayLaterSectionController configureCellForRegistration:item:](&v6, sel_configureCellForRegistration_item_, v5, a4);
  PKPayLaterConfigureCollectionViewCellWithGreyBackgroundForCell(v5);

}

- (id)identifiers
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("kPaymentPassSection");
  v3[1] = CFSTR("kAddPaymentMethodSection");
  v3[2] = CFSTR("kAutoPaySection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
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
  if (v7 == CFSTR("kPaymentPassSection"))
    goto LABEL_4;
  if (v7)
  {
    v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("kPaymentPassSection"));

    if (v9)
    {
LABEL_4:
      -[PKPayLaterFundingSourceSectionController _configurePaymentPassSectionSnapshot:](self, "_configurePaymentPassSectionSnapshot:", v6);
      goto LABEL_5;
    }
    v11 = v8;
    if (v11 == CFSTR("kAddPaymentMethodSection")
      || (v12 = v11,
          v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("kAddPaymentMethodSection")),
          v12,
          v13))
    {
      -[PKPayLaterFundingSourceSectionController _configureAddPaymentMethoSectionSnapshot:](self, "_configureAddPaymentMethoSectionSnapshot:", v6);
    }
    else
    {
      v14 = v12;
      if (v14 == CFSTR("kAutoPaySection")
        || (v15 = v14,
            v16 = -[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("kAutoPaySection")),
            v15,
            v16))
      {
        -[PKPayLaterFundingSourceSectionController _configureAutoPaySectionSnapshot:](self, "_configureAutoPaySectionSnapshot:", v6);
      }
    }
  }
LABEL_5:

  return v6;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  double v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKPayLaterFundingSourceSectionController;
  -[PKPayLaterSectionController layoutWithLayoutEnvironment:sectionIdentifier:](&v13, sel_layoutWithLayoutEnvironment_sectionIdentifier_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (__CFString *)v6;
  v9 = v8;
  if (v8 == CFSTR("kAutoPaySection")
    || v8 && (v10 = objc_msgSend(CFSTR("kAutoPaySection"), "isEqualToString:", v8), v9, v10))
  {
    objc_msgSend(v7, "contentInsets");
    objc_msgSend(v7, "setContentInsets:", v11 + 34.0);
  }

  return v7;
}

- (void)paymentSetupDidFinish:(id)a3
{
  PKPayLaterFundingSourceSectionControllerDelegate **p_delegate;
  id WeakRetained;
  id v5;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "reloadFundingSources");

  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_configurePaymentPassSectionSnapshot:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_availableFundingSources;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "type", (_QWORD)v16);
        if (v12 == 2)
        {
          -[PKPayLaterFundingSourceSectionController _paymentSourceRowForBankFundingSource:](self, "_paymentSourceRowForBankFundingSource:", v11);
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
        if (v12 == 1)
        {
          -[PKPayLaterFundingSourceSectionController _paymentSourceRowForPassFundingSource:](self, "_paymentSourceRowForPassFundingSource:", v11);
          v13 = objc_claimAutoreleasedReturnValue();
LABEL_10:
          v14 = (void *)v13;
          goto LABEL_12;
        }
        v14 = 0;
LABEL_12:
        objc_msgSend(v5, "safelyAddObject:", v14);

      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "appendItems:", v15);

}

- (void)_configureAddPaymentMethoSectionSnapshot:(id)a3
{
  id v4;
  id v5;
  PKPayLaterButtonRow *addPaymentMethodRow;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  PKPayLaterButtonRow *v13;
  PKPayLaterButtonRow *v14;
  PKPayLaterButtonRow *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_initWeak(&location, self);
  addPaymentMethodRow = self->_addPaymentMethodRow;
  if (!addPaymentMethodRow)
  {
    -[PKPayLaterFundingSourceSectionController identifiers](self, "identifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterFundingSourceSectionController _pageItemForSectionIndex:](self, "_pageItemForSectionIndex:", objc_msgSend(v7, "indexOfObject:", CFSTR("kAddPaymentMethodSection")));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "contentTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      -[PKPayLaterSetupFlowController preferredLanguage](self->_setupController, "preferredLanguage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedApplyFeatureString();
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    v13 = [PKPayLaterButtonRow alloc];
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __85__PKPayLaterFundingSourceSectionController__configureAddPaymentMethoSectionSnapshot___block_invoke;
    v20 = &unk_1E3E61310;
    objc_copyWeak(&v21, &location);
    v14 = -[PKPayLaterButtonRow initWithTitle:selectionHandler:](v13, "initWithTitle:selectionHandler:", v11, &v17);
    v15 = self->_addPaymentMethodRow;
    self->_addPaymentMethodRow = v14;

    objc_destroyWeak(&v21);
    addPaymentMethodRow = self->_addPaymentMethodRow;
  }
  objc_msgSend(v5, "safelyAddObject:", addPaymentMethodRow, v17, v18, v19, v20);
  v16 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "appendItems:", v16);

  objc_destroyWeak(&location);
}

void __85__PKPayLaterFundingSourceSectionController__configureAddPaymentMethoSectionSnapshot___block_invoke(uint64_t a1)
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
    v6[0] = *MEMORY[0x1E0D68728];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reportAnalyticsEvent:", v4);

    objc_msgSend(v2, "_presentProvisioningFlow");
  }

}

- (void)_configureAutoPaySectionSnapshot:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  PKPayLaterSwitchRow *v12;
  _BOOL8 autoPayment;
  PKPayLaterSwitchRow *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_initWeak(&location, self);
  -[PKPayLaterFundingSourceSectionController identifiers](self, "identifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFundingSourceSectionController _pageItemForSectionIndex:](self, "_pageItemForSectionIndex:", objc_msgSend(v6, "indexOfObject:", CFSTR("kAutoPaySection")));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contentTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[PKPayLaterSetupFlowController preferredLanguage](self->_setupController, "preferredLanguage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedApplyFeatureString();
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  v12 = [PKPayLaterSwitchRow alloc];
  autoPayment = self->_autoPayment;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __77__PKPayLaterFundingSourceSectionController__configureAutoPaySectionSnapshot___block_invoke;
  v19 = &unk_1E3E67C48;
  objc_copyWeak(&v20, &location);
  v14 = -[PKPayLaterSwitchRow initWithTitle:on:changeHandler:](v12, "initWithTitle:on:changeHandler:", v10, autoPayment, &v16);
  -[PKPayLaterSwitchRow setDisabled:](v14, "setDisabled:", self->_selectedFundingSource == 0, v16, v17, v18, v19);
  objc_msgSend(v5, "addObject:", v14);
  v15 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "appendItems:", v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __77__PKPayLaterFundingSourceSectionController__configureAutoPaySectionSnapshot___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = objc_msgSend(v3, "BOOLValue");
    *((_BYTE *)WeakRetained + 160) = v5;
    v6 = objc_loadWeakRetained((id *)WeakRetained + 17);
    objc_msgSend(v6, "didUpdateAutoPayment:", v5);

    objc_msgSend(WeakRetained, "viewControllerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0D68AA0];
    v13[0] = *MEMORY[0x1E0D68788];
    v9 = *MEMORY[0x1E0D695D8];
    v12[0] = v8;
    v12[1] = v9;
    PKAnalyticsReportSwitchToggleResultValue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reportAnalyticsEvent:", v11);

  }
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
  PKPayLaterSetupFlowController *setupController;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
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
    -[PKPayLaterFundingSourceSectionController _rowForPaymentSource:](self, "_rowForPaymentSource:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    setupController = self->_setupController;
    v26[1] = 3221225472;
    v26[2] = __82__PKPayLaterFundingSourceSectionController__paymentSourceRowForPassFundingSource___block_invoke;
    v26[3] = &unk_1E3E67C70;
    v26[0] = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v28, &location);
    v25 = v4;
    v27 = v25;
    -[PKPayLaterSetupFlowController snapshotForPass:completion:](setupController, "snapshotForPass:completion:", v5, v26);
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
    -[PKPayLaterSetupFlowController preferredLanguage](self->_setupController, "preferredLanguage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentAccount currentBalance](self->_peerPaymentAccount, "currentBalance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "formattedStringValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedApplyFeatureString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setOverrideSecondaryText:", v21, v17);

LABEL_13:
LABEL_14:
    v22 = self->_paymentSourceRows;
    objc_msgSend(v25, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v11, v23);

    v9 = v11;
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

    goto LABEL_15;
  }
  v9 = 0;
LABEL_16:

  return v9;
}

void __82__PKPayLaterFundingSourceSectionController__paymentSourceRowForPassFundingSource___block_invoke(uint64_t a1, void *a2)
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
  block[2] = __82__PKPayLaterFundingSourceSectionController__paymentSourceRowForPassFundingSource___block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __82__PKPayLaterFundingSourceSectionController__paymentSourceRowForPassFundingSource___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[18];
    v11 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "dynamicCollectionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellForItem:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "setImage:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v5, "configureCell:", v7);
    }
    else
    {
      objc_msgSend(v11, "dynamicCollectionDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reloadItem:animated:", v5, 1);

    }
    v9 = (void *)v11[18];
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v5, v10);

    WeakRetained = v11;
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

      -[PKPayLaterFundingSourceSectionController _rowForPaymentSource:](self, "_rowForPaymentSource:", v4);
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

- (id)_rowForPaymentSource:(id)a3
{
  id v4;
  void *v5;
  PKPayLaterPaymentSourceRow *v6;
  id v7;
  id v8;
  PKPayLaterPaymentSourceRow *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  id location;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = [PKPayLaterPaymentSourceRow alloc];
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __65__PKPayLaterFundingSourceSectionController__rowForPaymentSource___block_invoke;
  v21 = &unk_1E3E61EE8;
  objc_copyWeak(&v24, &location);
  v7 = v5;
  v22 = v7;
  v8 = v4;
  v23 = v8;
  v9 = -[PKPayLaterPaymentSourceRow initWithPayLaterPaymentSource:selectionHandler:](v6, "initWithPayLaterPaymentSource:selectionHandler:", v8, &v18);
  -[PKPayLaterPaymentSource identifier](self->_selectedFundingSource, "identifier", v18, v19, v20, v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v11;
  v14 = v13;
  if (v12 == v13)
  {
    v16 = 1;
  }
  else
  {
    if (v12)
      v15 = v13 == 0;
    else
      v15 = 1;
    if (v15)
      v16 = 0;
    else
      v16 = objc_msgSend(v12, "isEqualToString:", v13);
  }

  -[PKPayLaterPaymentSourceRow setSelected:](v9, "setSelected:", v16);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v9;
}

void __65__PKPayLaterFundingSourceSectionController__rowForPaymentSource___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v19 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(WeakRetained[18], "objectForKeyedSubscript:");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = v19;
    }
    else
    {
      v3 = 0;
    }
    v4 = WeakRetained + 15;
    v5 = WeakRetained[15];
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    v9 = v7;
    if (v8 != v9)
    {
      v10 = v9;
      if (v8)
        v11 = v9 == 0;
      else
        v11 = 1;
      if (v11)
      {

      }
      else
      {
        v12 = objc_msgSend(v8, "isEqualToString:", v9);

        if (v12)
          goto LABEL_14;
      }
      objc_storeStrong(v4, *(id *)(a1 + 40));
      v14 = objc_loadWeakRetained(v19 + 17);
      objc_msgSend(v14, "didSelectFundingSource:", *(_QWORD *)(a1 + 40));

      if (!v5)
      {
        objc_msgSend(v19, "dynamicCollectionDelegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "reloadDataForSectionIdentifier:animated:", CFSTR("kAutoPaySection"), 1);

      }
      objc_msgSend(v19[18], "objectForKeyedSubscript:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        objc_msgSend(v3, "setSelected:", 1);
        objc_msgSend(v19[18], "setObject:forKey:", v3, *(_QWORD *)(a1 + 32));
        if (v13)
        {
          objc_msgSend(v13, "setSelected:", 0);
          objc_msgSend(v19[18], "setObject:forKey:", v13, v8);
          objc_msgSend(v19, "dynamicCollectionDelegate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "reloadItem:animated:", v13, 1);

        }
        objc_msgSend(v19, "dynamicCollectionDelegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "reloadItem:animated:", v3, 1);

      }
      objc_msgSend(v19, "dynamicCollectionDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "reloadDataForSectionIdentifier:animated:", CFSTR("kPaymentPassSection"), 1);

      goto LABEL_22;
    }

LABEL_14:
    objc_msgSend(v19, "dynamicCollectionDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reloadItem:animated:", v3, 1);
LABEL_22:

    WeakRetained = v19;
  }

}

- (void)_presentProvisioningFlow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PKPayLaterFundingSourceSectionController *v11;
  id v12;
  id location;

  -[PKPayLaterSetupFlowController financingController](self->_setupController, "financingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentWebService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", v4);
  -[PKPayLaterFinancingOption supportedRepaymentNetworks](self->_selectedFinancingOption, "supportedRepaymentNetworks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowedPaymentNetworks:", v6);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowedFeatureIdentifiers:", v7);

  -[PKPayLaterFundingSourceSectionController _showAddPaymentButtonSpinner:](self, "_showAddPaymentButtonSpinner:", 1);
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__PKPayLaterFundingSourceSectionController__presentProvisioningFlow__block_invoke;
  v9[3] = &unk_1E3E63548;
  objc_copyWeak(&v12, &location);
  v8 = v5;
  v10 = v8;
  v11 = self;
  objc_msgSend(v8, "preflightWithCompletion:", v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __68__PKPayLaterFundingSourceSectionController__presentProvisioningFlow__block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  PKPaymentSetupNavigationController *v8;
  PKPaymentSetupNavigationController *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  PKPaymentSetupNavigationController *v13;
  id v14;
  id location;

  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 & 1) != 0)
    {
      v8 = -[PKPaymentSetupNavigationController initWithProvisioningController:context:]([PKPaymentSetupNavigationController alloc], "initWithProvisioningController:context:", a1[4], objc_msgSend(WeakRetained[12], "setupContext"));
      -[PKPaymentSetupNavigationController setPaymentSetupMode:](v8, "setPaymentSetupMode:", 1);
      -[PKPaymentSetupNavigationController setAllowsManualEntry:](v8, "setAllowsManualEntry:", 1);
      -[PKPaymentSetupNavigationController setSetupDelegate:](v8, "setSetupDelegate:", v7);
      -[PKNavigationController setCustomFormSheetPresentationStyleForiPad](v8, "setCustomFormSheetPresentationStyleForiPad");
      objc_initWeak(&location, a1[5]);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __68__PKPayLaterFundingSourceSectionController__presentProvisioningFlow__block_invoke_2;
      v12[3] = &unk_1E3E62FA0;
      objc_copyWeak(&v14, &location);
      v9 = v8;
      v13 = v9;
      -[PKPaymentSetupNavigationController preflightWithCompletion:](v9, "preflightWithCompletion:", v12);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);

    }
    else
    {
      objc_msgSend(WeakRetained, "_showAddPaymentButtonSpinner:", 0);
      objc_msgSend(a1[4], "alertForDisplayableError:", v5);
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

void __68__PKPayLaterFundingSourceSectionController__presentProvisioningFlow__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dynamicCollectionDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__PKPayLaterFundingSourceSectionController__presentProvisioningFlow__block_invoke_3;
    v7[3] = &unk_1E3E61310;
    objc_copyWeak(&v8, v2);
    objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, v7);

    objc_destroyWeak(&v8);
  }

}

void __68__PKPayLaterFundingSourceSectionController__presentProvisioningFlow__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_showAddPaymentButtonSpinner:", 0);
    WeakRetained = v2;
  }

}

- (void)_showAddPaymentButtonSpinner:(BOOL)a3
{
  id v4;

  -[PKPayLaterButtonRow setShowSpinner:](self->_addPaymentMethodRow, "setShowSpinner:", a3);
  -[PKPayLaterSectionController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadItem:animated:", self->_addPaymentMethodRow, 1);

}

- (id)_pageItemForSectionIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PKPayLaterSectionController dynamicContentPage](self, "dynamicContentPage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL || objc_msgSend(v5, "count") <= (unint64_t)a3)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "count");
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rows");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (NSArray)availableFundingSources
{
  return self->_availableFundingSources;
}

- (void)setAvailableFundingSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addPaymentMethodRow, 0);
  objc_storeStrong((id *)&self->_paymentSourceRows, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_availableFundingSources, 0);
  objc_storeStrong((id *)&self->_selectedFundingSource, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_selectedFinancingOption, 0);
  objc_storeStrong((id *)&self->_setupController, 0);
}

@end
