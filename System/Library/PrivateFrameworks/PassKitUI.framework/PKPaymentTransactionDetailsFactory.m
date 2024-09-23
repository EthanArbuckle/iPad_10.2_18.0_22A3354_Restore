@implementation PKPaymentTransactionDetailsFactory

- (PKPaymentTransactionDetailsFactory)initWithContactResolver:(id)a3 peerPaymentWebService:(id)a4 paymentServiceDataProvider:(id)a5 detailViewStyle:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  PKPaymentTransactionDetailsFactory *v14;
  PKPaymentTransactionDetailsFactory *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentTransactionDetailsFactory;
  v14 = -[PKPaymentTransactionDetailsFactory init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_contactResolver, a3);
    objc_storeStrong((id *)&v15->_peerPaymentWebService, a4);
    objc_storeStrong((id *)&v15->_paymentServiceDataProvider, a5);
    v15->_detailViewStyle = a6;
  }

  return v15;
}

- (BOOL)canShowTransactionHistoryForTransaction:(id)a3 transactionSourceCollection:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void *v18;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "transactionType");
  LOBYTE(v8) = 0;
  if (v7 <= 0xD)
  {
    if (((1 << v7) & 0x2C00) != 0)
      goto LABEL_6;
    if (((1 << v7) & 3) != 0)
    {
      objc_msgSend(v5, "merchant");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {

        goto LABEL_6;
      }
      if ((objc_msgSend(v9, "hasMapsMatch") & 1) == 0)
        goto LABEL_23;
      v17 = objc_msgSend(v9, "useRawMerchantData");

      if ((v17 & 1) != 0)
        goto LABEL_22;
LABEL_6:
      objc_msgSend(v6, "paymentPass");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        LOBYTE(v8) = 1;
        objc_msgSend(v6, "transactionSourcesForType:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "count"))
        {
          objc_msgSend(v6, "transactionSourcesForType:", 3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "count"))
          {
            LOBYTE(v8) = 1;
          }
          else
          {
            objc_msgSend(v6, "transactionSourcesForType:", 2);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v8) = objc_msgSend(v18, "count") != 0;

          }
        }

        v9 = 0;
        goto LABEL_27;
      }
      v9 = v11;
      objc_msgSend(v11, "associatedAccountServiceAccountIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {

LABEL_19:
        v8 = objc_msgSend(MEMORY[0x1E0D67390], "transactionIsPaymentForPayLaterFinancingPlan:", v5) ^ 1;
LABEL_27:

        goto LABEL_28;
      }
      if ((objc_msgSend(v9, "hasAssociatedPeerPaymentAccount") & 1) != 0)
        goto LABEL_19;
LABEL_23:
      LOBYTE(v8) = 0;
      goto LABEL_27;
    }
    if (v7 == 3)
    {
      objc_msgSend(v5, "peerPaymentCounterpartHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v5, "peerPaymentType");
      LOBYTE(v8) = 0;
      if (!objc_msgSend(v9, "length") || v15 == 4 || v15 == 5)
        goto LABEL_27;
      v16 = objc_msgSend(v5, "peerPaymentPaymentMode");

      if (v16 != 2)
        goto LABEL_6;
LABEL_22:
      LOBYTE(v8) = 0;
    }
  }
LABEL_28:

  return v8;
}

- (id)_transactionFetcherWithTransactionSourceCollection:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "transactionType") == 3)
  {
    objc_msgSend(v6, "peerPaymentCounterpartHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContactResolver contactForHandle:](self->_contactResolver, "contactForHandle:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v10, "addObject:", v8);
    if (v9)
    {
      objc_msgSend(v9, "emailAddresses");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __101__PKPaymentTransactionDetailsFactory__transactionFetcherWithTransactionSourceCollection_transaction___block_invoke;
      v22[3] = &unk_1E3E632E0;
      v13 = v10;
      v23 = v13;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v22);

      objc_msgSend(v9, "phoneNumbers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v12;
      v20[1] = 3221225472;
      v20[2] = __101__PKPaymentTransactionDetailsFactory__transactionFetcherWithTransactionSourceCollection_transaction___block_invoke_2;
      v20[3] = &unk_1E3E632E0;
      v21 = v13;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v20);

    }
    v15 = objc_alloc(MEMORY[0x1E0D66C98]);
    v16 = (void *)objc_msgSend(v10, "copy");
    v17 = (void *)objc_msgSend(v15, "initWithCounterpartHandles:transactionSourceCollection:paymentDataProvider:", v16, v7, self->_paymentServiceDataProvider);

  }
  else
  {
    v18 = objc_alloc(MEMORY[0x1E0D66C98]);
    objc_msgSend(v6, "merchant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v18, "initWithMerchant:transactionSourceCollection:paymentDataProvider:", v8, v7, self->_paymentServiceDataProvider);
    v9 = v7;
  }

  return v17;
}

void __101__PKPaymentTransactionDetailsFactory__transactionFetcherWithTransactionSourceCollection_transaction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __101__PKPaymentTransactionDetailsFactory__transactionFetcherWithTransactionSourceCollection_transaction___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fullyQualifiedDigits");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

- (id)detailViewControllerForTransaction:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 bankConnectInstitution:(id)a8 physicalCards:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  PKInstallmentPlanDetailsViewController *v22;
  uint64_t v23;
  uint64_t v24;
  PKPaymentTransactionDetailViewController *v25;
  uint64_t v27;

  v15 = a8;
  v16 = a9;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  if (objc_msgSend(v21, "transactionType") == 14)
  {
    v22 = [PKInstallmentPlanDetailsViewController alloc];
    objc_msgSend(v21, "installmentPlan");
    v23 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = -[PKInstallmentPlanDetailsViewController initWithAccount:installmentPlan:accountService:accountUserCollection:familyMemberCollection:transactionSourceCollection:](v22, "initWithAccount:installmentPlan:accountService:accountUserCollection:familyMemberCollection:transactionSourceCollection:", v18, v23, v24, v17, v19, v20);

    v17 = v18;
    v18 = v19;
    v19 = v20;
    v20 = (id)v24;
    v21 = (id)v23;
  }
  else
  {
    LOBYTE(v27) = 1;
    v25 = -[PKPaymentTransactionDetailViewController initWithTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:contactResolver:peerPaymentWebService:paymentServiceDataProvider:detailViewStyle:allowTransactionLinks:]([PKPaymentTransactionDetailViewController alloc], "initWithTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:contactResolver:peerPaymentWebService:paymentServiceDataProvider:detailViewStyle:allowTransactionLinks:", v21, v20, v19, v18, v17, v15, v16, self->_contactResolver, self->_peerPaymentWebService, self->_paymentServiceDataProvider, self->_detailViewStyle, v27);
  }

  return v25;
}

- (id)historyViewControllerForTransaction:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  NSDecimalNumber *v22;
  NSString *v23;
  void *v24;
  void *v25;
  id *v26;
  NSDecimalNumber *v27;
  NSString *v28;
  void *v29;
  void *v30;
  PKTransactionHistoryViewController *v31;
  PKTransactionHistoryViewController *v32;
  PKPaymentTransactionDetailsFactory *v34;
  id v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = objc_msgSend(v14, "transactionType");
  if (v20 == 10)
  {
    v21 = objc_alloc_init(MEMORY[0x1E0D67388]);
    objc_msgSend(v21, "setType:", 9);
    objc_msgSend(v14, "amount");
    v34 = self;
    v27 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currencyCode");
    v28 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTotalAmount:", v29);

    v35 = v14;
    v25 = (void *)MEMORY[0x1E0C99D20];
    v26 = &v35;
  }
  else
  {
    if (v20 != 11)
    {
      -[PKPaymentTransactionDetailsFactory _transactionFetcherWithTransactionSourceCollection:transaction:](self, "_transactionFetcherWithTransactionSourceCollection:transaction:", v15, v14);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v31 = -[PKTransactionHistoryViewController initWithFetcher:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:featuredTransaction:selectedTransactions:transactionHistory:]([PKTransactionHistoryViewController alloc], "initWithFetcher:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:featuredTransaction:selectedTransactions:transactionHistory:", v21, v15, v16, v17, v18, v19, v14, 0, 0);
      goto LABEL_7;
    }
    v21 = objc_alloc_init(MEMORY[0x1E0D67388]);
    objc_msgSend(v21, "setType:", 7);
    objc_msgSend(v14, "amount");
    v22 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currencyCode");
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v22, v23);
    v34 = self;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTotalAmount:", v24);

    v36[0] = v14;
    v25 = (void *)MEMORY[0x1E0C99D20];
    v26 = (id *)v36;
  }
  objc_msgSend(v25, "arrayWithObjects:count:", v26, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTransactions:", v30);

  objc_msgSend(v21, "setTransactionCount:", 1);
  v31 = -[PKTransactionHistoryViewController initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:]([PKTransactionHistoryViewController alloc], "initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:", v21, v15, v16, v17, v18, v19, 0, 0, v34->_detailViewStyle);
LABEL_7:
  v32 = v31;

  return v32;
}

- (void)historyViewControllerForTransaction:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  PKTransactionHistoryViewController *v23;
  NSDecimalNumber *v24;
  NSString *v25;
  id v26;
  void *v27;
  void *v28;
  id *v29;
  NSDecimalNumber *v30;
  NSString *v31;
  void *v32;
  void *v33;
  PKTransactionHistoryViewController *v34;
  PKTransactionHistoryViewController *v35;
  PKPaymentTransactionDetailsFactory *v36;
  id v37;
  _QWORD v38[4];
  PKTransactionHistoryViewController *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (v21)
  {
    v22 = objc_msgSend(v15, "transactionType");
    if (v22 == 10)
    {
      v36 = self;
      v23 = (PKTransactionHistoryViewController *)objc_alloc_init(MEMORY[0x1E0D67388]);
      -[PKTransactionHistoryViewController setType:](v23, "setType:", 9);
      objc_msgSend(v15, "amount");
      v37 = v17;
      v30 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currencyCode");
      v26 = v18;
      v31 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTransactionHistoryViewController setTotalAmount:](v23, "setTotalAmount:", v32);

      v18 = v26;
      v47 = v15;
      v28 = (void *)MEMORY[0x1E0C99D20];
      v29 = &v47;
    }
    else
    {
      if (v22 != 11)
      {
        -[PKPaymentTransactionDetailsFactory _transactionFetcherWithTransactionSourceCollection:transaction:](self, "_transactionFetcherWithTransactionSourceCollection:transaction:", v16, v15);
        v35 = (PKTransactionHistoryViewController *)objc_claimAutoreleasedReturnValue();
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __174__PKPaymentTransactionDetailsFactory_historyViewControllerForTransaction_transactionSourceCollection_familyCollection_account_accountUserCollection_physicalCards_completion___block_invoke;
        v38[3] = &unk_1E3E63330;
        v39 = v35;
        v40 = v16;
        v41 = v17;
        v42 = v18;
        v43 = v19;
        v44 = v20;
        v45 = v15;
        v46 = v21;
        v23 = v35;
        -[PKTransactionHistoryViewController reloadTransactionsWithCompletion:](v23, "reloadTransactionsWithCompletion:", v38);

        v34 = v39;
        goto LABEL_8;
      }
      v36 = self;
      v23 = (PKTransactionHistoryViewController *)objc_alloc_init(MEMORY[0x1E0D67388]);
      -[PKTransactionHistoryViewController setType:](v23, "setType:", 7);
      objc_msgSend(v15, "amount");
      v24 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currencyCode");
      v37 = v17;
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v24, v25);
      v26 = v18;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTransactionHistoryViewController setTotalAmount:](v23, "setTotalAmount:", v27);

      v18 = v26;
      v48[0] = v15;
      v28 = (void *)MEMORY[0x1E0C99D20];
      v29 = (id *)v48;
    }
    objc_msgSend(v28, "arrayWithObjects:count:", v29, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionHistoryViewController setTransactions:](v23, "setTransactions:", v33);

    v17 = v37;
    -[PKTransactionHistoryViewController setTransactionCount:](v23, "setTransactionCount:", 1);
    v34 = -[PKTransactionHistoryViewController initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:]([PKTransactionHistoryViewController alloc], "initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:", v23, v16, v37, v26, v19, v20, 0, 0, v36->_detailViewStyle);
    (*((void (**)(id, PKTransactionHistoryViewController *))v21 + 2))(v21, v34);
LABEL_8:

  }
}

void __174__PKPaymentTransactionDetailsFactory_historyViewControllerForTransaction_transactionSourceCollection_familyCollection_account_accountUserCollection_physicalCards_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __174__PKPaymentTransactionDetailsFactory_historyViewControllerForTransaction_transactionSourceCollection_familyCollection_account_accountUserCollection_physicalCards_completion___block_invoke_2;
  block[3] = &unk_1E3E63308;
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v9 = a1[7];
  v10 = a1[8];
  v11 = a1[9];
  v12 = a1[10];
  v13 = v3;
  v14 = a1[11];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __174__PKPaymentTransactionDetailsFactory_historyViewControllerForTransaction_transactionSourceCollection_familyCollection_account_accountUserCollection_physicalCards_completion___block_invoke_2(_QWORD *a1)
{
  PKTransactionHistoryViewController *v2;

  v2 = -[PKTransactionHistoryViewController initWithFetcher:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:featuredTransaction:selectedTransactions:transactionHistory:]([PKTransactionHistoryViewController alloc], "initWithFetcher:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:featuredTransaction:selectedTransactions:transactionHistory:", a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], 0, a1[11]);
  (*(void (**)(void))(a1[12] + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
}

@end
