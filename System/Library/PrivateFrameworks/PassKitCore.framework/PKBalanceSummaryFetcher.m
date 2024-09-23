@implementation PKBalanceSummaryFetcher

- (PKBalanceSummaryFetcher)initWithTransactionSourceCollection:(id)a3 account:(id)a4
{
  id v7;
  id v8;
  PKBalanceSummaryFetcher *v9;
  PKBalanceSummaryFetcher *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *workQueue;
  dispatch_queue_t v13;
  OS_dispatch_queue *replyQueue;
  PKPaymentDefaultDataProvider *v15;
  PKPaymentDefaultDataProvider *paymentDataProvider;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKBalanceSummaryFetcher;
  v9 = -[PKBalanceSummaryFetcher init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transactionSourceCollection, a3);
    objc_storeStrong((id *)&v10->_account, a4);
    v11 = dispatch_queue_create("com.apple.passkitui.balance.work", 0);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_create("com.apple.passkitui.balance.reply", 0);
    replyQueue = v10->_replyQueue;
    v10->_replyQueue = (OS_dispatch_queue *)v13;

    v15 = objc_alloc_init(PKPaymentDefaultDataProvider);
    paymentDataProvider = v10->_paymentDataProvider;
    v10->_paymentDataProvider = v15;

    -[PKPaymentDefaultDataProvider addDelegate:](v10->_paymentDataProvider, "addDelegate:", v10);
  }

  return v10;
}

- (void)balanceSummaryStartingWithDate:(id)a3 endDate:(id)a4 type:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  PKPaymentDefaultDataProvider *paymentDataProvider;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  unint64_t v25;
  _QWORD aBlock[5];
  id v27;
  id v28;
  id v29;
  unint64_t v30;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke;
  aBlock[3] = &unk_1E2ACB168;
  v30 = a5;
  aBlock[4] = self;
  v27 = v10;
  v14 = v11;
  v28 = v14;
  v29 = v12;
  v15 = v12;
  v16 = v10;
  v17 = _Block_copy(aBlock);
  paymentDataProvider = self->_paymentDataProvider;
  -[PKTransactionSourceCollection transactionSourceIdentifiers](self->_transactionSourceCollection, "transactionSourceIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke_3;
  v22[3] = &unk_1E2ACC1F0;
  v22[4] = self;
  v23 = v14;
  v24 = v17;
  v25 = a5;
  v20 = v17;
  v21 = v14;
  -[PKPaymentDefaultDataProvider approvedTransactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:limit:completion:](paymentDataProvider, "approvedTransactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:limit:completion:", v19, 0, 1, v16, v21, 0, v22);

}

void __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke(_QWORD *a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = (_QWORD *)a1[4];
  v4 = (void *)v3[2];
  v5 = a2;
  objc_msgSend(v4, "creditDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currencyCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_summaryWithTransactions:currency:type:startDate:endDate:", v5, v7, a1[8], a1[5], a1[6]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)a1[7];
  if (v9)
  {
    v10 = *(NSObject **)(a1[4] + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke_2;
    v11[3] = &unk_1E2ABDA18;
    v13 = v9;
    v12 = v8;
    dispatch_async(v10, v11);

  }
}

uint64_t __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke_4;
  block[3] = &unk_1E2ACA840;
  v12 = *(_QWORD *)(a1 + 56);
  block[4] = v4;
  v9 = v5;
  v10 = v3;
  v11 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_async(v6, block);

}

void __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke_4(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;

  if (*(_QWORD *)(a1 + 64))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v2 = objc_alloc(MEMORY[0x1E0C99D48]);
    v3 = (void *)objc_msgSend(v2, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v4, "setDay:", -10);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateByAddingComponents:toDate:options:", v4, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 40);
    objc_msgSend(*(id *)(v7 + 8), "transactionSourceIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke_5;
    v11[3] = &unk_1E2ABE698;
    v10 = *(_QWORD *)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    objc_msgSend(v8, "pendingTransactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:limit:completion:", v9, 0, 1, v6, v10, 0, v11);

  }
}

void __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke_6;
  block[3] = &unk_1E2ABE030;
  v8 = v4;
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v5, block);

}

void __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke_6(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setByAddingObjectsFromSet:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)_summaryWithTransactions:(id)a3 currency:(id)a4 type:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7
{
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  PKPaymentTransactionGroup *v22;
  PKPaymentTransactionGroup *v23;
  PKPaymentTransactionGroup *v24;
  PKPaymentTransactionGroup *v25;
  id v27;
  PKBalanceSummary *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v29 = a6;
  v27 = a7;
  v28 = objc_alloc_init(PKBalanceSummary);
  v30 = v10;
  -[PKBalanceSummaryFetcher _sortedTransactions:ascending:](self, "_sortedTransactions:ascending:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (-[PKBalanceSummaryFetcher _transactionIsPurchase:](self, "_transactionIsPurchase:", v18))
          objc_msgSend(v12, "addObject:", v18);
        if (-[PKBalanceSummaryFetcher _transactionIsInterest:](self, "_transactionIsInterest:", v18))
          objc_msgSend(v33, "addObject:", v18);
        if (-[PKBalanceSummaryFetcher _transactionIsCredit:](self, "_transactionIsCredit:", v18))
          objc_msgSend(v32, "addObject:", v18);
        objc_msgSend(v18, "rewardsTotalAmount");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(MEMORY[0x1E0CB3598], "zero");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "compare:", v20);

          if (v21)
            objc_msgSend(v31, "addObject:", v18);
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v15);
  }

  v22 = objc_alloc_init(PKPaymentTransactionGroup);
  -[PKPaymentTransactionGroup setType:](v22, "setType:", 6);
  -[PKPaymentTransactionGroup setTransactions:](v22, "setTransactions:", v12);
  -[PKPaymentTransactionGroup setTransactionCount:](v22, "setTransactionCount:", objc_msgSend(v12, "count"));
  -[PKPaymentTransactionGroup setStartDate:](v22, "setStartDate:", v29);
  -[PKPaymentTransactionGroup setEndDate:](v22, "setEndDate:", v27);
  -[PKBalanceSummary setOrderedSpendingTransactions:](v28, "setOrderedSpendingTransactions:", v22);
  v23 = objc_alloc_init(PKPaymentTransactionGroup);
  -[PKPaymentTransactionGroup setType:](v23, "setType:", 7);
  -[PKPaymentTransactionGroup setTransactions:](v23, "setTransactions:", v33);
  -[PKPaymentTransactionGroup setTransactionCount:](v23, "setTransactionCount:", objc_msgSend(v33, "count"));
  -[PKPaymentTransactionGroup setStartDate:](v23, "setStartDate:", v29);
  -[PKPaymentTransactionGroup setEndDate:](v23, "setEndDate:", v27);
  -[PKBalanceSummary setOrderedInterestCharges:](v28, "setOrderedInterestCharges:", v23);
  v24 = objc_alloc_init(PKPaymentTransactionGroup);
  -[PKPaymentTransactionGroup setType:](v24, "setType:", 8);
  -[PKPaymentTransactionGroup setTransactions:](v24, "setTransactions:", v32);
  -[PKPaymentTransactionGroup setTransactionCount:](v24, "setTransactionCount:", objc_msgSend(v32, "count"));
  -[PKPaymentTransactionGroup setStartDate:](v24, "setStartDate:", v29);
  -[PKPaymentTransactionGroup setEndDate:](v24, "setEndDate:", v27);
  -[PKBalanceSummary setOrderedCredits:](v28, "setOrderedCredits:", v24);
  v25 = objc_alloc_init(PKPaymentTransactionGroup);
  -[PKPaymentTransactionGroup setType:](v25, "setType:", 4);
  -[PKPaymentTransactionGroup setTransactions:](v25, "setTransactions:", v31);
  -[PKPaymentTransactionGroup setTransactionCount:](v25, "setTransactionCount:", objc_msgSend(v31, "count"));
  -[PKPaymentTransactionGroup setStartDate:](v25, "setStartDate:", v29);
  -[PKPaymentTransactionGroup setEndDate:](v25, "setEndDate:", v27);
  -[PKBalanceSummary setRewards:](v28, "setRewards:", v25);

  return v28;
}

- (id)_sortedTransactions:(id)a3 ascending:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v4 = a4;
  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3928];
  v6 = a3;
  objc_msgSend(v5, "sortDescriptorWithKey:ascending:", CFSTR("transactionDate"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_transactionIsPurchase:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "transactionType");
  if (v4 == 13)
    goto LABEL_5;
  if (v4)
  {
    v6 = 0;
    goto LABEL_7;
  }
  v5 = objc_msgSend(v3, "transactionStatus");
  v6 = 0;
  if (v5 <= 8 && ((1 << v5) & 0x103) != 0)
  {
LABEL_5:
    objc_msgSend(v3, "amount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "compare:", v8) == 1;

  }
LABEL_7:

  return v6;
}

- (BOOL)_transactionIsInterest:(id)a3
{
  return objc_msgSend(a3, "transactionType") == 11;
}

- (BOOL)_transactionIsCredit:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "transactionType");
  if (v4 > 0xA || ((1 << v4) & 0x483) == 0)
  {
    v7 = 0;
  }
  else
  {
    v6 = objc_msgSend(v3, "transactionStatus");
    v7 = 0;
    if (v6 <= 8 && ((1 << v6) & 0x103) != 0)
    {
      objc_msgSend(v3, "amount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "compare:", v9) == -1;

    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
}

@end
