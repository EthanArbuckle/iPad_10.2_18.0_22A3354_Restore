@implementation PKPayLaterAvailableFundingSourcesFilter

- (PKPayLaterAvailableFundingSourcesFilter)initWithPassLibrary:(id)a3 peerPaymentAccount:(id)a4 defaultPassUniqueIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPayLaterAvailableFundingSourcesFilter *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *availableFundingSources;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterAvailableFundingSourcesFilter;
  v12 = -[PKPayLaterAvailableFundingSourcesFilter init](&v16, sel_init);
  if (v12)
  {
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    availableFundingSources = v12->_availableFundingSources;
    v12->_availableFundingSources = v13;

    objc_storeStrong((id *)&v12->_peerPaymentAccount, a4);
    objc_storeStrong((id *)&v12->_passLibrary, a3);
    objc_storeStrong((id *)&v12->_defaultPassUniqueIdentifier, a5);
  }

  return v12;
}

- (id)availableFundingSourcesForFinancingOption:(id)a3 eligibleBankSources:(id)a4 lastUsedFundingSources:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v23;
  void *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 && objc_msgSend(v11, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_availableFundingSources, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      v14 = v13;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = (uint64_t)v12;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Looking up available funding sources for option %@", buf, 0xCu);
      }

      objc_msgSend(v8, "installmentAmount");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currencyAmount");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_msgSend(v8, "supportedRepaymentTypes");
      objc_msgSend(v8, "supportedRepaymentNetworks");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "supportedRepaymentCountries");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterAvailableFundingSourcesFilter _availableFundingSourcesForSupportedRepaymentTypes:supportedRepaymentCountries:supportedRepaymentNetworks:eligibleBankSources:lastUsedFundingSources:installmentAmount:](self, "_availableFundingSourcesForSupportedRepaymentTypes:supportedRepaymentCountries:supportedRepaymentNetworks:eligibleBankSources:lastUsedFundingSources:installmentAmount:", v18);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_availableFundingSources, "setObject:forKey:", v14, v12);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_msgSend(v14, "count");
        objc_msgSend(v8, "identifier");
        v23 = v17;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v26 = v20;
        v27 = 2112;
        v28 = v21;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Found %ld available funding sources for financing option %@", buf, 0x16u);

        v17 = v23;
      }

    }
  }
  else
  {
    v14 = (id)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

- (void)clearCache
{
  -[NSMutableDictionary removeAllObjects](self->_availableFundingSources, "removeAllObjects");
}

- (id)availableFundingSourcesForPaymentIntentDetails:(id)a3 currencyAmount:(id)a4 planIdentifier:(id)a5 primaryPaymentSource:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v26 = a6;
  PKLogFacilityTypeGetObject(6uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = (uint64_t)v12;
    _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Looking up available funding sources for planIdentifier %@", buf, 0xCu);
  }

  v14 = v11;
  v15 = objc_msgSend(v10, "supportedRepaymentTypes");
  objc_msgSend(v10, "supportedRepaymentNetworks");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bankAcceptedFundingSources");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "supportedRepaymentCountries");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastUsedFundingSources");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)v16;
  -[PKPayLaterAvailableFundingSourcesFilter _availableFundingSourcesForSupportedRepaymentTypes:supportedRepaymentCountries:supportedRepaymentNetworks:eligibleBankSources:lastUsedFundingSources:installmentAmount:](self, "_availableFundingSourcesForSupportedRepaymentTypes:supportedRepaymentCountries:supportedRepaymentNetworks:eligibleBankSources:lastUsedFundingSources:installmentAmount:", v15, v18, v16, v17, v19, v14);
  v20 = v12;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");

  -[PKPayLaterAvailableFundingSourcesFilter _prioritizePaymentSource:inPaymentSources:](self, "_prioritizePaymentSource:inPaymentSources:", v26, v22);
  -[NSMutableDictionary setObject:forKey:](self->_availableFundingSources, "setObject:forKey:", v22, v20);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v23 = objc_msgSend(v22, "count");
    *(_DWORD *)buf = 134218242;
    v28 = v23;
    v29 = 2112;
    v30 = v20;
    _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Found %ld available funding sources for planIdentifier %@", buf, 0x16u);
  }

  return v22;
}

- (id)_availableFundingSourcesForSupportedRepaymentTypes:(unint64_t)a3 supportedRepaymentCountries:(id)a4 supportedRepaymentNetworks:(id)a5 eligibleBankSources:(id)a6 lastUsedFundingSources:(id)a7 installmentAmount:(id)a8
{
  void *v8;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PKPaymentRequest *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  int v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C9AA60];
  if (a3)
  {
    v15 = a8;
    v16 = a7;
    v17 = a6;
    v18 = a5;
    v19 = a4;
    v20 = objc_alloc_init(PKPaymentRequest);
    -[PKPaymentRequest setMerchantCapabilities:](v20, "setMerchantCapabilities:", (__rbit32(a3) >> 28) & 0xC);
    -[PKPaymentRequest setSupportedNetworks:](v20, "setSupportedNetworks:", v18);

    -[PKPaymentRequest setSupportedCountries:](v20, "setSupportedCountries:", v19);
    -[PKPassLibrary inAppPaymentPassesForPaymentRequest:](self->_passLibrary, "inAppPaymentPassesForPaymentRequest:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "mutableCopy");

    -[PKPayLaterAvailableFundingSourcesFilter _filterCashPassIfNecessaryFromPasses:supportedRepaymentTypes:installmentAmount:](self, "_filterCashPassIfNecessaryFromPasses:supportedRepaymentTypes:installmentAmount:", v23, a3, v15);
    -[PKPayLaterAvailableFundingSourcesFilter _payLaterPassPaymentSourcesForPasses:](self, "_payLaterPassPaymentSourcesForPasses:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterAvailableFundingSourcesFilter _filterPrePaidPaymentApplicationsIfNecessaryFromSources:](self, "_filterPrePaidPaymentApplicationsIfNecessaryFromSources:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PKPayLaterAvailableFundingSourcesFilter _addAccountPaymentSourcesToPaymentSourcesIfNecessary:supportedRepaymentTypes:eligibleBankSources:](self, "_addAccountPaymentSourcesToPaymentSourcesIfNecessary:supportedRepaymentTypes:eligibleBankSources:", v26, a3, v17);

    objc_msgSend(v26, "addObjectsFromArray:", v25);
    -[PKPayLaterAvailableFundingSourcesFilter _filterLastUsedFundingSources:paymentSources:](self, "_filterLastUsedFundingSources:paymentSources:", v16, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)objc_msgSend(v26, "copy");
    -[PKPayLaterAvailableFundingSourcesFilter _assignPrioritiesToPaymentSources:lastUsedFundingSources:](self, "_assignPrioritiesToPaymentSources:lastUsedFundingSources:", v28, v27);
    -[PKPayLaterAvailableFundingSourcesFilter _sortPaymentSources:](self, "_sortPaymentSources:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    if (v29)
      v31 = (void *)v29;
    else
      v31 = v8;
    v32 = v31;

    PKLogFacilityTypeGetObject(6uLL);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v35 = 138412290;
      v36 = v32;
      _os_log_impl(&dword_18FC92000, v33, OS_LOG_TYPE_DEFAULT, "Sorted available payment sources %@", (uint8_t *)&v35, 0xCu);
    }

    v8 = (void *)objc_msgSend(v32, "copy");
  }
  return v8;
}

- (void)_filterCashPassIfNecessaryFromPasses:(id)a3 supportedRepaymentTypes:(unint64_t)a4 installmentAmount:(id)a5
{
  char v5;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t v18[8];
  _QWORD v19[4];
  id v20;

  v5 = a4;
  v7 = a3;
  -[PKPeerPaymentAccount associatedPassUniqueID](self->_peerPaymentAccount, "associatedPassUniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __122__PKPayLaterAvailableFundingSourcesFilter__filterCashPassIfNecessaryFromPasses_supportedRepaymentTypes_installmentAmount___block_invoke;
  v19[3] = &unk_1E2AC59E8;
  v9 = v8;
  v20 = v9;
  v10 = objc_msgSend(v7, "indexOfObjectPassingTest:", v19);
  v11 = v10;
  if ((v5 & 4) != 0 && v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PKPassLibrary passWithUniqueID:](self->_passLibrary, "passWithUniqueID:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "paymentPass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "devicePrimaryPaymentApplication");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "state");

    if (v15 == 1)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Adding apple cash card as a repayment method", v18, 2u);
      }

      objc_msgSend(v7, "safelyAddObject:", v13);
    }

  }
  else if ((v5 & 4) == 0 && v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Filtering out apple cash card as a financing option repayment method", v18, 2u);
    }

    objc_msgSend(v7, "removeObjectAtIndex:", v11);
  }

}

uint64_t __122__PKPayLaterAvailableFundingSourcesFilter__filterCashPassIfNecessaryFromPasses_supportedRepaymentTypes_installmentAmount___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (id)_filterPrePaidPaymentApplicationsIfNecessaryFromSources:(id)a3
{
  return (id)objc_msgSend(a3, "pk_objectsPassingTest:", &__block_literal_global_35);
}

BOOL __99__PKPayLaterAvailableFundingSourcesFilter__filterPrePaidPaymentApplicationsIfNecessaryFromSources___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "paymentApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fundingSourcePaymentType") != 3;

  return v3;
}

- (id)_payLaterPassPaymentSourcesForPasses:(id)a3
{
  return (id)objc_msgSend(a3, "pk_arrayByApplyingBlock:", &__block_literal_global_20);
}

PKPayLaterPassPaymentSource *__80__PKPayLaterAvailableFundingSourcesFilter__payLaterPassPaymentSourcesForPasses___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  PKPayLaterPassPaymentSource *v4;

  v2 = a2;
  objc_msgSend(v2, "devicePrimaryPaymentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPayLaterPassPaymentSource initWithPaymentPass:paymentApplication:]([PKPayLaterPassPaymentSource alloc], "initWithPaymentPass:paymentApplication:", v2, v3);

  return v4;
}

- (void)_addAccountPaymentSourcesToPaymentSourcesIfNecessary:(id)a3 supportedRepaymentTypes:(unint64_t)a4 eligibleBankSources:(id)a5
{
  if ((a4 & 8) != 0)
    objc_msgSend(a3, "addObjectsFromArray:", a5);
}

- (void)_assignPrioritiesToPaymentSources:(id)a3 lastUsedFundingSources:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSString *defaultPassUniqueIdentifier;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  BOOL v25;
  BOOL v26;
  id v27;
  id v28;
  unsigned int (**v30)(void *, id, uint64_t);
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD aBlock[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__PKPayLaterAvailableFundingSourcesFilter__assignPrioritiesToPaymentSources_lastUsedFundingSources___block_invoke;
  aBlock[3] = &unk_1E2AC5A50;
  v27 = v6;
  v36 = v27;
  v30 = (unsigned int (**)(void *, id, uint64_t))_Block_copy(aBlock);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    v28 = v7;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "type", v27);
        if (v13 == 2)
        {
          v15 = v12;
          objc_msgSend(v15, "accountPaymentFundingSource");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identifier");
          v14 = (id)objc_claimAutoreleasedReturnValue();

          if (v30[2](v30, v14, 8))
            v20 = 1000;
          else
            v20 = 800;
          objc_msgSend(v15, "setPriority:", v20);
          goto LABEL_29;
        }
        if (v13 != 1)
          continue;
        v14 = v12;
        objc_msgSend(v14, "paymentPass");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "uniqueID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "primaryAccountIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((((uint64_t (*)(void *, void *, uint64_t))v30[2])(v30, v17, 1) & 1) == 0)
        {
          defaultPassUniqueIdentifier = self->_defaultPassUniqueIdentifier;
          v22 = v16;
          v23 = defaultPassUniqueIdentifier;
          if (v22 == v23)
          {

            goto LABEL_23;
          }
          v24 = v23;
          if (v22)
            v25 = v23 == 0;
          else
            v25 = 1;
          if (v25)
          {

          }
          else
          {
            v26 = -[NSString isEqualToString:](v22, "isEqualToString:", v23);

            if (v26)
            {
LABEL_23:
              v18 = 600;
LABEL_27:
              v7 = v28;
              goto LABEL_28;
            }
          }
          if (objc_msgSend(v15, "hasAssociatedPeerPaymentAccount"))
            v18 = 400;
          else
            v18 = 200;
          goto LABEL_27;
        }
        v18 = 1000;
LABEL_28:
        objc_msgSend(v14, "setPriority:", v18);

LABEL_29:
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v9);
  }

}

uint64_t __100__PKPayLaterAvailableFundingSourcesFilter__assignPrioritiesToPaymentSources_lastUsedFundingSources___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  if (v6 && objc_msgSend(v6, "type") == a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    v9 = v8;
    if (v7 == v8)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v8 && v7)
        v10 = objc_msgSend(v7, "isEqualToString:", v8);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_filterLastUsedFundingSources:(id)a3 paymentSources:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  NSObject *oslog;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v5;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Last used funding sources before filter: %@", buf, 0xCu);
  }
  oslog = v7;

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v19[0] = v13;
        v19[1] = 3221225472;
        v19[2] = __88__PKPayLaterAvailableFundingSourcesFilter__filterLastUsedFundingSources_paymentSources___block_invoke;
        v19[3] = &unk_1E2AC5A78;
        v19[4] = v15;
        if (objc_msgSend(v6, "pk_containsObjectPassingTest:", v19, oslog))
          objc_msgSend(v8, "addObject:", v15);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v8;
    _os_log_impl(&dword_18FC92000, oslog, OS_LOG_TYPE_DEFAULT, "Last used funding sources after filter: %@", buf, 0xCu);
  }

  v16 = (void *)objc_msgSend(v8, "copy");
  return v16;
}

uint64_t __88__PKPayLaterAvailableFundingSourcesFilter__filterLastUsedFundingSources_paymentSources___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a2;
  v4 = objc_msgSend(v3, "type");
  if (v4 == 2)
  {
    objc_msgSend(v3, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12;
    v14 = v13;
    if (v10 == v14)
    {
      v11 = 1;
      v8 = v10;
    }
    else
    {
      v8 = v14;
      v11 = 0;
      if (v10 && v14)
        v11 = objc_msgSend(v10, "isEqualToString:", v14);
    }
    v5 = v10;
    goto LABEL_16;
  }
  if (v4 == 1)
  {
    objc_msgSend(v3, "paymentPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "primaryAccountIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
      v11 = 1;
    }
    else
    {
      v11 = 0;
      if (v8 && v9)
        v11 = objc_msgSend(v8, "isEqualToString:", v9);
    }

LABEL_16:
    goto LABEL_17;
  }
  v11 = 0;
LABEL_17:

  return v11;
}

- (void)_prioritizePaymentSource:(id)a3 inPaymentSources:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a3;
  v5 = a4;
  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __85__PKPayLaterAvailableFundingSourcesFilter__prioritizePaymentSource_inPaymentSources___block_invoke;
    v10[3] = &unk_1E2AC5AA0;
    v11 = v9;
    v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v10);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v6;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObjectAtIndex:", v7);
      objc_msgSend(v5, "insertObject:atIndex:", v8, 0);

    }
  }

}

uint64_t __85__PKPayLaterAvailableFundingSourcesFilter__prioritizePaymentSource_inPaymentSources___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  char v29;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_7;
  }
  v8 = v7;
  if (v6 && v7)
  {
    v9 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v9 & 1) != 0)
      goto LABEL_7;
  }
  else
  {

  }
  v11 = objc_msgSend(*(id *)(a1 + 32), "type");
  if (v11 != objc_msgSend(v3, "type") || objc_msgSend(*(id *)(a1 + 32), "type") != 1)
    goto LABEL_25;
  v12 = *(void **)(a1 + 32);
  v13 = v3;
  v14 = v12;
  objc_msgSend(v13, "paymentPass");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "paymentApplication");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "paymentPass");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "paymentApplication");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "primaryAccountIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "primaryAccountIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19;
  v22 = v20;
  if (v21 == v22)
    goto LABEL_22;
  v23 = v22;
  if (v21 && v22)
  {
    v24 = objc_msgSend(v21, "isEqualToString:", v22);

    if ((v24 & 1) != 0)
      goto LABEL_23;
  }
  else
  {

  }
  objc_msgSend(v16, "dpanIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dpanIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v25;
  v27 = v26;
  if (v21 == v27)
  {
LABEL_22:

LABEL_23:
    goto LABEL_7;
  }
  v28 = v27;
  if (!v21 || !v27)
  {

LABEL_25:
    v10 = 0;
    goto LABEL_26;
  }
  v29 = objc_msgSend(v21, "isEqualToString:", v27);

  if ((v29 & 1) == 0)
    goto LABEL_25;
LABEL_7:
  v10 = 1;
LABEL_26:

  return v10;
}

- (id)_sortPaymentSources:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingSelector:", sel_compare_);
}

- (void)setPeerPaymentAccount:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentAccount, a3);
  -[PKPayLaterAvailableFundingSourcesFilter clearCache](self, "clearCache");
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_defaultPassUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_availableFundingSources, 0);
}

@end
