@implementation PKDashboardTransactionFetcher

- (PKDashboardTransactionFetcher)initWithTransactionSourceCollection:(id)a3 paymentDataProvider:(id)a4
{
  id v7;
  id v8;
  PKDashboardTransactionFetcher *v9;
  PKDashboardTransactionFetcher *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKDashboardTransactionFetcher;
  v9 = -[PKDashboardTransactionFetcher init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transactionSourceCollection, a3);
    v10->_type = 0;
    objc_storeStrong((id *)&v10->_paymentDataProvider, a4);
    -[PKDashboardTransactionFetcher _commonSetup](v10, "_commonSetup");
  }

  return v10;
}

- (PKDashboardTransactionFetcher)initWithMerchant:(id)a3 transactionSourceCollection:(id)a4 paymentDataProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKDashboardTransactionFetcher *v12;
  PKDashboardTransactionFetcher *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKDashboardTransactionFetcher;
  v12 = -[PKDashboardTransactionFetcher init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_merchant, a3);
    objc_storeStrong((id *)&v13->_transactionSourceCollection, a4);
    v13->_type = 1;
    objc_storeStrong((id *)&v13->_paymentDataProvider, a5);
    -[PKDashboardTransactionFetcher _commonSetup](v13, "_commonSetup");
  }

  return v13;
}

- (PKDashboardTransactionFetcher)initWithCounterpartHandles:(id)a3 transactionSourceCollection:(id)a4 paymentDataProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKDashboardTransactionFetcher *v11;
  uint64_t v12;
  NSSet *counterpartHandles;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKDashboardTransactionFetcher;
  v11 = -[PKDashboardTransactionFetcher init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    counterpartHandles = v11->_counterpartHandles;
    v11->_counterpartHandles = (NSSet *)v12;

    objc_storeStrong((id *)&v11->_transactionSourceCollection, a4);
    v11->_type = 2;
    objc_storeStrong((id *)&v11->_paymentDataProvider, a5);
    -[PKDashboardTransactionFetcher _commonSetup](v11, "_commonSetup");
  }

  return v11;
}

- (PKDashboardTransactionFetcher)initWithMerchantCategory:(int64_t)a3 transactionSourceCollection:(id)a4 paymentDataProvider:(id)a5
{
  id v9;
  id v10;
  PKDashboardTransactionFetcher *v11;
  PKDashboardTransactionFetcher *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKDashboardTransactionFetcher;
  v11 = -[PKDashboardTransactionFetcher init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_merchantCategory = a3;
    objc_storeStrong((id *)&v11->_transactionSourceCollection, a4);
    v12->_type = 3;
    objc_storeStrong((id *)&v12->_paymentDataProvider, a5);
    -[PKDashboardTransactionFetcher _commonSetup](v12, "_commonSetup");
  }

  return v12;
}

- (PKDashboardTransactionFetcher)initWithTransactionType:(int64_t)a3 transactionSourceCollection:(id)a4 paymentDataProvider:(id)a5
{
  id v9;
  id v10;
  PKDashboardTransactionFetcher *v11;
  PKDashboardTransactionFetcher *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKDashboardTransactionFetcher;
  v11 = -[PKDashboardTransactionFetcher init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_transactionType = a3;
    objc_storeStrong((id *)&v11->_transactionSourceCollection, a4);
    v12->_type = 4;
    objc_storeStrong((id *)&v12->_paymentDataProvider, a5);
    -[PKDashboardTransactionFetcher _commonSetup](v12, "_commonSetup");
  }

  return v12;
}

- (PKDashboardTransactionFetcher)initWithInstallmentPlan:(id)a3 transactionSourceCollection:(id)a4 paymentDataProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKDashboardTransactionFetcher *v12;
  PKDashboardTransactionFetcher *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKDashboardTransactionFetcher;
  v12 = -[PKDashboardTransactionFetcher init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_installmentPlan, a3);
    objc_storeStrong((id *)&v13->_transactionSourceCollection, a4);
    v13->_type = 5;
    objc_storeStrong((id *)&v13->_paymentDataProvider, a5);
    -[PKDashboardTransactionFetcher _commonSetup](v13, "_commonSetup");
  }

  return v13;
}

- (PKDashboardTransactionFetcher)initWithRegions:(id)a3 transactionSourceCollection:(id)a4 paymentDataProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKDashboardTransactionFetcher *v12;
  PKDashboardTransactionFetcher *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKDashboardTransactionFetcher;
  v12 = -[PKDashboardTransactionFetcher init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_regions, a3);
    objc_storeStrong((id *)&v13->_transactionSourceCollection, a4);
    v13->_type = 6;
    objc_storeStrong((id *)&v13->_paymentDataProvider, a5);
    -[PKDashboardTransactionFetcher _commonSetup](v13, "_commonSetup");
  }

  return v13;
}

- (void)_commonSetup
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  char v15;
  unint64_t v16;
  PKPaymentDataProvider *paymentDataProvider;
  PKPaymentDefaultDataProvider *v18;
  PKPaymentDataProvider *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  self->_lockUpdate._os_unfair_lock_opaque = 0;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[PKTransactionSourceCollection transactionSources](self->_transactionSourceCollection, "transactionSources");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v7, "paymentPass");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "account");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "devicePrimaryPaymentApplication");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "paymentNetworkIdentifier");

        v12 = objc_msgSend(v7, "type");
        if ((unint64_t)(v12 - 2) >= 2)
        {
          if (v12 == 1)
          {
            self->_needsInstantWithdrawalFees = 1;
LABEL_20:
            if ((unint64_t)(v11 - 103) >= 0x24)
              v16 = 10;
            else
              v16 = qword_1904555F0[v11 - 103];
            goto LABEL_23;
          }
          if (v12)
            goto LABEL_24;
          v13 = objc_msgSend(v8, "hasAssociatedPeerPaymentAccount");
          objc_msgSend(v8, "associatedAccountServiceAccountIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            v15 = 1;
          else
            v15 = v13;

          if (v13)
          {
            self->_needsCashbackUniqueID = 1;
            self->_needsInstantWithdrawalFees = 1;
            self->_cashBackType = 1;
          }
          if ((v15 & 1) == 0)
            goto LABEL_20;
LABEL_18:
          v16 = 0;
          goto LABEL_23;
        }
        if (objc_msgSend(v9, "type") != 4)
          goto LABEL_18;
        v16 = 0;
        self->_needsCashbackUniqueID = 1;
        self->_cashBackType = 3;
LABEL_23:
        self->_limit = v16;
LABEL_24:

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  paymentDataProvider = self->_paymentDataProvider;
  if (!paymentDataProvider)
  {
    v18 = objc_alloc_init(PKPaymentDefaultDataProvider);
    v19 = self->_paymentDataProvider;
    self->_paymentDataProvider = (PKPaymentDataProvider *)v18;

    paymentDataProvider = self->_paymentDataProvider;
  }
  -[PKPaymentDataProvider addDelegate:](paymentDataProvider, "addDelegate:", self);
}

- (void)setLimit:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5
{
  NSDate *v8;
  NSDate *v9;
  NSDate *startDate;
  NSDate *endDate;
  NSDate *v12;

  v8 = (NSDate *)a4;
  v9 = (NSDate *)a5;
  self->_limit = a3;
  startDate = self->_startDate;
  self->_startDate = v8;
  v12 = v8;

  endDate = self->_endDate;
  self->_endDate = v9;

}

- (void)filterMerchant:(id)a3
{
  objc_storeStrong((id *)&self->_merchant, a3);
}

- (void)filterCategory:(int64_t)a3
{
  self->_merchantCategory = a3;
}

- (void)filterRegions:(id)a3
{
  objc_storeStrong((id *)&self->_regions, a3);
}

- (void)filterTags:(id)a3
{
  objc_storeStrong((id *)&self->_tags, a3);
}

- (void)filterTypes:(id)a3
{
  objc_storeStrong((id *)&self->_types, a3);
}

- (void)filterSources:(id)a3
{
  objc_storeStrong((id *)&self->_sources, a3);
}

- (void)filterStatuses:(id)a3
{
  objc_storeStrong((id *)&self->_statuses, a3);
}

- (void)filterAmount:(id)a3 comparison:(int64_t)a4
{
  objc_storeStrong((id *)&self->_amount, a3);
  self->_amountComparison = a4;
}

- (void)filterRewardsValue:(id)a3 unit:(unint64_t)a4
{
  objc_storeStrong((id *)&self->_rewardsValue, a3);
  self->_rewardsValueUnit = a4;
}

- (void)filterPeerPaymentSubType:(int64_t)a3
{
  self->_subType = a3;
}

- (void)filterPeerPaymentPaymentMode:(unint64_t)a3
{
  self->_peerPaymentPaymentMode = a3;
}

- (void)filterTransactionSourceIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_filteredTransactionSourceIdentifiers, a3);
}

- (void)filterDisputesOnly:(BOOL)a3
{
  self->_filterDisputesOnly = a3;
}

- (id)_transactionSourceIdentifiers
{
  NSSet *filteredTransactionSourceIdentifiers;

  filteredTransactionSourceIdentifiers = self->_filteredTransactionSourceIdentifiers;
  if (filteredTransactionSourceIdentifiers)
    return filteredTransactionSourceIdentifiers;
  -[PKTransactionSourceCollection transactionSourceIdentifiers](self->_transactionSourceCollection, "transactionSourceIdentifiers");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reloadTransactionsWithCompletion:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  _BOOL4 v14;
  PKPaymentDataProvider *v15;
  NSSet *counterpartHandles;
  unint64_t v17;
  void *v18;
  char v19;
  PKPaymentDataProvider *v20;
  void *v21;
  PKPaymentDataProvider *v22;
  int64_t transactionType;
  NSDate *v24;
  NSDate *v25;
  unint64_t v26;
  void *v27;
  PKPaymentDataProvider *v28;
  void *v29;
  PKPaymentDataProvider *v30;
  void *v31;
  PKPaymentDataProvider *v32;
  int64_t merchantCategory;
  NSDate *v34;
  NSDate *v35;
  unint64_t v36;
  PKPaymentDataProvider *paymentDataProvider;
  NSDate *startDate;
  NSDate *endDate;
  unint64_t limit;
  void *v41;
  char v42;
  PKPaymentDataProvider *v43;
  void *v44;
  PKPaymentDataProvider *v45;
  PKMerchant *merchant;
  unint64_t v47;
  uint64_t v48;
  _BOOL4 v50;
  uint64_t v51;
  _BOOL4 v52;
  void *v53;
  unint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  PKPaymentDataProvider *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD block[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[5];
  id v81;
  _QWORD v82[5];
  id v83;
  id v84;
  _QWORD *v85;
  char v86;
  _QWORD aBlock[5];
  id v88;
  _QWORD *v89;
  _QWORD v90[5];

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v90[0] = 0;
    v90[1] = v90;
    v90[2] = 0x2020000000;
    v90[3] = self->_limit;
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke;
    aBlock[3] = &unk_1E2AD3DE0;
    aBlock[4] = self;
    v89 = v90;
    v8 = v5;
    v88 = v8;
    v9 = _Block_copy(aBlock);
    -[PKDashboardTransactionFetcher _transactionSourceIdentifiers](self, "_transactionSourceIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    switch(self->_type)
    {
      case 0uLL:
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
            goto LABEL_30;
          paymentDataProvider = self->_paymentDataProvider;
          startDate = self->_startDate;
          endDate = self->_endDate;
          limit = self->_limit;
          v80[0] = v7;
          v80[1] = 3221225472;
          v80[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_8;
          v80[3] = &unk_1E2ABDD60;
          v80[4] = self;
          v81 = v9;
          -[PKPaymentDataProvider transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:limit:completion:](paymentDataProvider, "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:limit:completion:", v10, 0, 1, startDate, endDate, limit, v80);
          v18 = v81;
          break;
        }
        -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "associatedAccountFeatureIdentifier");
        v13 = v12;
        if (v12 <= 4 && ((1 << v12) & 0x16) != 0)
        {
          v14 = 1;
        }
        else
        {
          objc_msgSend(v11, "devicePrimaryContactlessPaymentApplication");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v3, "paymentNetworkIdentifier");
          v14 = v48 == 129 || v48 == 138;
        }
        if (v13 > 4 || ((1 << v13) & 0x16) == 0)

        if (-[NSArray count](self->_types, "count"))
          v50 = -[PKDashboardTransactionFetcher _containsFrequentTransactionType:](self, "_containsFrequentTransactionType:", self->_types);
        else
          v50 = 1;
        if (self->_startDate)
        {
          v51 = 0;
        }
        else
        {
          if (self->_endDate)
            v52 = 0;
          else
            v52 = v50;
          v51 = v52 & v14;
        }
        -[PKDashboardTransactionFetcher _transactionRequestForCurrentFilters](self, "_transactionRequestForCurrentFilters");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "limit");
        if ((_DWORD)v51)
        {
          v61 = v11;
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          PKStartOfMonth(v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setStartDate:", v56);

          PKStartOfNextMonth(v55);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setEndDate:", v57);

          v11 = v61;
        }
        v58 = self->_paymentDataProvider;
        if (self->_allowSynchronousFetch && v54 && v54 <= 0xA)
        {
          -[PKPaymentDataProvider transactionsForRequest:](self->_paymentDataProvider, "transactionsForRequest:", v53);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDashboardTransactionFetcher _processPaymentPassTransactionsWithTransactions:currentMonthOnly:sendTransactionsBlock:](self, "_processPaymentPassTransactionsWithTransactions:currentMonthOnly:sendTransactionsBlock:", v60, v51, v9);

        }
        else
        {
          v82[0] = v7;
          v82[1] = 3221225472;
          v82[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_2;
          v82[3] = &unk_1E2AD3E30;
          v86 = v51;
          v82[4] = self;
          v85 = v90;
          v83 = v53;
          v84 = v9;
          -[PKPaymentDataProvider transactionsForRequest:completion:](v58, "transactionsForRequest:completion:", v83, v82);

        }
        goto LABEL_32;
      case 1uLL:
        if (!-[PKMerchant hasMapsMatch](self->_merchant, "hasMapsMatch")
          || -[PKMerchant useRawMerchantData](self->_merchant, "useRawMerchantData"))
        {
          -[PKMerchant name](self->_merchant, "name");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {

          }
          else
          {
            -[PKMerchant rawName](self->_merchant, "rawName");
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v41)
              goto LABEL_30;
          }
        }
        v42 = objc_opt_respondsToSelector();
        v43 = self->_paymentDataProvider;
        if ((v42 & 1) != 0)
        {
          -[PKDashboardTransactionFetcher _transactionRequestForCurrentFilters](self, "_transactionRequestForCurrentFilters");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v78[0] = v7;
          v78[1] = 3221225472;
          v78[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_11;
          v78[3] = &unk_1E2ABE760;
          v79 = v8;
          -[PKPaymentDataProvider transactionsForRequest:completion:](v43, "transactionsForRequest:completion:", v44, v78);

          v18 = v79;
          break;
        }
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_30;
        v45 = self->_paymentDataProvider;
        merchant = self->_merchant;
        v47 = self->_limit;
        v76[0] = v7;
        v76[1] = 3221225472;
        v76[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_13;
        v76[3] = &unk_1E2ACAB80;
        v77 = v9;
        -[PKPaymentDataProvider transactionsForTransactionSourceIdentifiers:matchingMerchant:withTransactionSource:withBackingData:limit:completion:](v45, "transactionsForTransactionSourceIdentifiers:matchingMerchant:withTransactionSource:withBackingData:limit:completion:", v10, merchant, 0, 1, v47, v76);
        v18 = v77;
        break;
      case 2uLL:
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_30;
        v15 = self->_paymentDataProvider;
        counterpartHandles = self->_counterpartHandles;
        v17 = self->_limit;
        v74[0] = v7;
        v74[1] = 3221225472;
        v74[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_15;
        v74[3] = &unk_1E2ACAB80;
        v75 = v9;
        -[PKPaymentDataProvider transactionsForTransactionSourceIdentifiers:withPeerPaymentCounterpartHandles:withTransactionSource:withBackingData:limit:completion:](v15, "transactionsForTransactionSourceIdentifiers:withPeerPaymentCounterpartHandles:withTransactionSource:withBackingData:limit:completion:", v10, counterpartHandles, 0, 1, v17, v74);
        v18 = v75;
        break;
      case 3uLL:
        v19 = objc_opt_respondsToSelector();
        v20 = self->_paymentDataProvider;
        if ((v19 & 1) != 0)
        {
          -[PKDashboardTransactionFetcher _transactionRequestForCurrentFilters](self, "_transactionRequestForCurrentFilters");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v72[0] = v7;
          v72[1] = 3221225472;
          v72[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_17;
          v72[3] = &unk_1E2ABE760;
          v73 = v8;
          -[PKPaymentDataProvider transactionsForRequest:completion:](v20, "transactionsForRequest:completion:", v21, v72);

          v18 = v73;
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v32 = self->_paymentDataProvider;
          merchantCategory = self->_merchantCategory;
          v34 = self->_startDate;
          v35 = self->_endDate;
          v36 = self->_limit;
          v70[0] = v7;
          v70[1] = 3221225472;
          v70[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_19;
          v70[3] = &unk_1E2ACAB80;
          v71 = v9;
          -[PKPaymentDataProvider transactionsForTransactionSourceIdentifiers:withMerchantCategory:withTransactionSource:withBackingData:startDate:endDate:limit:completion:](v32, "transactionsForTransactionSourceIdentifiers:withMerchantCategory:withTransactionSource:withBackingData:startDate:endDate:limit:completion:", v10, merchantCategory, 0, 1, v34, v35, v36, v70);
          v18 = v71;
        }
        else
        {
LABEL_30:
          block[0] = v7;
          block[1] = 3221225472;
          block[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_27;
          block[3] = &unk_1E2ABD9A0;
          v63 = v8;
          dispatch_async(MEMORY[0x1E0C80D38], block);
          v18 = v63;
        }
        break;
      case 4uLL:
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_30;
        v22 = self->_paymentDataProvider;
        transactionType = self->_transactionType;
        v24 = self->_startDate;
        v25 = self->_endDate;
        v26 = self->_limit;
        v68[0] = v7;
        v68[1] = 3221225472;
        v68[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_21;
        v68[3] = &unk_1E2ACAB80;
        v69 = v9;
        -[PKPaymentDataProvider transactionsForTransactionSourceIdentifiers:withTransactionType:withTransactionSource:withBackingData:startDate:endDate:limit:completion:](v22, "transactionsForTransactionSourceIdentifiers:withTransactionType:withTransactionSource:withBackingData:startDate:endDate:limit:completion:", v10, transactionType, 0, 1, v24, v25, v26, v68);
        v18 = v69;
        break;
      case 5uLL:
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_30;
        v28 = self->_paymentDataProvider;
        -[PKCreditInstallmentPlan identifier](self->_installmentPlan, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v66[0] = v7;
        v66[1] = 3221225472;
        v66[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_23;
        v66[3] = &unk_1E2ACAB80;
        v67 = v9;
        -[PKPaymentDataProvider installmentTransactionsForInstallmentPlanIdentifier:completion:](v28, "installmentTransactionsForInstallmentPlanIdentifier:completion:", v29, v66);

        v18 = v67;
        break;
      case 6uLL:
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_30;
        v30 = self->_paymentDataProvider;
        -[PKDashboardTransactionFetcher _transactionRequestForCurrentFilters](self, "_transactionRequestForCurrentFilters");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = v7;
        v64[1] = 3221225472;
        v64[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_25;
        v64[3] = &unk_1E2ABE760;
        v65 = v8;
        -[PKPaymentDataProvider transactionsForRequest:completion:](v30, "transactionsForRequest:completion:", v31, v64);

        v18 = v65;
        break;
      default:
        goto LABEL_30;
    }

LABEL_32:
    _Block_object_dispose(v90, 8);
  }

}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_sortedTransactions:ascending:limit:", a2, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  char v13;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned __int8 *)(a1 + 64);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_3;
  v8[3] = &unk_1E2AD3E08;
  v13 = v5;
  v12 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v7;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_processPaymentPassTransactionsWithTransactions:currentMonthOnly:sendTransactionsBlock:", v4, v5, v8);

}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 64) && (unint64_t)objc_msgSend(v3, "count") <= 9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 10;
    objc_msgSend(*(id *)(a1 + 32), "setStartDate:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 264));
    objc_msgSend(*(id *)(a1 + 32), "setEndDate:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 272));
    objc_msgSend(*(id *)(a1 + 32), "setLimit:", 10);
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v5 + 16);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_4;
    v12[3] = &unk_1E2ABDE50;
    v12[4] = v5;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v7, "transactionsForRequest:completion:", v6, v12);
    v8 = v13;
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_7;
    v9[3] = &unk_1E2ABDA18;
    v11 = *(id *)(a1 + 48);
    v10 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

    v8 = v11;
  }

}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_5;
  v5[3] = &unk_1E2ACAB80;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_processPaymentPassTransactionsWithTransactions:currentMonthOnly:sendTransactionsBlock:", v4, 0, v5);

}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_6;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_8(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_9;
  v4[3] = &unk_1E2ACAB80;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_processPaymentPassTransactionsWithTransactions:currentMonthOnly:sendTransactionsBlock:", a2, 0, v4);

}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_10;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_12;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_14;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_16;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_18;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_20;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_22;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_24;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_26;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_transactionRequestForCurrentFilters
{
  PKPaymentTransactionRequest *v3;
  void *v4;

  v3 = objc_alloc_init(PKPaymentTransactionRequest);
  -[PKDashboardTransactionFetcher _transactionSourceIdentifiers](self, "_transactionSourceIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransactionRequest setTransactionSourceIdentifiers:](v3, "setTransactionSourceIdentifiers:", v4);

  -[PKPaymentTransactionRequest setTransactionTypes:](v3, "setTransactionTypes:", self->_types);
  -[PKPaymentTransactionRequest setTransactionSources:](v3, "setTransactionSources:", self->_sources);
  -[PKPaymentTransactionRequest setTransactionStatuses:](v3, "setTransactionStatuses:", self->_statuses);
  -[PKPaymentTransactionRequest setRegions:](v3, "setRegions:", self->_regions);
  -[PKPaymentTransactionRequest setMerchant:](v3, "setMerchant:", self->_merchant);
  -[PKPaymentTransactionRequest setMerchantCategory:](v3, "setMerchantCategory:", self->_merchantCategory);
  -[PKPaymentTransactionRequest setStartDate:](v3, "setStartDate:", self->_startDate);
  -[PKPaymentTransactionRequest setEndDate:](v3, "setEndDate:", self->_endDate);
  -[PKPaymentTransactionRequest setDateOrder:](v3, "setDateOrder:", 1);
  -[PKPaymentTransactionRequest setAmount:](v3, "setAmount:", self->_amount);
  -[PKPaymentTransactionRequest setAmountComparison:](v3, "setAmountComparison:", self->_amountComparison);
  -[PKPaymentTransactionRequest setLimit:](v3, "setLimit:", self->_limit);
  -[PKPaymentTransactionRequest setTags:](v3, "setTags:", self->_tags);
  -[PKPaymentTransactionRequest setRewardsValue:](v3, "setRewardsValue:", self->_rewardsValue);
  -[PKPaymentTransactionRequest setRewardsValueUnit:](v3, "setRewardsValueUnit:", self->_rewardsValueUnit);
  -[PKPaymentTransactionRequest setPeerPaymentSubType:](v3, "setPeerPaymentSubType:", self->_subType);
  -[PKPaymentTransactionRequest setPeerPaymentPaymentMode:](v3, "setPeerPaymentPaymentMode:", self->_peerPaymentPaymentMode);
  -[PKPaymentTransactionRequest setDisputesOnly:](v3, "setDisputesOnly:", self->_filterDisputesOnly);
  return v3;
}

- (void)transactionCountByPeriod:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  PKPaymentTransactionRequest *v10;
  void *v11;
  PKPaymentDataProvider *paymentDataProvider;
  void *v13;
  PKPaymentTransactionRequest *v14;
  _QWORD v15[4];
  PKPaymentTransactionRequest *v16;
  id v17;
  BOOL v18;

  v6 = a4;
  if (v6)
  {
    -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "associatedAccountFeatureIdentifier");

    v9 = (unint64_t)(v8 - 1) < 2;
    if ((unint64_t)(v8 - 1) > 1)
    {
      v10 = objc_alloc_init(PKPaymentTransactionRequest);
      -[PKDashboardTransactionFetcher _transactionSourceIdentifiers](self, "_transactionSourceIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransactionRequest setTransactionSourceIdentifiers:](v10, "setTransactionSourceIdentifiers:", v11);

    }
    else
    {
      -[PKDashboardTransactionFetcher _transactionRequestForCurrentFilters](self, "_transactionRequestForCurrentFilters");
      v10 = (PKPaymentTransactionRequest *)objc_claimAutoreleasedReturnValue();
    }
    paymentDataProvider = self->_paymentDataProvider;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __73__PKDashboardTransactionFetcher_transactionCountByPeriod_withCompletion___block_invoke;
    v15[3] = &unk_1E2AD3E58;
    v18 = v9;
    v16 = v10;
    v17 = v6;
    v14 = v10;
    -[PKPaymentDataProvider transactionCountByPeriodForRequest:calendar:calendarUnit:includePurchaseTotal:completion:](paymentDataProvider, "transactionCountByPeriodForRequest:calendar:calendarUnit:includePurchaseTotal:completion:", v14, v13, a3, 0, v15);

  }
}

void __73__PKDashboardTransactionFetcher_transactionCountByPeriod_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "transactionTypes");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setTransactionTypes:", v10);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__PKDashboardTransactionFetcher_transactionCountByPeriod_withCompletion___block_invoke_2;
  v13[3] = &unk_1E2ABDA18;
  v11 = *(id *)(a1 + 40);
  v14 = v4;
  v15 = v11;
  v12 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

uint64_t __73__PKDashboardTransactionFetcher_transactionCountByPeriod_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)peerPaymentCounterpartHandlesForTransactionSourceIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PKPaymentDataProvider *paymentDataProvider;
  _QWORD v15[4];
  id v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    paymentDataProvider = self->_paymentDataProvider;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __122__PKDashboardTransactionFetcher_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke;
    v15[3] = &unk_1E2ABE760;
    v16 = v13;
    -[PKPaymentDataProvider peerPaymentCounterpartHandlesForTransactionSourceIdentifier:startDate:endDate:completion:](paymentDataProvider, "peerPaymentCounterpartHandlesForTransactionSourceIdentifier:startDate:endDate:completion:", v10, v11, v12, v15);

  }
}

void __122__PKDashboardTransactionFetcher_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __122__PKDashboardTransactionFetcher_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke_2;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __122__PKDashboardTransactionFetcher_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)cashbackGroupForTransactionWithIdentifier:(id)a3 cashbackTransactionSourceCollection:(id *)a4
{
  if (a4)
    *a4 = objc_retainAutorelease(self->_cashbackTransactionSourceCollection);
  return -[NSDictionary objectForKey:](self->_cashbackGroups, "objectForKey:", a3);
}

- (id)cashbackGroupForDateComponents:(id)a3 cashbackTransactionSourceCollection:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  int v14;
  id *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSDictionary allValues](self->_cashbackGroups, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v16 = a4;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "startDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v7, "date:matchesComponents:", v13, v6);

        if (v14)
        {
          v9 = v12;
          goto LABEL_11;
        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
LABEL_11:
    a4 = v16;
  }

  if (a4)
    *a4 = objc_retainAutorelease(self->_cashbackTransactionSourceCollection);

  return v9;
}

- (void)setCashbackPass:(id)a3
{
  NSString *v5;
  NSString *cashbackPassUniqueID;
  PKTransactionSource *v7;
  PKTransactionSourceCollection *v8;
  PKTransactionSourceCollection *cashbackTransactionSourceCollection;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_cashbackPass, a3);
  objc_msgSend(v10, "uniqueID");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  cashbackPassUniqueID = self->_cashbackPassUniqueID;
  self->_cashbackPassUniqueID = v5;

  if (v10)
  {
    self->_needsCashbackUniqueID = 0;
    v7 = -[PKTransactionSource initWithPaymentPass:]([PKTransactionSource alloc], "initWithPaymentPass:", self->_cashbackPass);
    v8 = -[PKTransactionSourceCollection initWithTransactionSource:]([PKTransactionSourceCollection alloc], "initWithTransactionSource:", v7);
    cashbackTransactionSourceCollection = self->_cashbackTransactionSourceCollection;
    self->_cashbackTransactionSourceCollection = v8;

  }
  else
  {
    self->_needsCashbackUniqueID = 1;
    v7 = (PKTransactionSource *)self->_cashbackTransactionSourceCollection;
    self->_cashbackTransactionSourceCollection = 0;
  }

}

- (id)instantWithdrawalFeesTransactionGroups
{
  return self->_instantWithdrawalFeeGroups;
}

- (void)_addCashbackTransactions:(id)a3 currentMonthOnly:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  NSDate *endDate;
  NSDate *v14;
  NSDate *v15;
  void *v16;
  void *v17;
  void *v18;
  NSDate *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void (**v24)(void *, void *);
  void *v25;
  NSDate *v26;
  PKPaymentDataProvider *paymentDataProvider;
  void *v28;
  void *v29;
  PKPaymentDataProvider *v30;
  void *v31;
  void *v32;
  NSDate *v33;
  PKPaymentDataProvider *v34;
  void *v35;
  void *v36;
  unint64_t cashBackType;
  PKPaymentDataProvider *v38;
  _QWORD v39[4];
  void (**v40)(void *, void *);
  _QWORD aBlock[4];
  id v42;
  PKDashboardTransactionFetcher *v43;
  id v44;

  v8 = a3;
  v9 = a5;
  if (self->_allowSynchronousFetch)
  {
    if (self->_startDate)
      v10 = self->_endDate == 0;
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  endDate = self->_endDate;
  if (!endDate)
    endDate = (NSDate *)v11;
  v14 = endDate;
  v15 = self->_startDate;
  if (!v15)
  {
    if (a4)
    {
      PKStartOfMonth(v12);
      v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dateByAddingTimeInterval:", -2678400.0);
      v15 = (NSDate *)objc_claimAutoreleasedReturnValue();

    }
  }
  if (self->_limit && objc_msgSend(v8, "count") >= self->_limit)
  {
    -[PKDashboardTransactionFetcher _sortedTransactions:ascending:limit:](self, "_sortedTransactions:ascending:limit:", v8, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastObject");
    v18 = v12;
    v19 = v14;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "transactionDate");
    v21 = objc_claimAutoreleasedReturnValue();

    v14 = v19;
    v12 = v18;

    v15 = (NSDate *)v21;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PKDashboardTransactionFetcher__addCashbackTransactions_currentMonthOnly_completion___block_invoke;
  aBlock[3] = &unk_1E2AC61E0;
  v22 = v8;
  v42 = v22;
  v43 = self;
  v23 = v9;
  v44 = v23;
  v24 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v25 = v12;
    v26 = v14;
    paymentDataProvider = self->_paymentDataProvider;
    -[PKTransactionSourceCollection transactionSourceIdentifiers](self->_cashbackTransactionSourceCollection, "transactionSourceIdentifiers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = paymentDataProvider;
    v14 = v26;
    v12 = v25;
    -[PKPaymentDataProvider cashbackByPeriodForTransactionSourceIdentifiers:withStartDate:endDate:calendar:calendarUnit:type:](v30, "cashbackByPeriodForTransactionSourceIdentifiers:withStartDate:endDate:calendar:calendarUnit:type:", v28, v15, v14, v29, 16, self->_cashBackType);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v24[2](v24, v31);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v32 = v12;
    v33 = v14;
    v34 = self->_paymentDataProvider;
    -[PKTransactionSourceCollection transactionSourceIdentifiers](self->_cashbackTransactionSourceCollection, "transactionSourceIdentifiers");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    cashBackType = self->_cashBackType;
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __86__PKDashboardTransactionFetcher__addCashbackTransactions_currentMonthOnly_completion___block_invoke_2;
    v39[3] = &unk_1E2ABE760;
    v40 = v24;
    v38 = v34;
    v14 = v33;
    v12 = v32;
    -[PKPaymentDataProvider cashbackByPeriodForTransactionSourceIdentifiers:withStartDate:endDate:calendar:calendarUnit:type:completion:](v38, "cashbackByPeriodForTransactionSourceIdentifiers:withStartDate:endDate:calendar:calendarUnit:type:completion:", v35, v15, v14, v36, 16, cashBackType, v39);

  }
  else if (v23)
  {
    (*((void (**)(id, id))v23 + 2))(v23, v22);
  }

}

void __86__PKDashboardTransactionFetcher__addCashbackTransactions_currentMonthOnly_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSDecimalNumber *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  char v20;
  int v21;
  __CFString *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  PKPaymentTransactionGroup *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSDecimalNumber *v39;
  void *v40;
  NSString *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSDecimalNumber *v50;
  NSString *v51;
  void *v52;
  void *v53;
  NSDecimalNumber *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  PKPaymentTransaction *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  NSDecimalNumber *v76;
  uint64_t v77;
  uint64_t v78;
  id obj;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  id v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  void *v100;
  _BYTE v101[128];
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v85 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", *(_QWORD *)(a1 + 32));
  v4 = (NSDecimalNumber *)v3;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v84 = a1;
  obj = *(id *)(a1 + 32);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v102, 16);
  v76 = v4;
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v96;
    v77 = *(_QWORD *)v96;
    do
    {
      v8 = 0;
      v78 = v6;
      do
      {
        if (*(_QWORD *)v96 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v8);
        if (objc_msgSend(v9, "transactionType") == 8)
        {
          objc_msgSend(v9, "redemptionEvent");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "items");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "anyObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "merchantProvidedDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = v12;
          if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v12, "transactionIdentifiers");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "count"))
            {
              v15 = 0;
            }
            else
            {
              objc_msgSend(v12, "rewardsAddedIdentifiers");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v16, "count") == 0;

            }
          }
          else
          {
            v15 = 0;
          }
          objc_msgSend(v9, "referenceIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = v13;
          if (objc_msgSend(v17, "length"))
          {
            v18 = v13;
            if (v18 == CFSTR("Daily Cash"))
              goto LABEL_18;
            v19 = v18;
            if (v18)
            {
              v20 = -[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("Daily Cash"));

              if ((v20 & 1) != 0)
              {
LABEL_18:

                goto LABEL_26;
              }
              v22 = v19;
              if (v22 == CFSTR("Daily Cash"))
                v21 = 1;
              else
                v21 = -[__CFString isEqualToString:](v22, "isEqualToString:");
            }
            else
            {
              v21 = 0;
            }

          }
          else
          {
            v21 = 0;
          }

          if ((v15 | v21) == 1)
          {
LABEL_26:
            v81 = v10;
            objc_msgSend(v86, "removeObject:", v9);
            objc_msgSend(v9, "transactionDate");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            PKStartOfDay(v80);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = 0u;
            v92 = 0u;
            v93 = 0u;
            v94 = 0u;
            v4 = v4;
            v24 = -[NSDecimalNumber countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v92;
LABEL_28:
              v27 = 0;
              while (1)
              {
                if (*(_QWORD *)v92 != v26)
                  objc_enumerationMutation(v4);
                v28 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v27);
                objc_msgSend(v28, "startDate");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = v29;
                if (v23 && v29)
                {
                  v31 = objc_msgSend(v23, "isEqual:", v29);

                  if ((v31 & 1) != 0)
                    goto LABEL_39;
                }
                else
                {

                  if (v23 == v30)
                  {
LABEL_39:
                    v32 = v28;

                    if (!v32)
                      goto LABEL_43;
                    -[PKPaymentTransactionGroup transactions](v32, "transactions");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "arrayByAddingObject:", v9);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PKPaymentTransactionGroup setTransactions:](v32, "setTransactions:", v34);

                    -[PKPaymentTransactionGroup totalAmount](v32, "totalAmount");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "amount");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v9, "amount");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "pk_absoluteValue");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "decimalNumberByAdding:", v38);
                    v39 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

                    -[PKPaymentTransactionGroup totalAmount](v32, "totalAmount");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "currency");
                    v41 = (NSString *)objc_claimAutoreleasedReturnValue();
                    PKCurrencyAmountCreate(v39, v41, 0);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PKPaymentTransactionGroup setTotalAmount:](v32, "setTotalAmount:", v42);

                    -[PKPaymentTransactionGroup endDate](v32, "endDate");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    v44 = v80;
                    v45 = objc_msgSend(v80, "compare:", v43);

                    v46 = v83;
                    if (v45 == 1)
                      -[PKPaymentTransactionGroup setEndDate:](v32, "setEndDate:", v80);
                    -[PKPaymentTransactionGroup setTransactionCount:](v32, "setTransactionCount:", -[PKPaymentTransactionGroup transactionCount](v32, "transactionCount") + 1);
                    v7 = v77;
                    v6 = v78;
                    v10 = v81;
                    goto LABEL_44;
                  }
                }
                if (v25 == ++v27)
                {
                  v25 = -[NSDecimalNumber countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
                  if (v25)
                    goto LABEL_28;
                  break;
                }
              }
            }

LABEL_43:
            v32 = objc_alloc_init(PKPaymentTransactionGroup);
            objc_msgSend(v9, "transactionDate");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            PKStartOfDay(v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKPaymentTransactionGroup setStartDate:](v32, "setStartDate:", v48);

            v44 = v80;
            -[PKPaymentTransactionGroup setEndDate:](v32, "setEndDate:", v80);
            -[PKPaymentTransactionGroup setType:](v32, "setType:", 5);
            objc_msgSend(v9, "amount");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "pk_absoluteValue");
            v50 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "currencyCode");
            v51 = (NSString *)objc_claimAutoreleasedReturnValue();
            PKCurrencyAmountCreate(v50, v51, 0);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKPaymentTransactionGroup setTotalAmount:](v32, "setTotalAmount:", v52);

            -[PKPaymentTransactionGroup setTransactionCount:](v32, "setTransactionCount:", 1);
            v100 = v9;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKPaymentTransactionGroup setTransactions:](v32, "setTransactions:", v53);

            -[NSDecimalNumber arrayByAddingObject:](v4, "arrayByAddingObject:", v32);
            v39 = v4;
            v4 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
            v7 = v77;
            v6 = v78;
            v10 = v81;
            v46 = v83;
LABEL_44:

          }
          else
          {
            v46 = v83;
          }

        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v102, 16);
    }
    while (v6);
  }

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v54 = v4;
  v55 = -[NSDecimalNumber countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
  if (!v55)
    goto LABEL_62;
  v56 = v55;
  v57 = *(_QWORD *)v88;
  do
  {
    for (i = 0; i != v56; ++i)
    {
      if (*(_QWORD *)v88 != v57)
        objc_enumerationMutation(v54);
      v59 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
      v60 = objc_alloc_init(PKPaymentTransaction);
      -[PKPaymentTransaction setTransactionType:](v60, "setTransactionType:", 9);
      objc_msgSend(v59, "totalAmount");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "amount");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction setAmount:](v60, "setAmount:", v62);

      objc_msgSend(v61, "currency");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction setCurrencyCode:](v60, "setCurrencyCode:", v63);

      objc_msgSend(v59, "endDate");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction setTransactionDate:](v60, "setTransactionDate:", v64);

      -[PKPaymentTransaction setTransactionStatus:](v60, "setTransactionStatus:", 1);
      objc_msgSend(*(id *)(*(_QWORD *)(v84 + 40) + 8), "transactionSourceIdentifiers");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "anyObject");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction setTransactionSourceIdentifier:](v60, "setTransactionSourceIdentifier:", v66);

      objc_msgSend(v59, "transactions");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "firstObject");
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      v69 = objc_msgSend(v68, "redemptionType");
      if (!v69)
      {
        v70 = objc_msgSend(v68, "accountType");
LABEL_59:
        -[PKPaymentTransaction setAccountType:](v60, "setAccountType:", v70);
        goto LABEL_60;
      }
      v70 = v69;
      if (v69 == 1 || v69 == 3)
        goto LABEL_59;
LABEL_60:
      objc_msgSend(v86, "addObject:", v60);
      -[PKPaymentTransaction identifier](v60, "identifier");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "setObject:forKey:", v59, v71);

    }
    v56 = -[NSDecimalNumber countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
  }
  while (v56);
LABEL_62:

  v72 = objc_msgSend(v85, "copy");
  v73 = *(_QWORD *)(v84 + 40);
  v74 = *(void **)(v73 + 224);
  *(_QWORD *)(v73 + 224) = v72;

  v75 = *(_QWORD *)(v84 + 48);
  if (v75)
    (*(void (**)(uint64_t, void *))(v75 + 16))(v75, v86);

}

void __86__PKDashboardTransactionFetcher__addCashbackTransactions_currentMonthOnly_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__PKDashboardTransactionFetcher__addCashbackTransactions_currentMonthOnly_completion___block_invoke_3;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __86__PKDashboardTransactionFetcher__addCashbackTransactions_currentMonthOnly_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_addInstantWidthdrawalTransactionsWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NSDate *v5;
  PKPaymentDataProvider *paymentDataProvider;
  void *v7;
  NSDate *startDate;
  void *v9;
  NSArray *instantWithdrawalFeeGroups;
  _QWORD v11[5];
  void (**v12)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    paymentDataProvider = self->_paymentDataProvider;
    -[PKDashboardTransactionFetcher _transactionSourceIdentifiers](self, "_transactionSourceIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_startDate)
      startDate = self->_startDate;
    else
      startDate = v5;
    PKStartOfYear(startDate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __82__PKDashboardTransactionFetcher__addInstantWidthdrawalTransactionsWithCompletion___block_invoke;
    v11[3] = &unk_1E2ABDD60;
    v11[4] = self;
    v12 = v4;
    -[PKPaymentDataProvider transactionsForTransactionSourceIdentifiers:withTransactionType:withTransactionSource:withBackingData:startDate:endDate:limit:completion:](paymentDataProvider, "transactionsForTransactionSourceIdentifiers:withTransactionType:withTransactionSource:withBackingData:startDate:endDate:limit:completion:", v7, 5, 0, 1, v9, v5, 0, v11);

  }
  else
  {
    instantWithdrawalFeeGroups = self->_instantWithdrawalFeeGroups;
    self->_instantWithdrawalFeeGroups = 0;

    if (v4)
      v4[2](v4);
  }

}

void __82__PKDashboardTransactionFetcher__addInstantWidthdrawalTransactionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PKDashboardTransactionFetcher__addInstantWidthdrawalTransactionsWithCompletion___block_invoke_2;
  block[3] = &unk_1E2ABE030;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __82__PKDashboardTransactionFetcher__addInstantWidthdrawalTransactionsWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSDecimalNumber *v24;
  void *v25;
  NSString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSDecimalNumber *v32;
  NSString *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  PKPaymentTransactionGroup *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSString *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id obj;
  id v49;
  uint64_t v50;
  uint64_t v52;
  void *v53;
  NSDecimalNumber *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  void *v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_sortedTransactions:ascending:limit:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pk_objectsPassingTest:", &__block_literal_global_149);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v54 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v2;
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (v52)
  {
    v49 = v3;
    v50 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v61 != v50)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v6, "transactionDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        PKStartOfDay(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "_feeTotalForTransaction:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v53 = v6;
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          v10 = v3;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v57;
            v55 = v9;
LABEL_9:
            v14 = 0;
            while (1)
            {
              if (*(_QWORD *)v57 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v14);
              objc_msgSend(v15, "startDate");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "components:fromDate:", 14, v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v4, "date:matchesComponents:", v8, v17) & 1) != 0)
                break;

              if (v12 == ++v14)
              {
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
                v9 = v55;
                if (v12)
                  goto LABEL_9;
                goto LABEL_15;
              }
            }
            v18 = v15;

            v9 = v55;
            if (!v18)
              goto LABEL_18;
            objc_msgSend(v18, "transactions");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "arrayByAddingObject:", v53);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setTransactions:", v20);

            objc_msgSend(v18, "totalAmount");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "amount");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "pk_absoluteValue");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "decimalNumberByAdding:", v23);
            v24 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v18, "totalAmount");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "currency");
            v26 = (NSString *)objc_claimAutoreleasedReturnValue();
            PKCurrencyAmountCreate(v24, v26, 0);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setTotalAmount:", v27);

            v9 = v55;
          }
          else
          {
LABEL_15:

LABEL_18:
            v24 = objc_alloc_init(PKPaymentTransactionGroup);
            objc_msgSend(v53, "transactionDate");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            PKStartOfMonth(v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDecimalNumber setStartDate:](v24, "setStartDate:", v29);

            objc_msgSend(v53, "transactionDate");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            PKEndOfMonth(v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDecimalNumber setEndDate:](v24, "setEndDate:", v31);

            -[NSDecimalNumber setType:](v24, "setType:", 3);
            objc_msgSend(v9, "pk_absoluteValue");
            v32 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "currencyCode");
            v33 = (NSString *)objc_claimAutoreleasedReturnValue();
            PKCurrencyAmountCreate(v32, v33, 0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDecimalNumber setTotalAmount:](v24, "setTotalAmount:", v34);

            -[NSDecimalNumber setTransactionCount:](v24, "setTransactionCount:", 0);
            v64 = v53;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDecimalNumber setTransactions:](v24, "setTransactions:", v35);

            objc_msgSend(v10, "addObject:", v24);
            v18 = 0;
          }

          objc_msgSend(v9, "pk_absoluteValue");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDecimalNumber decimalNumberByAdding:](v54, "decimalNumberByAdding:", v36);
          v37 = objc_claimAutoreleasedReturnValue();

          v54 = (NSDecimalNumber *)v37;
          v3 = v49;
        }

      }
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    }
    while (v52);
  }

  if (objc_msgSend(v3, "count"))
  {
    v38 = objc_alloc_init(PKPaymentTransactionGroup);
    PKStartOfYear(*(void **)(*(_QWORD *)(a1 + 32) + 264));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionGroup setStartDate:](v38, "setStartDate:", v39);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionGroup setEndDate:](v38, "setEndDate:", v40);

    -[PKPaymentTransactionGroup setType:](v38, "setType:", 3);
    objc_msgSend(v3, "firstObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "totalAmount");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "currency");
    v43 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v54, v43, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionGroup setTotalAmount:](v38, "setTotalAmount:", v44);

    -[PKPaymentTransactionGroup setTransactionCount:](v38, "setTransactionCount:", 0);
    -[PKPaymentTransactionGroup setTransactions:](v38, "setTransactions:", 0);
    objc_msgSend(v3, "addObject:", v38);

  }
  v45 = objc_msgSend(v3, "count");
  if (v45)
    v46 = (void *)objc_msgSend(v3, "copy");
  else
    v46 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 240), v46);
  if (v45)

  v47 = *(_QWORD *)(a1 + 48);
  if (v47)
    (*(void (**)(void))(v47 + 16))();

}

BOOL __82__PKDashboardTransactionFetcher__addInstantWidthdrawalTransactionsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "secondaryFundingSourceType") == 2;
}

- (void)_processPaymentPassTransactionsWithTransactions:(id)a3 currentMonthOnly:(BOOL)a4 sendTransactionsBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKAsyncUnaryOperationComposer *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[6];
  BOOL v21;
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  _QWORD *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  id v28;

  v8 = a3;
  v9 = a5;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__51;
  v27[4] = __Block_byref_object_dispose__51;
  v10 = v8;
  v28 = v10;
  v11 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke;
  v26[3] = &unk_1E2ACF778;
  v26[4] = self;
  -[PKAsyncUnaryOperationComposer addOperation:](v11, "addOperation:", v26);
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_3;
  v23[3] = &unk_1E2AC71C0;
  v23[4] = self;
  v13 = v10;
  v24 = v13;
  v25 = v27;
  -[PKAsyncUnaryOperationComposer addOperation:](v11, "addOperation:", v23);
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_4;
  v22[3] = &unk_1E2ACF778;
  v22[4] = self;
  -[PKAsyncUnaryOperationComposer addOperation:](v11, "addOperation:", v22);
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_7;
  v20[3] = &unk_1E2ACF930;
  v20[4] = self;
  v20[5] = v27;
  v21 = a4;
  -[PKAsyncUnaryOperationComposer addOperation:](v11, "addOperation:", v20);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_2_67;
  v17[3] = &unk_1E2AD3EA8;
  v15 = v9;
  v18 = v15;
  v19 = v27;
  v16 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v11, "evaluateWithInput:completion:", v14, v17);

  _Block_object_dispose(v27, 8);
}

void __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  _BYTE *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = *(_BYTE **)(a1 + 32);
  if (v9[232])
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_2;
    v10[3] = &unk_1E2ABDA18;
    v12 = v7;
    v11 = v6;
    objc_msgSend(v9, "_addInstantWidthdrawalTransactionsWithCompletion:", v10);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

uint64_t __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void (**v7)(id, id, _QWORD);
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v7[2](v7, v6, 0);
    goto LABEL_19;
  }
  v25 = v6;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = *(id *)(a1 + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v10)
    goto LABEL_17;
  v11 = v10;
  v12 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v27 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      objc_msgSend(v14, "referenceIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v15, "length"))
      {

        continue;
      }
      if (objc_msgSend(v14, "transactionType") == 5)
      {

      }
      else
      {
        v16 = objc_msgSend(v14, "transactionType");

        if (v16 != 6)
          continue;
      }
      objc_msgSend(v14, "transfers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (!v18)
      {
        objc_msgSend(v14, "transactionDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSinceNow");
        v21 = fabs(v20);

        if (v21 < 3.0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "pk_setByRemovingObject:", v14);
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v24 = *(void **)(v23 + 40);
          *(_QWORD *)(v23 + 40) = v22;

          os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 37) = 1;
          os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
        }
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  }
  while (v11);
LABEL_17:

  v6 = v25;
  v7[2](v7, v25, 0);
LABEL_19:

}

void __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 208))
  {
    +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_5;
    v10[3] = &unk_1E2AD3E80;
    v10[4] = *(_QWORD *)(a1 + 32);
    v12 = v8;
    v11 = v6;
    objc_msgSend(v9, "defaultAccountForFeature:completion:", 2, v10);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_6;
  v6[3] = &unk_1E2AC4A20;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v10 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_6(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  PKTransactionSource *v11;
  PKTransactionSourceCollection *v12;
  uint64_t v13;
  void *v14;

  v2 = (void *)a1[4];
  if (v2)
  {
    objc_msgSend(v2, "associatedPassUniqueID");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = a1[5];
    v5 = *(void **)(v4 + 192);
    *(_QWORD *)(v4 + 192) = v3;

    +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "passWithUniqueID:", *(_QWORD *)(a1[5] + 192));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paymentPass");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = a1[5];
    v10 = *(void **)(v9 + 280);
    *(_QWORD *)(v9 + 280) = v8;

    v11 = -[PKTransactionSource initWithPaymentPass:]([PKTransactionSource alloc], "initWithPaymentPass:", *(_QWORD *)(a1[5] + 280));
    v12 = -[PKTransactionSourceCollection initWithTransactionSource:]([PKTransactionSourceCollection alloc], "initWithTransactionSource:", v11);
    v13 = a1[5];
    v14 = *(void **)(v13 + 200);
    *(_QWORD *)(v13 + 200) = v12;

  }
  *(_BYTE *)(a1[5] + 208) = 0;
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

void __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(id, id, _QWORD);
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  void (**v17)(id, id, _QWORD);
  uint64_t v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD **)(a1 + 32);
  if (!v10[24])
    goto LABEL_6;
  v11 = (void *)v10[11];
  if (v11)
  {
    if (objc_msgSend(v11, "containsObject:", &unk_1E2C3F250))
    {
      v10 = *(_QWORD **)(a1 + 32);
      goto LABEL_5;
    }
LABEL_6:
    v9[2](v9, v8, 0);
    goto LABEL_7;
  }
LABEL_5:
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(_QWORD *)(*(_QWORD *)(v12 + 8) + 40);
  v14 = *(unsigned __int8 *)(a1 + 48);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_65;
  v15[3] = &unk_1E2ACF8E0;
  v18 = v12;
  v17 = v9;
  v16 = v8;
  objc_msgSend(v10, "_addCashbackTransactions:currentMonthOnly:completion:", v13, v14, v15);

LABEL_7:
}

void __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_65(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_2_67(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

- (id)_feeTotalForTransaction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "currencyCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v22 = v3;
  objc_msgSend(v3, "fees");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fees");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v8)
    goto LABEL_17;
  v9 = v8;
  v10 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v24 != v10)
        objc_enumerationMutation(v7);
      objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "currencyAmount");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "currency");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v4;
      v15 = v13;
      if (v14 == v15)
      {

LABEL_12:
        objc_msgSend(v12, "amount");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "decimalNumberByAdding:", v16);
        v14 = v5;
        v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }
      v16 = v15;
      if (!v4 || !v15)
      {

        goto LABEL_14;
      }
      v17 = objc_msgSend(v14, "isEqualToString:", v15);

      if (v17)
        goto LABEL_12;
LABEL_15:

    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v9);
LABEL_17:

  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "compare:", v18))
    v19 = v5;
  else
    v19 = 0;
  v20 = v19;

  return v20;
}

- (id)_sortedTransactions:(id)a3 ascending:(BOOL)a4 limit:(unint64_t)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[2];

  v6 = a4;
  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (self->_startDate)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("transactionDate >= %@"), self->_startDate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filteredSetUsingPredicate:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v10;
  }
  if (self->_endDate)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("transactionDate <= %@"), self->_endDate);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filteredSetUsingPredicate:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v12;
  }
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("transactionDate"), v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingDescriptors:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 && objc_msgSend(v15, "count") > a5)
  {
    objc_msgSend(v15, "subarrayWithRange:", 0, a5);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }

  return v15;
}

- (void)_sendUpdatedTransactions
{
  os_unfair_lock_s *p_lockUpdate;
  _QWORD v4[5];

  p_lockUpdate = &self->_lockUpdate;
  os_unfair_lock_lock(&self->_lockUpdate);
  if (self->_pendingUpdate)
  {
    self->_hasMoreUpdates = 1;
    os_unfair_lock_unlock(p_lockUpdate);
  }
  else
  {
    self->_pendingUpdate = 1;
    os_unfair_lock_unlock(p_lockUpdate);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __57__PKDashboardTransactionFetcher__sendUpdatedTransactions__block_invoke;
    v4[3] = &unk_1E2AC89E8;
    v4[4] = self;
    -[PKDashboardTransactionFetcher reloadTransactionsWithCompletion:](self, "reloadTransactionsWithCompletion:", v4);
  }
}

void __57__PKDashboardTransactionFetcher__sendUpdatedTransactions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  dispatch_time_t v6;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "transactionsChanged:", v3);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = dispatch_time(0, 3000000000);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PKDashboardTransactionFetcher__sendUpdatedTransactions__block_invoke_2;
  v7[3] = &unk_1E2AC3648;
  objc_copyWeak(&v8, &location);
  dispatch_after(v6, MEMORY[0x1E0C80D38], v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __57__PKDashboardTransactionFetcher__sendUpdatedTransactions__block_invoke_2(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v2;
  int v3;
  os_unfair_lock_s *v4;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 8;
    v4 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 8);
    v3 = BYTE1(v4[9]._os_unfair_lock_opaque);
    LOWORD(v4[9]._os_unfair_lock_opaque) = 0;
    os_unfair_lock_unlock(v2);
    WeakRetained = v4;
    if (v3)
    {
      -[os_unfair_lock_s _sendUpdatedTransactions](v4, "_sendUpdatedTransactions");
      WeakRetained = v4;
    }
  }

}

- (BOOL)_containsFrequentTransactionType:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  unint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "integerValue", (_QWORD)v9);
        if (v7 < 0xA && ((0x269u >> v7) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return v4;
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a3;
  -[PKTransactionSourceCollection transactionSourceIdentifiers](self->_transactionSourceCollection, "transactionSourceIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", v8))
  {

LABEL_4:
    -[PKDashboardTransactionFetcher _sendUpdatedTransactions](self, "_sendUpdatedTransactions");
    goto LABEL_5;
  }
  -[PKTransactionSourceCollection transactionSourceIdentifiers](self->_cashbackTransactionSourceCollection, "transactionSourceIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v8);

  if (v7)
    goto LABEL_4;
LABEL_5:

}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v6 = (objc_class *)MEMORY[0x1E0C99E60];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  v13 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithArray:", v10);
  v15[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKDashboardTransactionFetcher didRemoveTransactionsWithSourceIdentifierMapping:](self, "didRemoveTransactionsWithSourceIdentifierMapping:", v12);
}

- (void)didRemoveTransactionsWithSourceIdentifierMapping:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v6, "initWithArray:", v7);
  -[PKTransactionSourceCollection transactionSourceIdentifiers](self->_transactionSourceCollection, "transactionSourceIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "intersectsSet:", v11))
  {

LABEL_4:
    -[PKDashboardTransactionFetcher _sendUpdatedTransactions](self, "_sendUpdatedTransactions");
    goto LABEL_5;
  }
  -[PKTransactionSourceCollection transactionSourceIdentifiers](self->_cashbackTransactionSourceCollection, "transactionSourceIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intersectsSet:", v11);

  if (v10)
    goto LABEL_4;
LABEL_5:

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  NSString *cashbackPassUniqueID;
  NSString *v11;
  NSString *v12;
  BOOL v13;
  id v14;

  v5 = a3;
  -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  v8 = v7;
  if (v8 == v14)
    goto LABEL_12;
  if (v14 && v8)
  {
    v9 = objc_msgSend(v14, "isEqualToString:", v8);

    if ((v9 & 1) != 0)
      goto LABEL_13;
  }
  else
  {

  }
  cashbackPassUniqueID = self->_cashbackPassUniqueID;
  v11 = (NSString *)v14;
  v12 = cashbackPassUniqueID;
  if (v12 == v11)
  {
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }
  if (!v14 || !v12)
  {

    goto LABEL_15;
  }
  v13 = -[NSString isEqualToString:](v11, "isEqualToString:", v12);

  if (!v13)
    goto LABEL_15;
LABEL_14:
  -[PKDashboardTransactionFetcher _sendUpdatedTransactions](self, "_sendUpdatedTransactions");
LABEL_15:

}

- (PKTransactionSourceCollection)cashbackTransactionSourceCollection
{
  return self->_cashbackTransactionSourceCollection;
}

- (void)setCashbackTransactionSourceCollection:(id)a3
{
  objc_storeStrong((id *)&self->_cashbackTransactionSourceCollection, a3);
}

- (PKDashboardTransactionFetcherDelegate)delegate
{
  return (PKDashboardTransactionFetcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSSet)counterpartHandles
{
  return self->_counterpartHandles;
}

- (BOOL)allowSynchronousFetch
{
  return self->_allowSynchronousFetch;
}

- (void)setAllowSynchronousFetch:(BOOL)a3
{
  self->_allowSynchronousFetch = a3;
}

- (PKPaymentPass)cashbackPass
{
  return self->_cashbackPass;
}

- (PKPaymentDataProvider)paymentDataProvider
{
  return self->_paymentDataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cashbackPass, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_instantWithdrawalFeeGroups, 0);
  objc_storeStrong((id *)&self->_cashbackGroups, 0);
  objc_storeStrong((id *)&self->_cashbackTransactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_cashbackPassUniqueID, 0);
  objc_storeStrong((id *)&self->_filteredTransactionSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_rewardsValue, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_statuses, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_installmentPlan, 0);
  objc_storeStrong((id *)&self->_counterpartHandles, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
}

@end
