@implementation PKBillPaymentSuggestedAmountController

+ (void)defaultControllerForAccount:(id)a3 accountUserCollection:(id)a4 transactionSource:(id)a5 configuration:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t i;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD block[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD v48[4];
  NSObject *v49;
  _QWORD *v50;
  _QWORD v51[4];
  NSObject *v52;
  _QWORD *v53;
  _QWORD v54[4];
  NSObject *v55;
  _QWORD *v56;
  uint64_t v57;
  _QWORD v58[4];
  NSObject *v59;
  _QWORD *v60;
  uint64_t v61;
  _QWORD v62[4];
  NSObject *v63;
  _QWORD *v64;
  _QWORD v65[4];
  NSObject *v66;
  _QWORD *v67;
  _QWORD v68[4];
  NSObject *v69;
  _QWORD *v70;
  _QWORD v71[4];
  NSObject *v72;
  _QWORD *v73;
  _QWORD v74[5];
  id v75;
  _QWORD v76[5];
  id v77;
  _QWORD v78[5];
  id v79;
  _QWORD v80[5];
  id v81;
  _QWORD v82[5];
  id v83;
  _QWORD v84[5];
  id v85;
  _QWORD v86[5];
  id v87;
  _QWORD v88[5];
  id v89;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = dispatch_group_create();
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x3032000000;
  v88[3] = __Block_byref_object_copy__64;
  v88[4] = __Block_byref_object_dispose__64;
  v89 = 0;
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x3032000000;
  v86[3] = __Block_byref_object_copy__64;
  v86[4] = __Block_byref_object_dispose__64;
  v87 = 0;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x3032000000;
  v84[3] = __Block_byref_object_copy__64;
  v84[4] = __Block_byref_object_dispose__64;
  v85 = 0;
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x3032000000;
  v82[3] = __Block_byref_object_copy__64;
  v82[4] = __Block_byref_object_dispose__64;
  v83 = 0;
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x3032000000;
  v80[3] = __Block_byref_object_copy__64;
  v80[4] = __Block_byref_object_dispose__64;
  v81 = 0;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x3032000000;
  v78[3] = __Block_byref_object_copy__64;
  v78[4] = __Block_byref_object_dispose__64;
  v79 = 0;
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x3032000000;
  v76[3] = __Block_byref_object_copy__64;
  v76[4] = __Block_byref_object_dispose__64;
  v77 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x3032000000;
  v74[3] = __Block_byref_object_copy__64;
  v74[4] = __Block_byref_object_dispose__64;
  v32 = v15;
  v33 = v13;
  v75 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  dispatch_group_enter(v17);
  v18 = MEMORY[0x1E0C809B0];
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke;
  v71[3] = &unk_1E2AD7BF0;
  v73 = v82;
  v19 = v17;
  v72 = v19;
  objc_msgSend(a1, "approvedTransactionsTotalForPreviousStatementForAccount:transactionSource:transactionType:completion:", v12, v14, 10, v71);
  dispatch_group_enter(v19);
  v68[0] = v18;
  v68[1] = 3221225472;
  v68[2] = __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_2;
  v68[3] = &unk_1E2AD7BF0;
  v70 = v84;
  v20 = v19;
  v69 = v20;
  objc_msgSend(a1, "approvedTransactionsTotalSinceStatementForAccount:transactionSource:transactionType:completion:", v12, v14, 10, v68);
  dispatch_group_enter(v20);
  v65[0] = v18;
  v65[1] = 3221225472;
  v65[2] = __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_3;
  v65[3] = &unk_1E2AD7BF0;
  v67 = v80;
  v21 = v20;
  v66 = v21;
  objc_msgSend(a1, "approvedTransactionsTotalSinceStatementForAccount:transactionSource:transactionType:completion:", v12, v14, 0, v65);
  dispatch_group_enter(v21);
  v62[0] = v18;
  v62[1] = 3221225472;
  v62[2] = __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_4;
  v62[3] = &unk_1E2AD7BF0;
  v64 = v78;
  v22 = v21;
  v63 = v22;
  objc_msgSend(a1, "approvedTransactionsTotalForPreviousStatementForAccount:transactionSource:transactionType:completion:", v12, v14, 0, v62);
  for (i = 0; i != 8; ++i)
  {
    if (i && i != 6)
    {
      dispatch_group_enter(v22);
      v58[0] = v18;
      v58[1] = 3221225472;
      v58[2] = __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_5;
      v58[3] = &unk_1E2AD7C18;
      v60 = v76;
      v61 = i;
      v24 = v22;
      v59 = v24;
      objc_msgSend(a1, "approvedTransactionsSpendingTotalSinceStatementForAccount:transactionSource:merchantCategory:completion:", v12, v14, i, v58);
      dispatch_group_enter(v24);
      v54[0] = v18;
      v54[1] = 3221225472;
      v54[2] = __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_6;
      v54[3] = &unk_1E2AD7C18;
      v56 = v74;
      v57 = i;
      v55 = v24;
      objc_msgSend(a1, "approvedTransactionsSpendingTotalForPreviousStatementForAccount:transactionSource:merchantCategory:completion:", v12, v14, i, v54);

    }
  }
  dispatch_group_enter(v22);
  v51[0] = v18;
  v51[1] = 3221225472;
  v51[2] = __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_7;
  v51[3] = &unk_1E2AC35A8;
  v53 = v88;
  v25 = v22;
  v52 = v25;
  objc_msgSend(a1, "currentStatementSelectedSuggestedAmountEventsForAccount:completion:", v12, v51);
  dispatch_group_enter(v25);
  v48[0] = v18;
  v48[1] = 3221225472;
  v48[2] = __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_8;
  v48[3] = &unk_1E2AC35A8;
  v50 = v86;
  v26 = v25;
  v49 = v26;
  objc_msgSend(a1, "previousStatementSelectedSuggestedAmountEventsForAccount:completion:", v12, v48);
  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_9;
  block[3] = &unk_1E2AD7C40;
  v35 = v12;
  v36 = v33;
  v41 = v86;
  v42 = v84;
  v43 = v82;
  v44 = v80;
  v45 = v78;
  v46 = v76;
  v47 = v74;
  v37 = v14;
  v38 = v32;
  v40 = v88;
  v39 = v16;
  v27 = v16;
  v28 = v32;
  v29 = v14;
  v30 = v33;
  v31 = v12;
  dispatch_group_notify(v26, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v74, 8);
  _Block_object_dispose(v76, 8);

  _Block_object_dispose(v78, 8);
  _Block_object_dispose(v80, 8);

  _Block_object_dispose(v82, 8);
  _Block_object_dispose(v84, 8);

  _Block_object_dispose(v86, 8);
  _Block_object_dispose(v88, 8);

}

void __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "amount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pk_absoluteValue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "amount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pk_absoluteValue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "amount");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "amount");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "amount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_msgSend(v5, "pk_isZeroNumber") & 1) == 0)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, v4);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "amount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_msgSend(v5, "pk_isZeroNumber") & 1) == 0)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, v4);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __135__PKBillPaymentSuggestedAmountController_defaultControllerForAccount_accountUserCollection_transactionSource_configuration_completion___block_invoke_9(_QWORD *a1)
{
  PKBillPaymentSuggestedAmountController *v2;

  v2 = -[PKBillPaymentSuggestedAmountController initWithAccount:accountUserCollection:transactionSource:currentStatementSelectedSuggestedAmountEvents:previousStatementSelectedSuggestedAmountEvents:currentStatementPaymentsSum:previousStatementPaymentsSum:currentStatementPurchasesSum:previousStatementPurchasesSum:currentStatementMerchantCategoryTransactionSums:previousStatementMerchantCategoryTransactionSums:configuration:]([PKBillPaymentSuggestedAmountController alloc], "initWithAccount:accountUserCollection:transactionSource:currentStatementSelectedSuggestedAmountEvents:previousStatementSelectedSuggestedAmountEvents:currentStatementPaymentsSum:previousStatementPaymentsSum:currentStatementPurchasesSum:previousStatementPurchasesSum:currentStatementMerchantCategoryTransactionSums:previousStatementMerchantCategoryTransactionSums:configuration:", a1[4], a1[5], a1[6], *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[11] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[12] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[13] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[14] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[15] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[16] + 8) + 40), a1[7]);
  (*(void (**)(void))(a1[8] + 16))();

}

+ (void)approvedTransactionsTotalSinceStatementForAccount:(id)a3 transactionSource:(id)a4 transactionType:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;

  v10 = a6;
  objc_msgSend(a1, "_transactionsRequestSinceStatementForAccount:transactionSource:transactionType:", a3, a4, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_transactionsTotalAmountForRequest:completion:", v11, v10);

}

+ (void)approvedTransactionsTotalForPreviousStatementForAccount:(id)a3 transactionSource:(id)a4 transactionType:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;

  v10 = a6;
  objc_msgSend(a1, "_transactionsRequestForPreviousStatementForAccount:transactionSource:transactionType:", a3, a4, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_transactionsTotalAmountForRequest:completion:", v11, v10);

}

+ (void)approvedTransactionsSpendingTotalForPreviousStatementForAccount:(id)a3 transactionSource:(id)a4 merchantCategory:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;

  v10 = a6;
  objc_msgSend(a1, "_transactionsRequestForPreviousStatementForAccount:transactionSource:transactionType:", a3, a4, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMerchantCategory:", a5);
  objc_msgSend(a1, "_transactionsTotalAmountForRequest:completion:", v11, v10);

}

+ (void)approvedTransactionsSpendingTotalSinceStatementForAccount:(id)a3 transactionSource:(id)a4 merchantCategory:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;

  v10 = a6;
  objc_msgSend(a1, "_transactionsRequestSinceStatementForAccount:transactionSource:transactionType:", a3, a4, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMerchantCategory:", a5);
  objc_msgSend(a1, "_transactionsTotalAmountForRequest:completion:", v11, v10);

}

+ (id)_transactionsRequestForPreviousStatementForAccount:(id)a3 transactionSource:(id)a4 transactionType:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PKPaymentTransactionRequest *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "creditDetails");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountSummary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentStatement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "associatedPassUniqueID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "openingDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "closingDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "creditDetails");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "currencyCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  if (v13 && v14 && v12 && v16)
  {
    v17 = objc_alloc_init(PKPaymentTransactionRequest);
    objc_msgSend(v7, "transactionSourceIdentifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionRequest setTransactionSourceIdentifiers:](v17, "setTransactionSourceIdentifiers:", v18);

    -[PKPaymentTransactionRequest setStartStatusChangeDate:](v17, "setStartStatusChangeDate:", v13);
    -[PKPaymentTransactionRequest setEndStatusChangeDate:](v17, "setEndStatusChangeDate:", v14);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionRequest setTransactionTypes:](v17, "setTransactionTypes:", v20);

    -[PKPaymentTransactionRequest setTransactionStatuses:](v17, "setTransactionStatuses:", &unk_1E2C3E398);
    -[PKPaymentTransactionRequest setCurrencyCode:](v17, "setCurrencyCode:", v16);
  }

  return v17;
}

+ (id)_transactionsRequestSinceStatementForAccount:(id)a3 transactionSource:(id)a4 transactionType:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PKPaymentTransactionRequest *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "creditDetails");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountSummary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "balanceSummary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "associatedPassUniqueID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "openingDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "closingDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "creditDetails");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "currencyCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  if (v13 && v14 && v12 && v16)
  {
    v17 = objc_alloc_init(PKPaymentTransactionRequest);
    objc_msgSend(v7, "transactionSourceIdentifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionRequest setTransactionSourceIdentifiers:](v17, "setTransactionSourceIdentifiers:", v18);

    -[PKPaymentTransactionRequest setStartStatusChangeDate:](v17, "setStartStatusChangeDate:", v13);
    -[PKPaymentTransactionRequest setEndStatusChangeDate:](v17, "setEndStatusChangeDate:", v14);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransactionRequest setTransactionTypes:](v17, "setTransactionTypes:", v20);

    -[PKPaymentTransactionRequest setTransactionStatuses:](v17, "setTransactionStatuses:", &unk_1E2C3E3B0);
    -[PKPaymentTransactionRequest setCurrencyCode:](v17, "setCurrencyCode:", v16);
  }

  return v17;
}

+ (void)_transactionsTotalAmountForRequest:(id)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD);
  PKPaymentService *v6;
  id v7;

  v7 = a3;
  v5 = (void (**)(id, _QWORD))a4;
  if (v5)
  {
    if (v7)
    {
      v6 = objc_alloc_init(PKPaymentService);
      -[PKPaymentService transactionsTotalAmountForRequest:completion:](v6, "transactionsTotalAmountForRequest:completion:", v7, v5);

    }
    else
    {
      v5[2](v5, 0);
    }
  }

}

+ (void)currentStatementSelectedSuggestedAmountEventsForAccount:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  if (v5)
  {
    v6 = a3;
    objc_msgSend(v6, "creditDetails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountSummary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentStatement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && v9 && v10)
    {
      +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __109__PKBillPaymentSuggestedAmountController_currentStatementSelectedSuggestedAmountEventsForAccount_completion___block_invoke;
      v13[3] = &unk_1E2ABE738;
      v14 = v5;
      objc_msgSend(v12, "billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:withStatementIdentifier:completion:", v11, v10, v13);

    }
    else
    {
      (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
    }

  }
}

uint64_t __109__PKBillPaymentSuggestedAmountController_currentStatementSelectedSuggestedAmountEventsForAccount_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)previousStatementSelectedSuggestedAmountEventsForAccount:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v5 = a4;
  if (v5)
  {
    v6 = a3;
    objc_msgSend(v6, "creditDetails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountSummary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentStatement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "accountIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "openingDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "closingDate");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11 && v12)
    {
      +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __110__PKBillPaymentSuggestedAmountController_previousStatementSelectedSuggestedAmountEventsForAccount_completion___block_invoke;
      v15[3] = &unk_1E2ABE738;
      v16 = v5;
      objc_msgSend(v14, "billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:withStartDate:endDate:completion:", v10, v11, v13, v15);

    }
    else
    {
      (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
    }

  }
}

uint64_t __110__PKBillPaymentSuggestedAmountController_previousStatementSelectedSuggestedAmountEventsForAccount_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (PKBillPaymentSuggestedAmountController)initWithAccount:(id)a3 accountUserCollection:(id)a4 transactionSource:(id)a5 currentStatementSelectedSuggestedAmountEvents:(id)a6 previousStatementSelectedSuggestedAmountEvents:(id)a7 currentStatementPaymentsSum:(id)a8 previousStatementPaymentsSum:(id)a9 currentStatementPurchasesSum:(id)a10 previousStatementPurchasesSum:(id)a11 currentStatementMerchantCategoryTransactionSums:(id)a12 previousStatementMerchantCategoryTransactionSums:(id)a13 configuration:(id)a14
{
  id v19;
  id v20;
  id v21;
  PKBillPaymentSuggestedAmountController *v22;
  PKBillPaymentSuggestedAmountController *v23;
  NSDecimalNumber **p_previousStatementPaymentsSum;
  uint64_t v25;
  NSDictionary *currentStatementMerchantCategoryTransactionSums;
  uint64_t v27;
  NSDictionary *previousStatementMerchantCategoryTransactionSums;
  NSObject *v29;
  NSDecimalNumber *v30;
  NSDecimalNumber *v31;
  NSDecimalNumber *previousStatementPurchasesSum;
  NSDecimalNumber *currentStatementPurchasesSum;
  NSDictionary *v34;
  NSDictionary *v35;
  NSArray *currentStatementSelectedSuggestedAmountEvents;
  NSArray *previousStatementSelectedSuggestedAmountEvents;
  PKAccountServiceAccountResolutionConfiguration *configuration;
  void *v39;
  void *v40;
  NSDateFormatter *v41;
  NSDateFormatter *monthAndDayFormatter;
  NSDateFormatter *v43;
  NSDateFormatter *monthFormatter;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  char v50;
  char v51;
  uint64_t v52;
  NSArray *v53;
  uint64_t v54;
  NSArray *v55;
  NSDecimalNumber *currentStatementPaymentsSum;
  NSDecimalNumber *v57;
  NSDecimalNumber *v58;
  char v59;
  NSDecimalNumber *v60;
  NSDecimalNumber *v61;
  NSDecimalNumber *v62;
  NSDecimalNumber *v63;
  char v64;
  NSDecimalNumber *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSDictionary *merchantCategoryTransactionSums;
  FHPaymentRingSuggestionController *v70;
  FHPaymentRingSuggestionController *fhController;
  BOOL v73;
  id v74;
  id v76;
  id v77;
  id v78;
  NSDecimalNumber **p_currentStatementPaymentsSum;
  id v80;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  objc_super v92;
  uint8_t buf[4];
  void *v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v91 = a3;
  v76 = a4;
  v90 = a4;
  v89 = a5;
  v77 = a6;
  v88 = a6;
  v78 = a7;
  v19 = a7;
  v80 = a8;
  v87 = a8;
  v86 = a9;
  v85 = a10;
  v84 = a11;
  v20 = a12;
  v21 = a13;
  v83 = a14;
  v92.receiver = self;
  v92.super_class = (Class)PKBillPaymentSuggestedAmountController;
  v22 = -[PKBillPaymentSuggestedAmountController init](&v92, sel_init);
  v23 = v22;
  if (!v22)
    goto LABEL_35;
  v74 = v19;
  objc_storeStrong((id *)&v22->_account, a3);
  objc_storeStrong((id *)&v23->_accountUserCollection, v76);
  objc_storeStrong((id *)&v23->_transactionSource, a5);
  objc_storeStrong((id *)&v23->_currentStatementSelectedSuggestedAmountEvents, v77);
  objc_storeStrong((id *)&v23->_previousStatementSelectedSuggestedAmountEvents, v78);
  p_currentStatementPaymentsSum = &v23->_currentStatementPaymentsSum;
  objc_storeStrong((id *)&v23->_currentStatementPaymentsSum, v80);
  p_previousStatementPaymentsSum = &v23->_previousStatementPaymentsSum;
  objc_storeStrong((id *)&v23->_previousStatementPaymentsSum, a9);
  objc_storeStrong((id *)&v23->_currentStatementPurchasesSum, a10);
  objc_storeStrong((id *)&v23->_previousStatementPurchasesSum, a11);
  v82 = v20;
  v25 = objc_msgSend(v20, "copy");
  currentStatementMerchantCategoryTransactionSums = v23->_currentStatementMerchantCategoryTransactionSums;
  v23->_currentStatementMerchantCategoryTransactionSums = (NSDictionary *)v25;

  v27 = objc_msgSend(v21, "copy");
  previousStatementMerchantCategoryTransactionSums = v23->_previousStatementMerchantCategoryTransactionSums;
  v23->_previousStatementMerchantCategoryTransactionSums = (NSDictionary *)v27;

  objc_storeStrong((id *)&v23->_configuration, a14);
  PKLogFacilityTypeGetObject(0xEuLL);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = *p_previousStatementPaymentsSum;
    *(_DWORD *)buf = 138412290;
    v94 = v30;
    _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Bill payment suggested amount controller using previousStatementPaymentsSum: %@", buf, 0xCu);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v31 = *p_currentStatementPaymentsSum;
    *(_DWORD *)buf = 138412290;
    v94 = v31;
    _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Bill payment suggested amount controller using currentStatementPaymentsSum: %@", buf, 0xCu);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    previousStatementPurchasesSum = v23->_previousStatementPurchasesSum;
    *(_DWORD *)buf = 138412290;
    v94 = previousStatementPurchasesSum;
    _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Bill payment suggested amount controller using previousStatementPurchasesSum: %@", buf, 0xCu);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    currentStatementPurchasesSum = v23->_currentStatementPurchasesSum;
    *(_DWORD *)buf = 138412290;
    v94 = currentStatementPurchasesSum;
    _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Bill payment suggested amount controller using currentStatementPurchasesSum: %@", buf, 0xCu);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v34 = v23->_currentStatementMerchantCategoryTransactionSums;
    *(_DWORD *)buf = 138412290;
    v94 = v34;
    _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Bill payment suggested amount controller using currentStatementMerchantCategoryTransactionSums: %@", buf, 0xCu);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v35 = v23->_previousStatementMerchantCategoryTransactionSums;
    *(_DWORD *)buf = 138412290;
    v94 = v35;
    _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Bill payment suggested amount controller using previousStatementMerchantCategoryTransactionSums: %@", buf, 0xCu);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    currentStatementSelectedSuggestedAmountEvents = v23->_currentStatementSelectedSuggestedAmountEvents;
    *(_DWORD *)buf = 138412290;
    v94 = currentStatementSelectedSuggestedAmountEvents;
    _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Bill payment suggested amount controller using currentStatementSelectedSuggestedAmountEvents: %@", buf, 0xCu);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    previousStatementSelectedSuggestedAmountEvents = v23->_previousStatementSelectedSuggestedAmountEvents;
    *(_DWORD *)buf = 138412290;
    v94 = previousStatementSelectedSuggestedAmountEvents;
    _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Bill payment suggested amount controller using previousStatementSelectedSuggestedAmountEvents: %@", buf, 0xCu);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    configuration = v23->_configuration;
    *(_DWORD *)buf = 138412290;
    v94 = configuration;
    _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Bill payment suggested amount controller using configuration: %@", buf, 0xCu);
  }

  -[PKAccount creditDetails](v23->_account, "creditDetails");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "productTimeZone");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
  monthAndDayFormatter = v23->_monthAndDayFormatter;
  v23->_monthAndDayFormatter = v41;

  -[NSDateFormatter setTimeZone:](v23->_monthAndDayFormatter, "setTimeZone:", v40);
  -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v23->_monthAndDayFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d"));
  v43 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
  monthFormatter = v23->_monthFormatter;
  v23->_monthFormatter = v43;

  -[NSDateFormatter setTimeZone:](v23->_monthFormatter, "setTimeZone:", v40);
  -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v23->_monthFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM"));
  -[PKAccount creditDetails](v23->_account, "creditDetails");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "accountSummary");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "currentStatement");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "identifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "length");

  v50 = -[NSDecimalNumber pk_isPositiveNumber](v23->_previousStatementPaymentsSum, "pk_isPositiveNumber");
  v23->_isMonthZero = v49 == 0;
  v51 = v50 ^ 1;
  if (!v49)
    v51 = 0;
  v23->_isMonthOne = v51;
  v23->_numberOfActiveInstallments = objc_msgSend(v45, "numberOfActiveInstallments");
  v23->_numberOfActiveStatementedInstallments = objc_msgSend(v45, "numberOfActiveStatementedInstallments");
  -[NSArray sortedArrayUsingComparator:](v23->_currentStatementSelectedSuggestedAmountEvents, "sortedArrayUsingComparator:", &__block_literal_global_182);
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = v23->_currentStatementSelectedSuggestedAmountEvents;
  v23->_currentStatementSelectedSuggestedAmountEvents = (NSArray *)v52;

  -[NSArray sortedArrayUsingComparator:](v23->_previousStatementSelectedSuggestedAmountEvents, "sortedArrayUsingComparator:", &__block_literal_global_29_1);
  v54 = objc_claimAutoreleasedReturnValue();
  v55 = v23->_previousStatementSelectedSuggestedAmountEvents;
  v23->_previousStatementSelectedSuggestedAmountEvents = (NSArray *)v54;

  currentStatementPaymentsSum = v23->_currentStatementPaymentsSum;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v57 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  v58 = v57;
  if (!currentStatementPaymentsSum || !v57)
  {

    if (currentStatementPaymentsSum != v58)
      goto LABEL_26;
    goto LABEL_25;
  }
  v59 = -[NSDecimalNumber isEqual:](currentStatementPaymentsSum, "isEqual:", v57);

  if ((v59 & 1) != 0)
  {
LABEL_25:
    v60 = *p_currentStatementPaymentsSum;
    *p_currentStatementPaymentsSum = 0;

  }
LABEL_26:
  v61 = *p_previousStatementPaymentsSum;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v62 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  v63 = v62;
  if (!v61 || !v62)
  {

    v73 = v61 == v63;
    v19 = v74;
    if (!v73)
      goto LABEL_30;
    goto LABEL_29;
  }
  v64 = -[NSDecimalNumber isEqual:](v61, "isEqual:", v62);

  v19 = v74;
  if ((v64 & 1) != 0)
  {
LABEL_29:
    v65 = *p_previousStatementPaymentsSum;
    *p_previousStatementPaymentsSum = 0;

  }
LABEL_30:
  v66 = 144;
  if (!v23->_isMonthZero)
    v66 = 160;
  objc_storeStrong((id *)&v23->_statementPurchasesSum, *(id *)((char *)&v23->super.isa + v66));
  v67 = 184;
  if (!v23->_isMonthZero)
    v67 = 176;
  v68 = objc_msgSend(*(id *)((char *)&v23->super.isa + v67), "copy");
  merchantCategoryTransactionSums = v23->_merchantCategoryTransactionSums;
  v23->_merchantCategoryTransactionSums = (NSDictionary *)v68;

  v23->_currentStatementIsLastMonthsStatement = -[PKBillPaymentSuggestedAmountController _calculateCurrentStatementIsLastMonthsStatement](v23, "_calculateCurrentStatementIsLastMonthsStatement");
  -[PKBillPaymentSuggestedAmountController _initializeDifferentialPrivacy:accountSummary:](v23, "_initializeDifferentialPrivacy:accountSummary:", v19, v46);
  -[PKBillPaymentSuggestedAmountController _initializePaymentRingInstrumentationRecord:accountSummary:](v23, "_initializePaymentRingInstrumentationRecord:accountSummary:", v19, v46);
  v70 = (FHPaymentRingSuggestionController *)objc_alloc_init((Class)getFHPaymentRingSuggestionControllerClass[0]());
  fhController = v23->_fhController;
  v23->_fhController = v70;

  v20 = v82;
LABEL_35:

  return v23;
}

uint64_t __418__PKBillPaymentSuggestedAmountController_initWithAccount_accountUserCollection_transactionSource_currentStatementSelectedSuggestedAmountEvents_previousStatementSelectedSuggestedAmountEvents_currentStatementPaymentsSum_previousStatementPaymentsSum_currentStatementPurchasesSum_previousStatementPurchasesSum_currentStatementMerchantCategoryTransactionSums_previousStatementMerchantCategoryTransactionSums_configuration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(a2, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = v10;
    objc_msgSend(v7, "transactionDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transactionDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v12, "compare:", v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __418__PKBillPaymentSuggestedAmountController_initWithAccount_accountUserCollection_transactionSource_currentStatementSelectedSuggestedAmountEvents_previousStatementSelectedSuggestedAmountEvents_currentStatementPaymentsSum_previousStatementPaymentsSum_currentStatementPurchasesSum_previousStatementPurchasesSum_currentStatementMerchantCategoryTransactionSums_previousStatementMerchantCategoryTransactionSums_configuration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(a2, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = v10;
    objc_msgSend(v7, "transactionDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transactionDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v12, "compare:", v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_createDefaultAmountSuggestionListFromAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  PKBillPaymentSuggestedAmountList *v11;
  void *v12;
  void *v13;
  void *v14;
  PKBillPaymentSuggestedAmountList *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  PKBillPaymentSuggestedAmount *v22;
  void *v23;
  PKBillPaymentSuggestedAmount *v24;
  PKBillPaymentSuggestedAmount *v25;
  void *v27;
  id v28;
  _BOOL4 v29;
  void *v30;
  void *v31;

  -[PKAccount creditDetails](self->_account, "creditDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "adjustedBalance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentBalance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountServiceAccountResolutionConfiguration earlyInstallmentPlan](self->_configuration, "earlyInstallmentPlan");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v7;
  if (v30)
  {
    v8 = objc_msgSend(v7, "compare:", v6, v7);
    v29 = v8 == 1;
    if (v8 == 1)
      v9 = v7;
    else
      v9 = v6;
  }
  else
  {
    v29 = 0;
    v9 = v6;
  }
  v10 = v9;
  v11 = [PKBillPaymentSuggestedAmountList alloc];
  v31 = v3;
  objc_msgSend(v3, "currencyCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remainingMinimumPayment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remainingStatementBalance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v15 = -[PKBillPaymentSuggestedAmountList initWithCurrencyCode:remainingMinimumPayment:remainingStatementBalance:currentBalance:](v11, "initWithCurrencyCode:remainingMinimumPayment:remainingStatementBalance:currentBalance:", v12, v13, v14, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKBillPaymentSuggestedAmountList initWithCurrencyCode:remainingMinimumPayment:remainingStatementBalance:currentBalance:](v11, "initWithCurrencyCode:remainingMinimumPayment:remainingStatementBalance:currentBalance:", v12, v13, v14, v16);

  }
  -[PKBillPaymentSuggestedAmountList minimumAmount](v15, "minimumAmount");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17
    || (-[PKBillPaymentSuggestedAmountList maximumAmount](v15, "maximumAmount"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v17, "isEqual:", v18),
        v18,
        v19))
  {
    -[PKBillPaymentSuggestedAmountList remainingStatementAmount](v15, "remainingStatementAmount", v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      v21 = 1;
    else
      v21 = 18;
    v22 = [PKBillPaymentSuggestedAmount alloc];
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[PKBillPaymentSuggestedAmount initWithAmount:category:](v22, "initWithAmount:category:", v23, v21);

    -[PKBillPaymentSuggestedAmountList setInitialSuggestedAmount:](v15, "setInitialSuggestedAmount:", v24);
  }
  if (v29)
  {
    v25 = -[PKBillPaymentSuggestedAmount initWithAmount:category:]([PKBillPaymentSuggestedAmount alloc], "initWithAmount:category:", v6, 30);
    -[PKBillPaymentSuggestedAmountList addSuggestedAmount:](v15, "addSuggestedAmount:", v25);

  }
  -[PKBillPaymentSuggestedAmountController _populateStringValuesForList:](self, "_populateStringValuesForList:", v15, v27);

  return v15;
}

- (id)generateAmountSuggestionListWithFinHealth:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  FHPaymentRingSuggestionController *fhController;
  PKAccount *account;
  NSDecimalNumber *previousStatementPaymentsSum;
  NSDecimalNumber *currentStatementPaymentsSum;
  NSDictionary *merchantCategoryTransactionSums;
  NSDecimalNumber *statementPurchasesSum;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  NSMutableDictionary *paymentRingInstrumentationRecord;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v3 = a3;
  v62 = *MEMORY[0x1E0C80C00];
  -[PKBillPaymentSuggestedAmountController _createDefaultAmountSuggestionListFromAccount](self, "_createDefaultAmountSuggestionListFromAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "accountSummary");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "remainingStatementBalance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v47 = v8;

    v49 = (void *)objc_opt_new();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v10 = self->_previousStatementSelectedSuggestedAmountEvents;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v55 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "items");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "allObjects");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v49, "addObject:", v17);

        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
      }
      while (v12);
    }

    fhController = self->_fhController;
    account = self->_account;
    previousStatementPaymentsSum = self->_previousStatementPaymentsSum;
    currentStatementPaymentsSum = self->_currentStatementPaymentsSum;
    statementPurchasesSum = self->_statementPurchasesSum;
    merchantCategoryTransactionSums = self->_merchantCategoryTransactionSums;
    v24 = (void *)objc_msgSend(v49, "copy");
    LOWORD(v44) = *(_WORD *)&self->_isMonthZero;
    -[FHPaymentRingSuggestionController generatePaymentRingSuggestionsFromConvertedObjects:previousStatementPaymentsSum:currentStatementPaymentsSum:statementPurchasesSum:merchantCategoryTransactionSums:billPaymentSelectedSuggestedAmountData:isMonthZero:isMonthOne:](fhController, "generatePaymentRingSuggestionsFromConvertedObjects:previousStatementPaymentsSum:currentStatementPaymentsSum:statementPurchasesSum:merchantCategoryTransactionSums:billPaymentSelectedSuggestedAmountData:isMonthZero:isMonthOne:", account, previousStatementPaymentsSum, currentStatementPaymentsSum, statementPurchasesSum, merchantCategoryTransactionSums, v24, v44);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject(0xEuLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v25, "description");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v60 = v27;
      _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "Suggestions calculated from FinHealth %@", buf, 0xCu);

    }
    v46 = v26;

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v28 = v25;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v51 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
          if (!self->_isMonthZero && !self->_isMonthOne && (objc_msgSend(v48, "isInMonthOfMerge") & 1) == 0)
          {
            objc_msgSend(v33, "amount");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "compare:", v47);

            if (v35 != -1)
              continue;
          }
          objc_msgSend(v5, "addSuggestedAmount:", v33);
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      }
      while (v30);
    }

    if (v49 && objc_msgSend(v49, "count"))
    {
      objc_msgSend(v49, "lastObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "suggestedAmountCategory");

      v38 = PKBillPaymentSuggestedAmountCategoryToPaymentRingInstrumentation(v37);
      paymentRingInstrumentationRecord = self->_paymentRingInstrumentationRecord;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      _MergedGlobals_182();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](paymentRingInstrumentationRecord, "setObject:forKey:", v40, v41);

    }
    v9 = v46;
  }
  else
  {
    -[PKBillPaymentSuggestedAmountController _generateAmountSuggestionListUsingTransactionHistoryForList:](self, "_generateAmountSuggestionListUsingTransactionHistoryForList:", v5);
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v60 = v5;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Bill Payment Suggested Amount List from transaction history API: %@", buf, 0xCu);
  }

  -[PKBillPaymentSuggestedAmountController _populatePriorityValuesForList:](self, "_populatePriorityValuesForList:", v5);
  if (-[PKBillPaymentSuggestedAmountController _suggestedAmountListIsValidAfterPurgeIfNecessary:](self, "_suggestedAmountListIsValidAfterPurgeIfNecessary:", v5))
  {
    v42 = v5;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Bill Payment Suggested Amount List Error for transaction history API. Using fallback suggestions.", buf, 2u);
    }

    -[PKBillPaymentSuggestedAmountController _createDefaultAmountSuggestionListFromAccount](self, "_createDefaultAmountSuggestionListFromAccount");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v42;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Bill Payment Suggested Amount fallback list: %@", buf, 0xCu);
    }

    if (!-[PKBillPaymentSuggestedAmountController _suggestedAmountListIsValidAfterPurgeIfNecessary:](self, "_suggestedAmountListIsValidAfterPurgeIfNecessary:", v42))
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Bill Payment Suggested Amount List Error. Default suggestions are not valid! Please file a radar.", buf, 2u);
      }

    }
  }
  -[PKBillPaymentSuggestedAmountController _populateStringValuesForList:](self, "_populateStringValuesForList:", v42);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v60 = v42;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Final Bill Payment Suggested Amount List with titles and descriptions %@", buf, 0xCu);
  }

  return v42;
}

- (void)_generateAmountSuggestionListUsingTransactionHistoryForList:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  char v12;
  uint64_t v13;
  PKBillPaymentSuggestedAmount *v14;
  NSDecimalNumber *previousStatementPaymentsSum;
  void *v16;
  char v17;
  NSArray *previousStatementSelectedSuggestedAmountEvents;
  uint64_t v19;
  PKBillPaymentSuggestedAmount *v20;
  NSDecimalNumber *statementPurchasesSum;
  void *v22;
  char v23;
  PKBillPaymentSuggestedAmount *v24;
  NSDecimalNumber *v25;
  void *v26;
  id v27;
  void *v28;
  PKBillPaymentSuggestedAmount *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  void *v59;
  _BOOL4 v60;
  PKBillPaymentSuggestedAmount *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  PKBillPaymentSuggestedAmount *v71;
  PKBillPaymentSuggestedAmount *v72;
  PKBillPaymentSuggestedAmount *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  id v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD v98[5];
  id v99;
  uint64_t *v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t (*v105)(uint64_t, uint64_t);
  void (*v106)(uint64_t);
  id v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "accountSummary");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "currentStatement");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "remainingStatementBalance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "remainingMinimumPayment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v78 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v78 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v85, "creditLimit");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "statementBalance");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "remainingStatementBalanceForInterestCalculation");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "compare:", v9) == 1;

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    if (v82)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v82, "isEqualToNumber:", v11);

      if ((v12 & 1) == 0)
      {
        objc_msgSend(v83, "decimalNumberByDividingBy:", v82);
        v13 = objc_claimAutoreleasedReturnValue();

        v79 = (void *)v13;
      }
    }
  }
  if (objc_msgSend(v84, "isInMonthOfMerge") && objc_msgSend(v80, "pk_isPositiveNumber"))
  {
    v14 = -[PKBillPaymentSuggestedAmount initWithAmount:category:]([PKBillPaymentSuggestedAmount alloc], "initWithAmount:category:", v80, 31);
    objc_msgSend(v5, "safelyAddObject:", v14);
    objc_msgSend(v4, "addSuggestedAmount:", v14);

    goto LABEL_17;
  }
  if (self->_isMonthZero
    || self->_isMonthOne
    || (previousStatementPaymentsSum = self->_previousStatementPaymentsSum) == 0
    || (objc_msgSend(MEMORY[0x1E0CB3598], "zero"), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (v17 = -[NSDecimalNumber isEqual:](previousStatementPaymentsSum, "isEqual:", v16),
        v16,
        (v17 & 1) != 0))
  {
    -[PKBillPaymentSuggestedAmountController _zerothOrFirstMonthBillPaymentSuggestionsForList:](self, "_zerothOrFirstMonthBillPaymentSuggestionsForList:", v4);
    goto LABEL_17;
  }
  if (-[PKBillPaymentSuggestedAmountController _allMandatoryValuesAreSameAmount](self, "_allMandatoryValuesAreSameAmount"))
  {
    goto LABEL_17;
  }
  v108 = 0;
  v109 = &v108;
  v110 = 0x2020000000;
  v111 = 0;
  v102 = 0;
  v103 = &v102;
  v104 = 0x3032000000;
  v105 = __Block_byref_object_copy__64;
  v106 = __Block_byref_object_dispose__64;
  v107 = 0;
  if (v10)
  {
    previousStatementSelectedSuggestedAmountEvents = self->_previousStatementSelectedSuggestedAmountEvents;
    v98[0] = MEMORY[0x1E0C809B0];
    v98[1] = 3221225472;
    v98[2] = __102__PKBillPaymentSuggestedAmountController__generateAmountSuggestionListUsingTransactionHistoryForList___block_invoke;
    v98[3] = &unk_1E2AD7C88;
    v100 = &v108;
    v98[4] = self;
    v99 = v6;
    v101 = &v102;
    -[NSArray enumerateObjectsUsingBlock:](previousStatementSelectedSuggestedAmountEvents, "enumerateObjectsUsingBlock:", v98);

    v19 = v109[3];
  }
  else
  {
    v19 = 18;
    v111 = 18;
  }
  self->_isOnPlanCompletion = v19 == 13;
  if (self->_previousStatementPaymentsSum && !self->_isOnPaymentPlan)
  {
    v20 = -[PKBillPaymentSuggestedAmount initWithAmount:category:]([PKBillPaymentSuggestedAmount alloc], "initWithAmount:category:", self->_previousStatementPaymentsSum, 2);
    objc_msgSend(v5, "safelyAddObject:", v20);
  }
  else
  {
    v20 = 0;
  }
  statementPurchasesSum = self->_statementPurchasesSum;
  if (!statementPurchasesSum
    || (objc_msgSend(MEMORY[0x1E0CB3598], "zero"), (v22 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (v23 = -[NSDecimalNumber isEqual:](statementPurchasesSum, "isEqual:", v22), v22, (v23 & 1) != 0))
  {
    v24 = v20;
  }
  else
  {
    v25 = self->_statementPurchasesSum;
    v24 = -[PKBillPaymentSuggestedAmount initWithAmount:category:]([PKBillPaymentSuggestedAmount alloc], "initWithAmount:category:", v25, 5);

    objc_msgSend(v5, "safelyAddObject:", v24);
  }
  v96 = 0;
  v97 = 0;
  objc_msgSend(v4, "minimumSuggestedAmount");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "amount");
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = 0;
  v95 = 0;
  -[PKBillPaymentSuggestedAmountController _minimumMerchcantCategoriesAboveMinimumAmount:minMerchantCategory1:minMerchantCategory2:minMerchantCategorySum1:minMerchantCategorySum2:](self, "_minimumMerchcantCategoriesAboveMinimumAmount:minMerchantCategory1:minMerchantCategory2:minMerchantCategorySum1:minMerchantCategorySum2:", v77, &v97, &v96, &v95, &v94);
  v27 = v95;
  v74 = v94;
  v69 = v27;
  if (self->_previousStatementPaymentsSum)
  {
    if (v27)
    {
      objc_msgSend(v27, "decimalNumberByAdding:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "compare:", self->_statementPurchasesSum) == -1)
      {
        v29 = -[PKBillPaymentSuggestedAmount initWithAmount:category:]([PKBillPaymentSuggestedAmount alloc], "initWithAmount:category:", v28, 3);

        -[PKBillPaymentSuggestedAmount setMerchantCategory:](v29, "setMerchantCategory:", v97);
        objc_msgSend(v5, "safelyAddObject:", v29);
      }
      else
      {
        v29 = v24;
      }

    }
    else
    {
      v29 = v24;
    }
    if (v74)
    {
      objc_msgSend(v74, "decimalNumberByAdding:", self->_previousStatementPaymentsSum);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "compare:", self->_statementPurchasesSum) == -1)
      {
        v24 = -[PKBillPaymentSuggestedAmount initWithAmount:category:]([PKBillPaymentSuggestedAmount alloc], "initWithAmount:category:", v30, 4);

        -[PKBillPaymentSuggestedAmount setMerchantCategory:](v24, "setMerchantCategory:", v96);
        objc_msgSend(v5, "safelyAddObject:", v24);
      }
      else
      {
        v24 = v29;
      }

    }
    else
    {
      v24 = v29;
    }
  }
  if (v83 && self->_statementPurchasesSum && v79)
  {
    -[PKBillPaymentSuggestedAmountController _suggestedAmountsForPayOffDateForStatementBalance:creditUtilization:lastPaymentCategory:](self, "_suggestedAmountsForPayOffDateForStatementBalance:creditUtilization:lastPaymentCategory:", v83, v79, v109[3]);
    v31 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "safelyAddObject:", v31);
    v24 = (PKBillPaymentSuggestedAmount *)v31;
  }
  if (self->_isOnPaymentPlan)
  {
    v32 = objc_msgSend((id)v103[5], "suggestedAmountCategory");
    v33 = v109[3];
  }
  else
  {
    v33 = v109[3];
    v32 = v33;
  }
  objc_msgSend(v4, "suggestedAmountWithCategory:", v33);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKBillPaymentSuggestedAmountController _calculateThresholdForLastPaymentCategory:statementBalance:suggestedAmountWithSameCategory:](self, "_calculateThresholdForLastPaymentCategory:statementBalance:suggestedAmountWithSameCategory:", v32, v83, v68);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKBillPaymentSuggestedAmountController _filterSuggestions:belowThreshold:](self, "_filterSuggestions:belowThreshold:", v5, v76);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v83)
    goto LABEL_64;
  if (self->_statementPurchasesSum
    && (!objc_msgSend(v83, "compare:") || objc_msgSend(v83, "compare:", self->_statementPurchasesSum) == -1)
    && objc_msgSend(v82, "compare:", v83) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("2"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "decimalNumberByDividingBy:", v34);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "decimalNumberBySubtracting:", v70);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("2"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "decimalNumberByDividingBy:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "decimalNumberBySubtracting:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "decimalNumberByDividingBy:", v38);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("0.33"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v34) = objc_msgSend(v67, "compare:", v39) == -1;

    if ((_DWORD)v34)
    {
      v73 = [PKBillPaymentSuggestedAmount alloc];
      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("2"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "decimalNumberByDividingBy:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "decimalNumberBySubtracting:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("3"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "decimalNumberByDividingBy:", v45);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("2"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "decimalNumberByDividingBy:", v46);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "decimalNumberByAdding:", v65);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = -[PKBillPaymentSuggestedAmount initWithAmount:category:](v73, "initWithAmount:category:", v47, 23);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("0.67"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v67, "compare:", v40) == -1;

      v71 = [PKBillPaymentSuggestedAmount alloc];
      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("2"));
      if (v41)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "decimalNumberByDividingBy:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "decimalNumberBySubtracting:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("6"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "decimalNumberByDividingBy:", v45);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("2"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "decimalNumberByDividingBy:", v46);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "decimalNumberByAdding:", v65);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = -[PKBillPaymentSuggestedAmount initWithAmount:category:](v71, "initWithAmount:category:", v47, 24);
      }
      else
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "decimalNumberByDividingBy:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "decimalNumberBySubtracting:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("9"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "decimalNumberByDividingBy:", v45);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("2"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "decimalNumberByDividingBy:", v46);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "decimalNumberByAdding:", v65);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = -[PKBillPaymentSuggestedAmount initWithAmount:category:](v71, "initWithAmount:category:", v47, 25);
      }
    }

    objc_msgSend(v75, "safelyAddObject:", v72);
    goto LABEL_65;
  }
  if (v78
    && !-[PKBillPaymentSuggestedAmountController _categoryIsPaymentPlan:](self, "_categoryIsPaymentPlan:", v109[3]))
  {
    v61 = [PKBillPaymentSuggestedAmount alloc];
    objc_msgSend(v83, "decimalNumberByAdding:", v78);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("2"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "decimalNumberByDividingBy:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = -[PKBillPaymentSuggestedAmount initWithAmount:category:](v61, "initWithAmount:category:", v64, 29);

    objc_msgSend(v75, "safelyAddObject:", v72);
  }
  else
  {
LABEL_64:
    v72 = v24;
  }
LABEL_65:
  if (self->_currentStatementPaymentsSum)
  {
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v48 = v75;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v90, v113, 16);
    if (v49)
    {
      v50 = *(_QWORD *)v91;
      do
      {
        for (i = 0; i != v49; ++i)
        {
          if (*(_QWORD *)v91 != v50)
            objc_enumerationMutation(v48);
          v52 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
          objc_msgSend(v52, "amount");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "decimalNumberBySubtracting:", self->_currentStatementPaymentsSum);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setAmount:", v54);

        }
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v90, v113, 16);
      }
      while (v49);
    }

  }
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v5 = v75;
  v55 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v86, v112, 16);
  if (v55)
  {
    v56 = *(_QWORD *)v87;
    do
    {
      for (j = 0; j != v55; ++j)
      {
        if (*(_QWORD *)v87 != v56)
          objc_enumerationMutation(v5);
        v58 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
        objc_msgSend(v58, "amount");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "compare:", v6) == -1;

        if (v60)
          objc_msgSend(v4, "addSuggestedAmount:", v58);
      }
      v55 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v86, v112, 16);
    }
    while (v55);
  }

  -[PKBillPaymentSuggestedAmountController _setDifferentialPrivacyFeature:atIndex:](self, "_setDifferentialPrivacyFeature:atIndex:", PKBillPaymentCategoryToDifferentialFeature(v109[3]), 2);
  _Block_object_dispose(&v102, 8);

  _Block_object_dispose(&v108, 8);
LABEL_17:

}

void __102__PKBillPaymentSuggestedAmountController__generateAmountSuggestionListUsingTransactionHistoryForList___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  id v10;
  void *v11;
  id obj;

  objc_msgSend(a2, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  obj = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = obj;
  if ((isKindOfClass & 1) != 0)
  {
    v10 = obj;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v10, "suggestedAmountCategory");
    if (objc_msgSend(*(id *)(a1 + 32), "_categoryIsPaymentPlan:", objc_msgSend(v10, "suggestedAmountCategory")))
    {
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
      if (v11)
      {
        if (objc_msgSend(v11, "compare:", *(_QWORD *)(a1 + 40)) == -1)
        {
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 1;
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), obj);
          *a4 = 1;
        }
      }
    }

    v9 = obj;
  }

}

- (void)_zerothOrFirstMonthBillPaymentSuggestionsForList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  char v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  PKBillPaymentSuggestedAmount *v33;
  PKBillPaymentSuggestedAmount *v34;
  void *v35;
  void *v36;
  void *v37;
  PKBillPaymentSuggestedAmount *v38;
  PKBillPaymentSuggestedAmount *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  PKBillPaymentSuggestedAmount *v44;
  void *v45;
  void *v46;
  void *v47;
  PKBillPaymentSuggestedAmount *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  PKBillPaymentSuggestedAmount *v55;
  void *v56;
  void *v57;
  void *v58;
  PKBillPaymentSuggestedAmount *v59;
  void *v60;
  uint64_t v61;
  PKBillPaymentSuggestedAmount *v62;
  PKBillPaymentSuggestedAmount *v63;
  PKBillPaymentSuggestedAmount *v64;
  void *v65;
  uint64_t v66;
  NSDecimalNumber *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  PKBillPaymentSuggestedAmount *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  id v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentStatement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "creditLimit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjustedBalance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remainingMinimumPayment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = 0x1E0CB3000uLL;
  if (v10)
  {
    v13 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v84 = v13;

  objc_msgSend(v6, "remainingStatementBalance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v83 = v16;

  objc_msgSend(v7, "minimumDue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v86 = v19;

  objc_msgSend(v7, "statementBalance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v90 = v22;

  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v88 = v23;
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v8, "isEqualToNumber:", v24);

    if ((v25 & 1) == 0)
    {
      objc_msgSend(v9, "decimalNumberByDividingBy:", v8);
      v26 = objc_claimAutoreleasedReturnValue();

      v89 = (void *)v26;
    }
    v23 = v88;
  }
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (v90 && v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v8, "isEqualToNumber:", v27);

    if ((v28 & 1) == 0)
    {
      objc_msgSend(v90, "decimalNumberByDividingBy:", v8);
      v29 = objc_claimAutoreleasedReturnValue();

      v87 = (void *)v29;
    }
    v23 = v88;
  }
  if (!-[PKBillPaymentSuggestedAmountController _allMandatoryValuesAreSameAmount](self, "_allMandatoryValuesAreSameAmount"))
  {
    v97 = 0;
    v98 = 0;
    v95 = 0;
    v96 = 0;
    -[PKBillPaymentSuggestedAmountController _minimumMerchcantCategoriesAboveMinimumAmount:minMerchantCategory1:minMerchantCategory2:minMerchantCategorySum1:minMerchantCategorySum2:](self, "_minimumMerchcantCategoriesAboveMinimumAmount:minMerchantCategory1:minMerchantCategory2:minMerchantCategorySum1:minMerchantCategorySum2:", v84, &v98, &v97, &v96, &v95);
    v30 = v96;
    v82 = v95;
    v76 = v30;
    if (v30)
    {
      objc_msgSend(v30, "decimalNumberByAdding:", v86);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (self->_isMonthZero
        || (self->_isMonthOne || !self->_previousStatementPaymentsSum) && objc_msgSend(v31, "compare:", v83) == -1)
      {
        v33 = -[PKBillPaymentSuggestedAmount initWithAmount:category:]([PKBillPaymentSuggestedAmount alloc], "initWithAmount:category:", v32, 3);
        -[PKBillPaymentSuggestedAmount setMerchantCategory:](v33, "setMerchantCategory:", v98);
        v34 = v33;
        v12 = 0x1E0CB3000;
      }
      else
      {
        v34 = 0;
      }
      v85 = v34;
      objc_msgSend(v23, "safelyAddObject:");

    }
    else
    {
      v85 = 0;
    }
    if (v82)
    {
      objc_msgSend(v82, "decimalNumberByAdding:", v86);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (self->_isMonthZero
        || (self->_isMonthOne || !self->_previousStatementPaymentsSum) && objc_msgSend(v35, "compare:", v83) == -1)
      {
        v37 = v9;
        v38 = -[PKBillPaymentSuggestedAmount initWithAmount:category:]([PKBillPaymentSuggestedAmount alloc], "initWithAmount:category:", v36, 4);

        -[PKBillPaymentSuggestedAmount setMerchantCategory:](v38, "setMerchantCategory:", v97);
        v39 = v38;
        v9 = v37;
      }
      else
      {
        v39 = v85;
      }
      v23 = v88;
      v85 = v39;
      objc_msgSend(v88, "safelyAddObject:");

    }
    v79 = v6;
    v80 = v5;
    v77 = v8;
    v78 = v7;
    v81 = v9;
    if (v9 && self->_isMonthZero && v89)
    {
      objc_msgSend(*(id *)(v12 + 1432), "decimalNumberWithString:", CFSTR("0.33"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v89, "compare:", v40);

      if (v41 == -1)
      {
        v62 = [PKBillPaymentSuggestedAmount alloc];
        objc_msgSend(*(id *)(v12 + 1432), "decimalNumberWithString:", CFSTR("3"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "decimalNumberByDividingBy:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v62;
        v49 = v47;
        v50 = 20;
      }
      else
      {
        objc_msgSend(*(id *)(v12 + 1432), "decimalNumberWithString:", CFSTR("0.67"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v89, "compare:", v42);

        v44 = [PKBillPaymentSuggestedAmount alloc];
        v45 = *(void **)(v12 + 1432);
        if (v43 == -1)
        {
          objc_msgSend(v45, "decimalNumberWithString:", CFSTR("6"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "decimalNumberByDividingBy:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v44;
          v49 = v47;
          v50 = 21;
        }
        else
        {
          objc_msgSend(v45, "decimalNumberWithString:", CFSTR("9"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "decimalNumberByDividingBy:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v44;
          v49 = v47;
          v50 = 22;
        }
      }
      v64 = -[PKBillPaymentSuggestedAmount initWithAmount:category:](v48, "initWithAmount:category:", v49, v50);

    }
    else
    {
      if ((!v90 || !self->_isMonthOne || !v87) && self->_previousStatementPaymentsSum)
        goto LABEL_63;
      objc_msgSend(*(id *)(v12 + 1432), "decimalNumberWithString:", CFSTR("0.33"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v87, "compare:", v51);

      if (v52 == -1)
      {
        v63 = [PKBillPaymentSuggestedAmount alloc];
        objc_msgSend(*(id *)(v12 + 1432), "decimalNumberWithString:", CFSTR("3"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "decimalNumberByDividingBy:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v63;
        v60 = v58;
        v61 = 26;
      }
      else
      {
        objc_msgSend(*(id *)(v12 + 1432), "decimalNumberWithString:", CFSTR("0.67"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v87, "compare:", v53);

        v55 = [PKBillPaymentSuggestedAmount alloc];
        v56 = *(void **)(v12 + 1432);
        if (v54 == -1)
        {
          objc_msgSend(v56, "decimalNumberWithString:", CFSTR("6"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "decimalNumberByDividingBy:", v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v55;
          v60 = v58;
          v61 = 27;
        }
        else
        {
          objc_msgSend(v56, "decimalNumberWithString:", CFSTR("9"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "decimalNumberByDividingBy:", v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v55;
          v60 = v58;
          v61 = 28;
        }
      }
      v64 = -[PKBillPaymentSuggestedAmount initWithAmount:category:](v59, "initWithAmount:category:", v60, v61);

      -[PKBillPaymentSuggestedAmount amount](v64, "amount");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "compare:", v83);

      v85 = v64;
      v23 = v88;
      if (v66 != -1)
        goto LABEL_63;
    }
    objc_msgSend(v23, "safelyAddObject:", v64);
    v85 = v64;
LABEL_63:
    v67 = self->_currentStatementPaymentsSum;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v68 = v23;
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v70; ++i)
        {
          if (*(_QWORD *)v92 != v71)
            objc_enumerationMutation(v68);
          v73 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
          if (v67)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * i), "amount");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            if (!-[PKBillPaymentSuggestedAmountController _categoryIsCurrentBalanceType:](self, "_categoryIsCurrentBalanceType:", objc_msgSend(v73, "category")))
            {
              objc_msgSend(v74, "decimalNumberBySubtracting:", v67);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "setAmount:", v75);

            }
          }
          objc_msgSend(v4, "addSuggestedAmount:", v73);
        }
        v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
      }
      while (v70);
    }

    v6 = v79;
    v5 = v80;
    v8 = v77;
    v7 = v78;
    v9 = v81;
    v23 = v88;
  }

}

- (void)_populateStringValuesForList:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  PKBillPaymentSuggestedAmountMessage *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  PKBillPaymentSuggestedAmountMessage *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  PKBillPaymentSuggestedAmountMessage *v56;
  int64_t numberOfActiveInstallments;
  __CFString *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PKAccount feature](self->_account, "feature");
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(v4, "sortedSuggestedAmounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v63 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        if (self->_isOnPlanCompletion && objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "category") == 18)
        {
          -[PKBillPaymentSuggestedAmountController _planCompletionTitleString](self, "_planCompletionTitleString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setTitle:", v12);

          PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_PLAN_COMPLETION_MESSAGE"), v5, 0, v13, v14, v15, v16, v17, v62);
          v18 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[PKBillPaymentSuggestedAmountController _titleForSuggestion:](self, "_titleForSuggestion:", v11);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setTitle:", v19);

          -[PKBillPaymentSuggestedAmountController _messageForSuggestion:](self, "_messageForSuggestion:", v11);
          v18 = objc_claimAutoreleasedReturnValue();
        }
        v20 = (void *)v18;
        objc_msgSend(v11, "setMessage:", v18);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "suggestedAmountWithCategory:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initialSuggestedAmount");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v21)
  {
    v24 = objc_alloc_init(PKBillPaymentSuggestedAmountMessage);
    PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_MINIMUM_GAP_TITLE"), v5, 0, v25, v26, v27, v28, v29, v62);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBillPaymentSuggestedAmountMessage setTitle:](v24, "setTitle:", v30);

    PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_MINIMUM_GAP_MESSAGE"), v5, 0, v31, v32, v33, v34, v35, v62);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBillPaymentSuggestedAmountMessage setMessage:](v24, "setMessage:", v36);

    objc_msgSend(v4, "addSuggestedAmountGapMessage:forStartSuggestedAmount:", v24, v21);
  }
  else
  {
    if (!v22)
      goto LABEL_20;
    objc_msgSend(v4, "remainingStatementAmount");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_NO_REMAINING_MINIMUM_GAP_TITLE"), v5, 0, v38, v39, v40, v41, v42, v62);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTitle:", v43);

      PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_NO_REMAINING_MINIMUM_GAP_MESSAGE"), v5, 0, v44, v45, v46, v47, v48, v62);
    }
    else
    {
      -[PKBillPaymentSuggestedAmountController _remainingStatementBalanceGapTitleText](self, "_remainingStatementBalanceGapTitleText");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTitle:", v49);

      -[PKBillPaymentSuggestedAmountController _remainingStatementBalanceGapDescriptionText](self, "_remainingStatementBalanceGapDescriptionText");
    }
    v24 = (PKBillPaymentSuggestedAmountMessage *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMessage:", v24);
  }

LABEL_20:
  objc_msgSend(v4, "suggestedAmountWithCategory:", 18);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    v51 = objc_alloc_init(PKBillPaymentSuggestedAmountMessage);
    -[PKBillPaymentSuggestedAmountController _remainingStatementBalanceGapTitleText](self, "_remainingStatementBalanceGapTitleText");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBillPaymentSuggestedAmountMessage setTitle:](v51, "setTitle:", v52);

    -[PKBillPaymentSuggestedAmountController _remainingStatementBalanceGapDescriptionText](self, "_remainingStatementBalanceGapDescriptionText");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBillPaymentSuggestedAmountMessage setMessage:](v51, "setMessage:", v53);

    objc_msgSend(v4, "addSuggestedAmountGapMessage:forStartSuggestedAmount:", v51, v50);
  }
  -[PKAccountServiceAccountResolutionConfiguration earlyInstallmentPlan](self->_configuration, "earlyInstallmentPlan");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    objc_msgSend(v4, "suggestedAmountWithCategory:", 30);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v55)
    {
LABEL_31:

      goto LABEL_32;
    }
    v56 = objc_alloc_init(PKBillPaymentSuggestedAmountMessage);
    numberOfActiveInstallments = self->_numberOfActiveInstallments;
    if (numberOfActiveInstallments == 1)
    {
      v58 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CARD_BALANCE_GAP_ONE_INSTALLMENT_TITLE");
    }
    else
    {
      if (numberOfActiveInstallments < 2)
      {
LABEL_30:
        PKLocalizedBeekmanString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CARD_BALANCE_GAP_INSTALLMENT_MESSAGE"), 0);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKBillPaymentSuggestedAmountMessage setMessage:](v56, "setMessage:", v61);

        objc_msgSend(v4, "addSuggestedAmountGapMessage:forStartSuggestedAmount:", v56, v55);
        goto LABEL_31;
      }
      v58 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CARD_BALANCE_GAP_MULTI_INSTALLMENT_TITLE");
    }
    PKLocalizedBeekmanString(&v58->isa, 0);
    v59 = objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      v60 = (void *)v59;
      -[PKBillPaymentSuggestedAmountMessage setTitle:](v56, "setTitle:", v59);

    }
    goto LABEL_30;
  }
LABEL_32:

}

- (void)_populatePriorityValuesForList:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  BOOL v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a3, "sortedSuggestedAmounts", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
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
        v10 = objc_msgSend(v9, "category");
        if (v10 <= 0x1E && ((1 << v10) & 0x400C0002) != 0)
          objc_msgSend(v9, "setPriority:", 1000);
        if (-[PKBillPaymentSuggestedAmountController _categoryIsPaymentPlan:](self, "_categoryIsPaymentPlan:", v10))
          objc_msgSend(v9, "setPriority:", 850);
        v12 = -[PKBillPaymentSuggestedAmountController _categoryIsCurrentBalanceType:](self, "_categoryIsCurrentBalanceType:", v10);
        if (v10 - 27 < 2
          || v12
          || ((v13 = objc_msgSend(v9, "category"), v10 != 3) ? (v14 = v13 == 26) : (v14 = 1),
              v14 || objc_msgSend(v9, "category") == 4))
        {
          objc_msgSend(v9, "setPriority:", 700);
        }
        switch(v10)
        {
          case 2uLL:
            v15 = 550;
            break;
          case 0x1DuLL:
            v15 = 250;
            break;
          case 5uLL:
            v15 = 400;
            break;
          default:
            continue;
        }
        objc_msgSend(v9, "setPriority:", v15);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (BOOL)_allMandatoryValuesAreSameAmount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  char v10;
  id v11;

  -[PKAccount creditDetails](self->_account, "creditDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "adjustedBalance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remainingStatementBalance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remainingMinimumPayment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v4, "compare:", v7) == -1)
  {
    v8 = v7;

    v4 = v8;
  }
  if (v5 && objc_msgSend(v5, "compare:", v7) == -1)
  {
    v11 = v7;

    v5 = v11;
    if (!v6)
      goto LABEL_15;
  }
  else if (!v6)
  {
    goto LABEL_15;
  }
  if (objc_msgSend(v6, "compare:", v7) == -1)
  {
    v9 = v7;

    v6 = v9;
  }
  v10 = 0;
  if (v4 && v5 && v6)
  {
    if (objc_msgSend(v4, "isEqual:", v5))
    {
      v10 = objc_msgSend(v5, "isEqual:", v6);
      goto LABEL_16;
    }
LABEL_15:
    v10 = 0;
  }
LABEL_16:

  return v10;
}

- (void)_minimumMerchcantCategoriesAboveMinimumAmount:(id)a3 minMerchantCategory1:(int64_t *)a4 minMerchantCategory2:(int64_t *)a5 minMerchantCategorySum1:(id *)a6 minMerchantCategorySum2:(id *)a7
{
  id v12;
  void *v13;
  NSDictionary *merchantCategoryTransactionSums;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v12 = a3;
  v13 = v12;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__64;
  v31 = __Block_byref_object_dispose__64;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__64;
  v25 = __Block_byref_object_dispose__64;
  v26 = 0;
  if (v12)
  {
    merchantCategoryTransactionSums = self->_merchantCategoryTransactionSums;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __178__PKBillPaymentSuggestedAmountController__minimumMerchcantCategoriesAboveMinimumAmount_minMerchantCategory1_minMerchantCategory2_minMerchantCategorySum1_minMerchantCategorySum2___block_invoke;
    v15[3] = &unk_1E2AD7CB0;
    v16 = v12;
    v17 = &v27;
    v18 = &v37;
    v19 = &v21;
    v20 = &v33;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](merchantCategoryTransactionSums, "enumerateKeysAndObjectsUsingBlock:", v15);

  }
  if (a4)
    *a4 = v38[3];
  if (a5)
    *a5 = v34[3];
  if (a6)
    *a6 = objc_retainAutorelease((id)v28[5]);
  if (a7)
    *a7 = objc_retainAutorelease((id)v22[5]);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

}

void __178__PKBillPaymentSuggestedAmountController__minimumMerchcantCategoriesAboveMinimumAmount_minMerchantCategory1_minMerchantCategory2_minMerchantCategorySum1_minMerchantCategorySum2___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "compare:", a1[4]) == 1)
  {
    v6 = *(_QWORD *)(a1[5] + 8);
    v8 = *(_QWORD *)(v6 + 40);
    v7 = (id *)(v6 + 40);
    if (!v8)
    {
LABEL_8:
      objc_storeStrong(v7, a3);
      v12 = objc_msgSend(v14, "integerValue");
      v13 = a1[6];
LABEL_11:
      *(_QWORD *)(*(_QWORD *)(v13 + 8) + 24) = v12;
      goto LABEL_12;
    }
    v9 = *(_QWORD *)(a1[7] + 8);
    v11 = *(_QWORD *)(v9 + 40);
    v10 = (id *)(v9 + 40);
    if (!v11)
    {
LABEL_10:
      objc_storeStrong(v10, a3);
      v12 = objc_msgSend(v14, "integerValue");
      v13 = a1[8];
      goto LABEL_11;
    }
    if (objc_msgSend(v5, "compare:") == -1
      || objc_msgSend(v5, "compare:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40)) == -1)
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "compare:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40)) != -1)
      {
        v7 = (id *)(*(_QWORD *)(a1[5] + 8) + 40);
        goto LABEL_8;
      }
      v10 = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
      goto LABEL_10;
    }
  }
LABEL_12:

}

- (id)_suggestedAmountsForPayOffDateForStatementBalance:(id)a3 creditUtilization:(id)a4 lastPaymentCategory:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  PKBillPaymentSuggestedAmount *v11;
  PKBillPaymentSuggestedAmount *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PKBillPaymentSuggestedAmount *v17;
  void *v18;
  uint64_t v19;
  PKBillPaymentSuggestedAmount *v20;
  PKBillPaymentSuggestedAmount *v21;
  PKBillPaymentSuggestedAmount *v22;
  PKBillPaymentSuggestedAmount *v23;
  PKBillPaymentSuggestedAmount *v24;
  PKBillPaymentSuggestedAmount *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  PKBillPaymentSuggestedAmount *v30;
  PKBillPaymentSuggestedAmount *v31;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  if (v8 && v9 && self->_statementPurchasesSum)
  {
    switch(a5)
    {
      case 6uLL:
      case 0xEuLL:
      case 0x19uLL:
        v12 = [PKBillPaymentSuggestedAmount alloc];
        objc_msgSend(v8, "decimalNumberBySubtracting:", self->_statementPurchasesSum);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("8"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "decimalNumberByDividingBy:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "decimalNumberByAdding:", self->_statementPurchasesSum);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v12;
        v18 = v16;
        v19 = 7;
        goto LABEL_18;
      case 7uLL:
        v22 = [PKBillPaymentSuggestedAmount alloc];
        objc_msgSend(v8, "decimalNumberBySubtracting:", self->_statementPurchasesSum);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("7"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "decimalNumberByDividingBy:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "decimalNumberByAdding:", self->_statementPurchasesSum);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v22;
        v18 = v16;
        v19 = 8;
        goto LABEL_18;
      case 8uLL:
        v23 = [PKBillPaymentSuggestedAmount alloc];
        objc_msgSend(v8, "decimalNumberBySubtracting:", self->_statementPurchasesSum);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("6"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "decimalNumberByDividingBy:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "decimalNumberByAdding:", self->_statementPurchasesSum);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v23;
        v18 = v16;
        v19 = 9;
        goto LABEL_18;
      case 9uLL:
      case 0xFuLL:
      case 0x18uLL:
        v20 = [PKBillPaymentSuggestedAmount alloc];
        objc_msgSend(v8, "decimalNumberBySubtracting:", self->_statementPurchasesSum);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("5"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "decimalNumberByDividingBy:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "decimalNumberByAdding:", self->_statementPurchasesSum);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v20;
        v18 = v16;
        v19 = 10;
        goto LABEL_18;
      case 0xAuLL:
        v24 = [PKBillPaymentSuggestedAmount alloc];
        objc_msgSend(v8, "decimalNumberBySubtracting:", self->_statementPurchasesSum);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("4"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "decimalNumberByDividingBy:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "decimalNumberByAdding:", self->_statementPurchasesSum);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v24;
        v18 = v16;
        v19 = 11;
        goto LABEL_18;
      case 0xBuLL:
        v25 = [PKBillPaymentSuggestedAmount alloc];
        objc_msgSend(v8, "decimalNumberBySubtracting:", self->_statementPurchasesSum);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("3"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "decimalNumberByDividingBy:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "decimalNumberByAdding:", self->_statementPurchasesSum);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v25;
        v18 = v16;
        v19 = 12;
        goto LABEL_18;
      case 0xCuLL:
      case 0x10uLL:
      case 0x17uLL:
        v21 = [PKBillPaymentSuggestedAmount alloc];
        objc_msgSend(v8, "decimalNumberBySubtracting:", self->_statementPurchasesSum);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("2"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "decimalNumberByDividingBy:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "decimalNumberByAdding:", self->_statementPurchasesSum);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v21;
        v18 = v16;
        v19 = 13;
        goto LABEL_18;
      case 0xDuLL:
        v11 = -[PKBillPaymentSuggestedAmount initWithAmount:category:]([PKBillPaymentSuggestedAmount alloc], "initWithAmount:category:", v8, 17);
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("0.33"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v10, "compare:", v26);

        if (v27 == -1)
        {
          v31 = [PKBillPaymentSuggestedAmount alloc];
          objc_msgSend(v8, "decimalNumberBySubtracting:", self->_statementPurchasesSum);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("3"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "decimalNumberByDividingBy:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "decimalNumberByAdding:", self->_statementPurchasesSum);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v31;
          v18 = v16;
          v19 = 16;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("0.67"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v10, "compare:", v28);

          v30 = [PKBillPaymentSuggestedAmount alloc];
          objc_msgSend(v8, "decimalNumberBySubtracting:", self->_statementPurchasesSum);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29 == -1)
          {
            objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("6"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "decimalNumberByDividingBy:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "decimalNumberByAdding:", self->_statementPurchasesSum);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v30;
            v18 = v16;
            v19 = 15;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("9"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "decimalNumberByDividingBy:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "decimalNumberByAdding:", self->_statementPurchasesSum);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v30;
            v18 = v16;
            v19 = 14;
          }
        }
LABEL_18:
        v11 = -[PKBillPaymentSuggestedAmount initWithAmount:category:](v17, "initWithAmount:category:", v18, v19);

        break;
    }
  }

  return v11;
}

- (id)_calculateThresholdForLastPaymentCategory:(unint64_t)a3 statementBalance:(id)a4 suggestedAmountWithSameCategory:(id)a5
{
  id v8;
  id v9;
  NSDecimalNumber *previousStatementPaymentsSum;
  NSDecimalNumber *v11;
  NSDecimalNumber *v12;
  void *v13;
  const __CFString *v14;
  NSDecimalNumber *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v8 = a4;
  v9 = a5;
  previousStatementPaymentsSum = self->_previousStatementPaymentsSum;
  if (previousStatementPaymentsSum)
  {
    v11 = previousStatementPaymentsSum;
    switch(a3)
    {
      case 0uLL:
        v15 = self->_previousStatementPaymentsSum;
        goto LABEL_18;
      case 6uLL:
      case 0xEuLL:
      case 0x19uLL:
        objc_msgSend(v8, "decimalNumberBySubtracting:", self->_statementPurchasesSum);
        v12 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB3598];
        v14 = CFSTR("8");
        goto LABEL_14;
      case 7uLL:
        objc_msgSend(v8, "decimalNumberBySubtracting:", self->_statementPurchasesSum);
        v12 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB3598];
        v14 = CFSTR("7");
        goto LABEL_14;
      case 8uLL:
        objc_msgSend(v8, "decimalNumberBySubtracting:", self->_statementPurchasesSum);
        v12 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB3598];
        v14 = CFSTR("6");
        goto LABEL_14;
      case 9uLL:
      case 0xFuLL:
      case 0x18uLL:
        objc_msgSend(v8, "decimalNumberBySubtracting:", self->_statementPurchasesSum);
        v12 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB3598];
        v14 = CFSTR("5");
        goto LABEL_14;
      case 0xAuLL:
        objc_msgSend(v8, "decimalNumberBySubtracting:", self->_statementPurchasesSum);
        v12 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB3598];
        v14 = CFSTR("4");
        goto LABEL_14;
      case 0xBuLL:
        objc_msgSend(v8, "decimalNumberBySubtracting:", self->_statementPurchasesSum);
        v12 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB3598];
        v14 = CFSTR("3");
        goto LABEL_14;
      case 0xCuLL:
      case 0x10uLL:
      case 0x17uLL:
        objc_msgSend(v8, "decimalNumberBySubtracting:", self->_statementPurchasesSum);
        v12 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB3598];
        v14 = CFSTR("2");
LABEL_14:
        objc_msgSend(v13, "decimalNumberWithString:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDecimalNumber decimalNumberByDividingBy:](v12, "decimalNumberByDividingBy:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "decimalNumberByAdding:", self->_statementPurchasesSum);
        v20 = objc_claimAutoreleasedReturnValue();

        v11 = v12;
        goto LABEL_15;
      case 0xDuLL:
        v15 = (NSDecimalNumber *)v8;
        goto LABEL_18;
      default:
        objc_msgSend(v9, "amount");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "compare:", self->_previousStatementPaymentsSum);

        if (v17 != 1)
          break;
        objc_msgSend(v9, "amount");
        v15 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
LABEL_18:
        v20 = (uint64_t)v15;
LABEL_15:

        v11 = (NSDecimalNumber *)v20;
        break;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_suggestedAmountListIsValidAfterPurgeIfNecessary:(id)a3
{
  __CFString *v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  unint64_t v12;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v12 = 0;
  v4 = -[__CFString isValidWithUnableReason:](v3, "isValidWithUnableReason:", &v12);
  PKLogFacilityTypeGetObject(0xEuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    PKBillPaymentSuggestedAmountListUnableReasonToString(v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Generated bill payment suggested amount list is valid %@ with unable reason: \"%@\", buf, 0x16u);

  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v3;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Generated bill payment suggested amount list: %@", buf, 0xCu);
  }

  if ((v4 & 1) != 0)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Trying to purge any invalid suggestion amounts from list...", buf, 2u);
    }

    -[__CFString attemptToPurgeInvalidSuggestedAmounts](v3, "attemptToPurgeInvalidSuggestedAmounts");
    v8 = -[__CFString isValidWithUnableReason:](v3, "isValidWithUnableReason:", &v12);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v8)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      PKBillPaymentSuggestedAmountListUnableReasonToString(v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Generated bill payment suggested amount list is valid %@ with unable reason: \"%@\", buf, 0x16u);

    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v3;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "New generated bill payment suggested amount list: %@", buf, 0xCu);
    }

  }
  return v8;
}

- (BOOL)_categoryIsPaymentPlan:(unint64_t)a3
{
  return (a3 < 0x1A) & (0x383FFC0u >> a3);
}

- (BOOL)_categoryIsCurrentBalanceType:(unint64_t)a3
{
  return a3 - 20 < 3;
}

- (id)_titleForSuggestion:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  void *v70;
  __CFString *v71;
  _BOOL4 isMonthOne;
  const __CFString *v73;
  const __CFString *v74;
  int64_t numberOfActiveInstallments;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  BOOL v83;
  __CFString *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  _BOOL4 v94;
  uint64_t v95;
  void *v96;
  __CFString *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  __CFString *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  int64_t v108;
  _BOOL4 v109;
  void *v110;
  void *v111;
  int v112;
  int v113;
  void *v114;
  uint64_t v115;

  v4 = a3;
  v5 = objc_msgSend(v4, "category");
  v6 = -[PKAccount feature](self->_account, "feature");
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountSummary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentStatement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "balanceSummary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_currentStatementIsLastMonthsStatement)
  {
    objc_msgSend(v9, "closingDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  switch(v5)
  {
    case 1:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_MINIMUM_TITLE");
      goto LABEL_54;
    case 2:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_TITLE");
      goto LABEL_54;
    case 3:
      v19 = objc_msgSend(v4, "merchantCategory");
      PKLocalizedBillPaymentStringFromMerchantCategory(v19, v20, v21, v22, v23, v24, v25, v26);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_isMonthZero)
      {
        v33 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY1_MONTH_ZERO_TITLE");
        goto LABEL_72;
      }
      isMonthOne = self->_isMonthOne;
      v73 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY1_MONTH_ONE_TITLE");
      v74 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY1_TITLE");
      goto LABEL_69;
    case 4:
      v34 = objc_msgSend(v4, "merchantCategory");
      PKLocalizedBillPaymentStringFromMerchantCategory(v34, v35, v36, v37, v38, v39, v40, v41);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_isMonthZero)
      {
        v33 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY2_MONTH_ZERO_TITLE");
      }
      else
      {
        isMonthOne = self->_isMonthOne;
        v73 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY2_MONTH_ONE_TITLE");
        v74 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY2_TITLE");
LABEL_69:
        if (isMonthOne)
          v33 = (__CFString *)v73;
        else
          v33 = (__CFString *)v74;
      }
LABEL_72:
      PKLocalizedFeatureString(v33, v6, CFSTR("%@"), v27, v28, v29, v30, v31, (uint64_t)v32);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_127;
    case 5:
      if (v16)
      {
        -[NSDateFormatter stringFromDate:](self->_monthFormatter, "stringFromDate:", v16);
        v42 = objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          v43 = (void *)v42;
          PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_NEW_PURCHASES_TITLE"), v6, CFSTR("%@"), v10, v11, v12, v13, v14, v42);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_122;
        }
      }
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_NEW_PURCHASES_NO_DATE_TITLE");
LABEL_54:
      PKLocalizedFeatureString(v17, v6, 0, v10, v11, v12, v13, v14, v105);
      v44 = objc_claimAutoreleasedReturnValue();
LABEL_55:
      v18 = (void *)v44;
      goto LABEL_56;
    case 6:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_NINE_MONTHS_TITLE");
      goto LABEL_54;
    case 7:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_EIGHT_MONTHS_TITLE");
      goto LABEL_54;
    case 8:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_SEVEN_MONTHS_TITLE");
      goto LABEL_54;
    case 9:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_SIX_MONTHS_TITLE");
      goto LABEL_54;
    case 10:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_FIVE_MONTHS_TITLE");
      goto LABEL_54;
    case 11:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_FOUR_MONTHS_TITLE");
      goto LABEL_54;
    case 12:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_THREE_MONTHS_TITLE");
      goto LABEL_54;
    case 13:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_TWO_MONTHS_TITLE");
      goto LABEL_54;
    case 14:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_NINE_MONTHS_FROM_UTILIZATION_TITLE");
      goto LABEL_54;
    case 15:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_SIX_MONTHS_FROM_UTILIZATION_TITLE");
      goto LABEL_54;
    case 16:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_THREE_MONTHS_FROM_UTILIZATION_TITLE");
      goto LABEL_54;
    case 17:
      -[PKBillPaymentSuggestedAmountController _planCompletionTitleString](self, "_planCompletionTitleString");
      v44 = objc_claimAutoreleasedReturnValue();
      goto LABEL_55;
    case 18:
      -[PKBillPaymentSuggestedAmountController _remainingStatementBalanceTitleString](self, "_remainingStatementBalanceTitleString");
      v44 = objc_claimAutoreleasedReturnValue();
      goto LABEL_55;
    case 19:
      v45 = objc_msgSend(v8, "inGrace");
      objc_msgSend(v15, "pendingPurchases");
      v46 = objc_claimAutoreleasedReturnValue();
      v107 = (void *)v46;
      v112 = v45;
      if (v46)
      {
        v47 = (void *)v46;
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = objc_msgSend(v47, "compare:", v48) == 1;

      }
      else
      {
        v109 = 0;
      }
      numberOfActiveInstallments = self->_numberOfActiveInstallments;
      -[PKAccountServiceAccountResolutionConfiguration earlyInstallmentPlan](self->_configuration, "earlyInstallmentPlan");
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      if (v112)
      {
        v83 = numberOfActiveInstallments < 1 || v76 == 0;
        if (v109)
        {
          if (v83)
          {
            v84 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_TITLE_PENDING");
LABEL_104:
            PKLocalizedFeatureString(v84, v6, 0, v77, v78, v79, v80, v81, v105);
            v98 = objc_claimAutoreleasedReturnValue();
LABEL_111:
            v18 = (void *)v98;
            v32 = v107;
            goto LABEL_127;
          }
          v97 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_TOTAL_BALANCE_TITLE_PENDING_INSTALLMENT");
LABEL_110:
          PKLocalizedBeekmanString(&v97->isa, 0);
          v98 = objc_claimAutoreleasedReturnValue();
          goto LABEL_111;
        }
        if (v83)
        {
LABEL_103:
          v84 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_TITLE");
          goto LABEL_104;
        }
LABEL_102:
        v97 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_TOTAL_BALANCE_TITLE_INSTALLMENT");
        goto LABEL_110;
      }
      v115 = numberOfActiveInstallments;
      if (!v109)
      {
        if (numberOfActiveInstallments < 1 || !v76)
          goto LABEL_103;
        goto LABEL_102;
      }
      objc_msgSend(v8, "remainingStatementBalance");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "adjustedBalance");
      v86 = objc_claimAutoreleasedReturnValue();
      v111 = v85;
      v106 = (void *)v86;
      if (!v85 || !v86)
      {
        v32 = v107;
        if (v115 < 1 || !v76)
          goto LABEL_118;
        goto LABEL_114;
      }
      v92 = objc_msgSend(v85, "isEqual:", v86);
      v94 = v115 < 1 || v76 == 0;
      if (!v92 || !v94)
      {
        v32 = v107;
        if (v94)
        {
LABEL_118:
          v104 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_TITLE_PENDING_REVOLVER");
          goto LABEL_124;
        }
LABEL_114:
        PKLocalizedBeekmanString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_TOTAL_BALANCE_TITLE_PENDING_INSTALLMENT"), 0);
        v101 = objc_claimAutoreleasedReturnValue();
        goto LABEL_125;
      }
      v32 = v107;
      if (v16)
      {
        -[NSDateFormatter stringFromDate:](self->_monthFormatter, "stringFromDate:", v16);
        v95 = objc_claimAutoreleasedReturnValue();
        if (v95)
        {
          v96 = (void *)v95;
          PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_DATE_TITLE"), v6, CFSTR("%@"), v87, v88, v89, v90, v91, v95);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_126;
        }
      }
      v104 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_TITLE");
LABEL_124:
      PKLocalizedFeatureString(v104, v6, 0, v87, v88, v89, v90, v91, v105);
      v101 = objc_claimAutoreleasedReturnValue();
LABEL_125:
      v18 = (void *)v101;
LABEL_126:

LABEL_127:
LABEL_56:

      return v18;
    case 20:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_THIRD_TITLE");
      goto LABEL_54;
    case 21:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_SIXTH_TITLE");
      goto LABEL_54;
    case 22:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_NINTH_TITLE");
      goto LABEL_54;
    case 23:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_THREE_MONTHS_FOR_TRANSACTOR_TITLE");
      goto LABEL_54;
    case 24:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_SIX_MONTHS_FOR_TRANSACTOR_TITLE");
      goto LABEL_54;
    case 25:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_NINE_MONTHS_FOR_TRANSACTOR_TITLE");
      goto LABEL_54;
    case 26:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_THIRD_STATEMENT_BALANCE_TITLE");
      goto LABEL_54;
    case 27:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_SIXTH_STATEMENT_BALANCE_TITLE");
      goto LABEL_54;
    case 28:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_NINTH_STATEMENT_BALANCE_TITLE");
      goto LABEL_54;
    case 29:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_AVERAGE_OF_MINIMUM_AND_STATEMENT_BALANCE_TITLE");
      goto LABEL_54;
    case 30:
      v49 = objc_msgSend(v8, "inGrace");
      objc_msgSend(v15, "pendingPurchases");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = v50;
      v113 = v49;
      if (v50)
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v50) = objc_msgSend(v50, "compare:", v51) == 1;

      }
      v108 = self->_numberOfActiveInstallments;
      -[PKAccountServiceAccountResolutionConfiguration earlyInstallmentPlan](self->_configuration, "earlyInstallmentPlan");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v113)
      {
        if ((_DWORD)v50)
        {
          if (v108 >= 1 && v52)
          {
            PKLocalizedBeekmanString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CARD_BALANCE_TITLE_PENDING_INSTALLMENT"), 0);
            v58 = objc_claimAutoreleasedReturnValue();
LABEL_66:
            v18 = (void *)v58;
            v43 = v110;
            goto LABEL_122;
          }
          v71 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_TITLE_PENDING");
LABEL_65:
          PKLocalizedFeatureString(v71, v6, 0, v53, v54, v55, v56, v57, v105);
          v58 = objc_claimAutoreleasedReturnValue();
          goto LABEL_66;
        }
      }
      else if ((_DWORD)v50)
      {
        objc_msgSend(v8, "remainingStatementBalance");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "adjustedBalance");
        v61 = objc_claimAutoreleasedReturnValue();
        v67 = v61;
        if (v60 && v61 && (v114 = (void *)v61, v68 = objc_msgSend(v60, "isEqual:", v61), v67 = (uint64_t)v114, v68))
        {
          if (v16
            && (-[NSDateFormatter stringFromDate:](self->_monthFormatter, "stringFromDate:", v16),
                (v69 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v70 = (void *)v69;
            PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_DATE_TITLE"), v6, CFSTR("%@"), v62, v63, v64, v65, v66, v69);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_TITLE"), v6, 0, v62, v63, v64, v65, v66, v105);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v43 = v110;
          v103 = v114;
        }
        else
        {
          if (v108 >= 1 && v52)
          {
            v99 = (void *)v67;
            PKLocalizedBeekmanString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CARD_BALANCE_TITLE_PENDING_INSTALLMENT"), 0);
            v100 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v102 = v6;
            v99 = (void *)v67;
            PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_TITLE_PENDING_REVOLVER"), v102, 0, v62, v63, v64, v65, v66, v105);
            v100 = objc_claimAutoreleasedReturnValue();
          }
          v103 = v99;
          v18 = (void *)v100;
          v43 = v110;
        }

LABEL_122:
        goto LABEL_56;
      }
      v71 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_TITLE");
      goto LABEL_65;
    case 31:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_COMBINED_BALANCE_TITLE");
      goto LABEL_54;
    case 32:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_VERY_EXPENSIVE_PURCHASE_TITLE");
      goto LABEL_54;
    case 33:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_RECURRING_EXPENSES_TITLE");
      goto LABEL_54;
    case 34:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_TOP_MERCHANT_TITLE");
      goto LABEL_54;
    case 35:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_RECENT_TRIP_TITLE");
      goto LABEL_54;
    case 36:
      v17 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PEAK_SPEND_DAY_TITLE");
      goto LABEL_54;
    default:
      v18 = 0;
      goto LABEL_56;
  }
}

- (id)_messageForSuggestion:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  int64_t numberOfActiveInstallments;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  char v58;
  __CFString *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  int v71;
  _BOOL4 v73;
  __CFString *v74;
  void *v75;
  uint64_t v76;
  int64_t numberOfActiveStatementedInstallments;
  __CFString *v78;
  _BOOL4 isMonthOne;
  const __CFString *v80;
  const __CFString *v81;
  __CFString *v82;
  uint64_t v83;
  uint64_t v84;
  int64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  __CFString *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  _BOOL4 v104;
  int v105;
  void *v106;
  void *v107;
  void *v108;
  int v109;
  void *v110;
  void *v111;

  v4 = a3;
  v5 = -[PKAccount feature](self->_account, "feature");
  v6 = objc_msgSend(v4, "category");
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountSummary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "balanceSummary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentStatement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10;
  if (self->_currentStatementIsLastMonthsStatement)
  {
    objc_msgSend(v10, "closingDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  switch(v6)
  {
    case 0:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_NONE_MESSAGE");
      goto LABEL_77;
    case 1:
      objc_msgSend(v8, "pastDueAmount");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "cyclesPastDue") > 0
        || v19
        && (objc_msgSend(MEMORY[0x1E0CB3598], "zero"),
            v75 = (void *)objc_claimAutoreleasedReturnValue(),
            v111 = v19,
            v76 = objc_msgSend(v19, "compare:", v75),
            v75,
            v57 = v76 == 1,
            v19 = v111,
            v57))
      {
        if (v17)
        {
          -[NSDateFormatter stringFromDate:](self->_monthFormatter, "stringFromDate:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = 0;
        }
        if (objc_msgSend(v20, "length"))
          PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_MINIMUM_PAST_DUE_MESSAGE"), v5, CFSTR("%@"), v87, v88, v89, v90, v91, (uint64_t)v20);
        else
          PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_MINIMUM_PAST_DUE_NO_DATE_MESSAGE"), v5, 0, v87, v88, v89, v90, v91, v103);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        numberOfActiveStatementedInstallments = self->_numberOfActiveStatementedInstallments;
        if (numberOfActiveStatementedInstallments == 1)
        {
          v78 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_MINIMUM_ONE_INSTALLMENT_MESSAGE");
LABEL_129:
          PKLocalizedBeekmanString(&v78->isa, 0);
          v84 = objc_claimAutoreleasedReturnValue();
          goto LABEL_103;
        }
        if (numberOfActiveStatementedInstallments >= 2)
        {
          v78 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_MINIMUM_MULTI_INSTALLMENT_MESSAGE");
          goto LABEL_129;
        }
        v22 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_MINIMUM_MESSAGE");
LABEL_141:
        v83 = v5;
        v82 = 0;
LABEL_102:
        PKLocalizedFeatureString(v22, v83, v82, v11, v12, v13, v14, v15, v103);
        v84 = objc_claimAutoreleasedReturnValue();
LABEL_103:
        v46 = (void *)v84;
      }
LABEL_104:

      goto LABEL_79;
    case 2:
      if (v17)
      {
        -[NSDateFormatter stringFromDate:](self->_monthFormatter, "stringFromDate:", v17);
        v21 = objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v19 = (void *)v21;
          v22 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_MESSAGE");
          goto LABEL_101;
        }
      }
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_NO_DATE_MESSAGE");
      goto LABEL_77;
    case 3:
      v23 = objc_msgSend(v4, "merchantCategory");
      PKLocalizedBillPaymentStringFromMerchantCategory(v23, v24, v25, v26, v27, v28, v29, v30);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_isMonthZero)
      {
        v22 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY1_MONTH_ZERO_MESSAGE");
        goto LABEL_101;
      }
      isMonthOne = self->_isMonthOne;
      v80 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY1_MONTH_ONE_MESSAGE");
      v81 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY1_MESSAGE");
      goto LABEL_98;
    case 4:
      v31 = objc_msgSend(v4, "merchantCategory");
      PKLocalizedBillPaymentStringFromMerchantCategory(v31, v32, v33, v34, v35, v36, v37, v38);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_isMonthZero)
      {
        v22 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY2_MONTH_ZERO_MESSAGE");
      }
      else
      {
        isMonthOne = self->_isMonthOne;
        v80 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY2_MONTH_ONE_MESSAGE");
        v81 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_LAST_PAYMENT_PLUS_MERCHANT_CATEGORY2_MESSAGE");
LABEL_98:
        if (isMonthOne)
          v22 = (__CFString *)v80;
        else
          v22 = (__CFString *)v81;
      }
      goto LABEL_101;
    case 5:
      if (v17)
      {
        -[NSDateFormatter stringFromDate:](self->_monthFormatter, "stringFromDate:", v17);
        v39 = objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          v19 = (void *)v39;
          v22 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_NEW_PURCHASES_MESSAGE");
          goto LABEL_101;
        }
      }
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_NEW_PURCHASES_MESSAGE_NO_DATE");
      goto LABEL_77;
    case 6:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_NINE_MONTHS_MESSAGE");
      goto LABEL_77;
    case 7:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_EIGHT_MONTHS_MESSAGE");
      goto LABEL_77;
    case 8:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_SEVEN_MONTHS_MESSAGE");
      goto LABEL_77;
    case 9:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_SIX_MONTHS_MESSAGE");
      goto LABEL_77;
    case 10:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_FIVE_MONTHS_MESSAGE");
      goto LABEL_77;
    case 11:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_FOUR_MONTHS_MESSAGE");
      goto LABEL_77;
    case 12:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_THREE_MONTHS_MESSAGE");
      goto LABEL_77;
    case 13:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_TWO_MONTHS_MESSAGE");
      goto LABEL_77;
    case 14:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_NINE_MONTHS_FROM_UTILIZATION_MESSAGE");
      goto LABEL_77;
    case 15:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_SIX_MONTHS_FROM_UTILIZATION_MESSAGE");
      goto LABEL_77;
    case 16:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_THREE_MONTHS_FROM_UTILIZATION_MESSAGE");
      goto LABEL_77;
    case 17:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_PLAN_COMPLETION_MESSAGE");
      goto LABEL_77;
    case 18:
      -[PKBillPaymentSuggestedAmountController _remainingStatementBalanceMessageString](self, "_remainingStatementBalanceMessageString");
      v40 = objc_claimAutoreleasedReturnValue();
      goto LABEL_78;
    case 19:
      v47 = objc_msgSend(v8, "inGrace");
      objc_msgSend(v9, "pendingPurchases");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = v48;
      v109 = v47;
      if (v48)
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v48) = objc_msgSend(v48, "compare:", v49) == 1;

      }
      numberOfActiveInstallments = self->_numberOfActiveInstallments;
      -[PKAccountServiceAccountResolutionConfiguration earlyInstallmentPlan](self->_configuration, "earlyInstallmentPlan");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v109)
      {
        v57 = numberOfActiveInstallments < 1 || v51 == 0;
        v58 = v57;
        if ((_DWORD)v48)
        {
          if ((v58 & 1) != 0)
          {
            v59 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_MESSAGE_TRANSACTOR_PENDING");
LABEL_136:
            PKLocalizedFeatureString(v59, v5, 0, v52, v53, v54, v55, v56, v103);
            v101 = objc_claimAutoreleasedReturnValue();
            goto LABEL_137;
          }
        }
        else if ((v58 & 1) != 0)
        {
          v59 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_MESSAGE_TRANSACTOR");
          goto LABEL_136;
        }
LABEL_126:
        PKLocalizedBeekmanString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_TOTAL_BALANCE_MESSAGE_INSTALLMENT"), 0);
        v101 = objc_claimAutoreleasedReturnValue();
LABEL_137:
        v46 = (void *)v101;
        goto LABEL_146;
      }
      if (!(_DWORD)v48)
      {
        if (numberOfActiveInstallments < 1 || !v51)
        {
          v59 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_MESSAGE_REVOLVER");
          goto LABEL_136;
        }
        goto LABEL_126;
      }
      objc_msgSend(v8, "remainingStatementBalance");
      v63 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "adjustedBalance");
      v64 = objc_claimAutoreleasedReturnValue();
      v110 = (void *)v63;
      if (!v63 || !v64)
      {
        v70 = (void *)v64;
        if (numberOfActiveInstallments < 1 || !v51)
          goto LABEL_143;
        goto LABEL_134;
      }
      v70 = (void *)v64;
      v71 = objc_msgSend(v110, "isEqual:", v64);
      v73 = numberOfActiveInstallments < 1 || v51 == 0;
      if (!v71 || !v73)
      {
        if (v73)
        {
LABEL_143:
          v74 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_MESSAGE_REVOLVER_PENDING");
          goto LABEL_144;
        }
LABEL_134:
        PKLocalizedBeekmanString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_TOTAL_BALANCE_MESSAGE_INSTALLMENT"), 0);
        v102 = objc_claimAutoreleasedReturnValue();
        goto LABEL_145;
      }
      v74 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_MESSAGE_REVOLVER_PENDING_STATMENT_BALANCE_SAME");
LABEL_144:
      PKLocalizedFeatureString(v74, v5, 0, v65, v66, v67, v68, v69, v103);
      v102 = objc_claimAutoreleasedReturnValue();
LABEL_145:
      v46 = (void *)v102;

LABEL_146:
LABEL_79:

      return v46;
    case 20:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_THIRD_MESSAGE");
      goto LABEL_77;
    case 21:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_SIXTH_MESSAGE");
      goto LABEL_77;
    case 22:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_NINTH_MESSAGE");
      goto LABEL_77;
    case 23:
      if (v17)
      {
        -[NSDateFormatter stringFromDate:](self->_monthFormatter, "stringFromDate:", v17);
        v60 = objc_claimAutoreleasedReturnValue();
        if (v60)
        {
          v19 = (void *)v60;
          v22 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_THREE_MONTHS_FOR_TRANSACTOR_DATE_MESSAGE");
          goto LABEL_101;
        }
      }
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_THREE_MONTHS_FOR_TRANSACTOR_MESSAGE");
      goto LABEL_77;
    case 24:
      if (v17)
      {
        -[NSDateFormatter stringFromDate:](self->_monthFormatter, "stringFromDate:", v17);
        v41 = objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          v19 = (void *)v41;
          v22 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_SIX_MONTHS_FOR_TRANSACTOR_DATE_MESSAGE");
          goto LABEL_101;
        }
      }
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_SIX_MONTHS_FOR_TRANSACTOR_MESSAGE");
      goto LABEL_77;
    case 25:
      if (v17)
      {
        -[NSDateFormatter stringFromDate:](self->_monthFormatter, "stringFromDate:", v17);
        v42 = objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          v19 = (void *)v42;
          v22 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_NINE_MONTHS_FOR_TRANSACTOR_DATE_MESSAGE");
          goto LABEL_101;
        }
      }
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_NINE_MONTHS_FOR_TRANSACTOR_MESSAGE");
      goto LABEL_77;
    case 26:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_THIRD_STATEMENT_BALANCE_MESSAGE");
      goto LABEL_77;
    case 27:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_SIXTH_STATEMENT_BALANCE_MESSAGE");
      goto LABEL_77;
    case 28:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_ONE_NINTH_STATEMENT_BALANCE_MESSAGE");
      goto LABEL_77;
    case 29:
      if (v17)
      {
        -[NSDateFormatter stringFromDate:](self->_monthFormatter, "stringFromDate:", v17);
        v61 = objc_claimAutoreleasedReturnValue();
        if (v61)
        {
          v19 = (void *)v61;
          v22 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_AVERAGE_OF_MINIMUM_AND_STATEMENT_BALANCE_DATE_MESSAGE");
LABEL_101:
          v103 = (uint64_t)v19;
          v82 = CFSTR("%@");
          v83 = v5;
          goto LABEL_102;
        }
      }
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_AVERAGE_OF_MINIMUM_AND_STATEMENT_BALANCE_MESSAGE");
LABEL_77:
      PKLocalizedFeatureString(v18, v5, 0, v11, v12, v13, v14, v15, v103);
      v40 = objc_claimAutoreleasedReturnValue();
LABEL_78:
      v46 = (void *)v40;
      goto LABEL_79;
    case 30:
      v105 = objc_msgSend(v8, "inGrace");
      objc_msgSend(v9, "pendingPurchases");
      v43 = objc_claimAutoreleasedReturnValue();
      v108 = (void *)v43;
      if (v43)
      {
        v44 = (void *)v43;
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = objc_msgSend(v44, "compare:", v45) == 1;

      }
      else
      {
        v104 = 0;
      }
      v85 = self->_numberOfActiveInstallments;
      -[PKAccountServiceAccountResolutionConfiguration earlyInstallmentPlan](self->_configuration, "earlyInstallmentPlan");
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = 0;
      if (v85 < 1)
      {
        v19 = v108;
        goto LABEL_104;
      }
      v19 = v108;
      if (!v86)
        goto LABEL_104;
      if (v105)
      {
        if (v104)
          v22 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_MESSAGE_TRANSACTOR_PENDING");
        else
          v22 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_MESSAGE_TRANSACTOR");
        goto LABEL_141;
      }
      if (!v104)
      {
        v22 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_MESSAGE_REVOLVER");
        goto LABEL_141;
      }
      objc_msgSend(v8, "remainingStatementBalance");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "adjustedBalance");
      v93 = objc_claimAutoreleasedReturnValue();
      v99 = (void *)v93;
      v107 = v92;
      if (v92 && v93 && (objc_msgSend(v92, "isEqual:", v93) & 1) != 0)
        v100 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_MESSAGE_REVOLVER_PENDING_STATMENT_BALANCE_SAME");
      else
        v100 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_CURRENT_BALANCE_MESSAGE_REVOLVER_PENDING");
      PKLocalizedFeatureString(v100, v5, 0, v94, v95, v96, v97, v98, v103);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_104;
    case 31:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_COMBINED_BALANCE_MESSAGE");
      goto LABEL_77;
    case 32:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_VERY_EXPENSIVE_PURCHASE_MESSAGE");
      goto LABEL_77;
    case 33:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_RECURRING_EXPENSES_MESSAGE");
      goto LABEL_77;
    case 34:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_TOP_MERCHANT_MESSAGE");
      goto LABEL_77;
    case 35:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_RECENT_TRIP_MESSAGE");
      goto LABEL_77;
    case 36:
      v18 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PEAK_SPEND_DAY_MESSAGE");
      goto LABEL_77;
    default:
      v46 = 0;
      goto LABEL_79;
  }
}

- (id)_remainingStatementBalanceTitleString
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v3 = -[PKAccount feature](self->_account, "feature");
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentStatement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  if (!self->_currentStatementIsLastMonthsStatement)
  {
    v13 = 0;
LABEL_6:
    PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_TITLE"), v3, 0, v7, v8, v9, v10, v11, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v6, "closingDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_6;
  -[NSDateFormatter stringFromDate:](self->_monthFormatter, "stringFromDate:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_6;
  v15 = (void *)v14;
  PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_DATE_TITLE"), v3, CFSTR("%@"), v7, v8, v9, v10, v11, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v16;
}

- (id)_remainingStatementBalanceMessageString
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  uint64_t v14;

  v3 = -[PKAccount feature](self->_account, "feature");
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "inGrace"))
    v11 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_MESSAGE_TRANSACTOR");
  else
    v11 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_MESSAGE_REVOLVER");
  PKLocalizedFeatureString(v11, v3, 0, v6, v7, v8, v9, v10, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_remainingStatementBalanceGapTitleText
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  uint64_t v17;

  v3 = -[PKAccount feature](self->_account, "feature");
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentStatement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  if (v6 && (objc_msgSend(v6, "identifier"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, v13))
    v14 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_GAP_TITLE");
  else
    v14 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_GAP_TITLE_NO_STATEMENT");
  PKLocalizedFeatureString(v14, v3, 0, v7, v8, v9, v10, v11, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_remainingStatementBalanceGapDescriptionText
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  uint64_t v17;

  v3 = -[PKAccount feature](self->_account, "feature");
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentStatement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  if (v6 && (objc_msgSend(v6, "identifier"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, v13))
    v14 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_GAP_MESSAGE");
  else
    v14 = CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_REMAINING_STATEMENT_BALANCE_GAP_MESSAGE_NO_STATEMENT");
  PKLocalizedFeatureString(v14, v3, 0, v7, v8, v9, v10, v11, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_planCompletionTitleString
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v3 = -[PKAccount feature](self->_account, "feature");
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentStatement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  if (!self->_currentStatementIsLastMonthsStatement)
  {
    v13 = 0;
LABEL_6:
    PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_PLAN_COMPLETION_TITLE"), v3, 0, v7, v8, v9, v10, v11, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v6, "closingDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_6;
  -[NSDateFormatter stringFromDate:](self->_monthFormatter, "stringFromDate:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_6;
  v15 = (void *)v14;
  PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_CATEGORY_PAY_IN_PLAN_COMPLETION_DATE_TITLE"), v3, CFSTR("%@"), v7, v8, v9, v10, v11, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v16;
}

- (id)_filterSuggestions:(id)a3 belowThreshold:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(v5, "copy");
  PKLogFacilityTypeGetObject(0xEuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Bill Payment Suggested Amounts Threshold set: %@", buf, 0xCu);
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Bill Payment Suggested Amounts before threshold: %@", buf, 0xCu);
  }

  if (v6)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__PKBillPaymentSuggestedAmountController__filterSuggestions_belowThreshold___block_invoke;
    v12[3] = &unk_1E2AD7CD8;
    v13 = v6;
    objc_msgSend(v5, "pk_objectsPassingTest:", v12);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Bill Payment Suggested Amounts after threshold: %@", buf, 0xCu);
  }

  v10 = (void *)objc_msgSend(v7, "mutableCopy");
  return v10;
}

BOOL __76__PKBillPaymentSuggestedAmountController__filterSuggestions_belowThreshold___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a2, "amount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 32));

  return v4 < 2;
}

- (BOOL)_calculateCurrentStatementIsLastMonthsStatement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  void *v25;
  void *v26;

  -[PKAccount creditDetails](self->_account, "creditDetails");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "accountSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "balanceSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v3;
  objc_msgSend(v3, "currentStatement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openingDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "closingDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKDatesMidpoint(v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "openingDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "closingDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKDatesMidpoint(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0C99D48]);
  v13 = (void *)objc_msgSend(v12, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "productTimeZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTimeZone:", v15);

  v16 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v16, "setMonth:", -1);
  objc_msgSend(v13, "dateByAddingComponents:toDate:options:", v16, v11, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "components:fromDate:", 12, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)v8;
  objc_msgSend(v13, "components:fromDate:", 12, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v18, "month");
  if (v21 == objc_msgSend(v20, "month"))
  {
    v22 = objc_msgSend(v18, "year");
    v23 = v22 == objc_msgSend(v20, "year");
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)_initializeDifferentialPrivacy:(id)a3 accountSummary:(id)a4
{
  NSMutableArray *v6;
  NSMutableArray *differentialPrivacyFeatures;
  uint64_t v8;
  NSMutableArray *v9;
  void *v10;
  uint64_t v11;
  NSDecimalNumber *previousStatementPaymentsSum;
  uint64_t v13;
  id v14;

  v14 = a4;
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  differentialPrivacyFeatures = self->_differentialPrivacyFeatures;
  self->_differentialPrivacyFeatures = v6;

  v8 = 6;
  do
  {
    v9 = self->_differentialPrivacyFeatures;
    PKBillPaymentDifferentialPrivacyFeatureToString(0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v9, "addObject:", v10);

    --v8;
  }
  while (v8);
  if ((objc_msgSend(v14, "inGrace") & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    previousStatementPaymentsSum = self->_previousStatementPaymentsSum;
    if (previousStatementPaymentsSum
      && (-[NSDecimalNumber pk_isPositiveNumber](previousStatementPaymentsSum, "pk_isPositiveNumber") & 1) != 0)
    {
      v11 = 2;
    }
    else
    {
      v11 = 3;
    }
  }
  -[PKBillPaymentSuggestedAmountController _setDifferentialPrivacyFeature:atIndex:](self, "_setDifferentialPrivacyFeature:atIndex:", v11, 0);
  if (a3)
    v13 = 13;
  else
    v13 = 14;
  -[PKBillPaymentSuggestedAmountController _setDifferentialPrivacyFeature:atIndex:](self, "_setDifferentialPrivacyFeature:atIndex:", v13, 1);

}

- (void)_initializePaymentRingInstrumentationRecord:(id)a3 accountSummary:(id)a4
{
  objc_class *v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *paymentRingInstrumentationRecord;
  NSMutableDictionary *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  NSDecimalNumber *previousStatementPaymentsSum;
  NSMutableDictionary *v18;
  uint64_t v19;
  void *v20;
  id v21;

  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = (NSMutableDictionary *)objc_alloc_init(v6);
  paymentRingInstrumentationRecord = self->_paymentRingInstrumentationRecord;
  self->_paymentRingInstrumentationRecord = v8;

  v10 = self->_paymentRingInstrumentationRecord;
  _MergedGlobals_182();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", &unk_1E2C3F430, v11);

  v12 = self->_paymentRingInstrumentationRecord;
  off_1ECF21BF0();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", &unk_1E2C3F448, v13);

  LODWORD(v12) = objc_msgSend(v7, "inGrace");
  if ((_DWORD)v12)
  {
    v14 = self->_paymentRingInstrumentationRecord;
    off_1ECF21BF8();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = &unk_1E2C3F460;
  }
  else
  {
    previousStatementPaymentsSum = self->_previousStatementPaymentsSum;
    if (previousStatementPaymentsSum
      && -[NSDecimalNumber pk_isPositiveNumber](previousStatementPaymentsSum, "pk_isPositiveNumber"))
    {
      v14 = self->_paymentRingInstrumentationRecord;
      off_1ECF21BF8();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = &unk_1E2C3F478;
    }
    else
    {
      v14 = self->_paymentRingInstrumentationRecord;
      off_1ECF21BF8();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = &unk_1E2C3F490;
    }
  }
  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v16, v15);

  v18 = self->_paymentRingInstrumentationRecord;
  off_1ECF21C00();
  v19 = objc_claimAutoreleasedReturnValue();
  v21 = (id)v19;
  if (a3)
    v20 = &unk_1E2C3F448;
  else
    v20 = &unk_1E2C3F460;
  -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v20, v19);

}

- (void)_setDifferentialPrivacyFeature:(unint64_t)a3 atIndex:(unint64_t)a4
{
  NSMutableArray *differentialPrivacyFeatures;
  id v8;

  if (-[NSMutableArray count](self->_differentialPrivacyFeatures, "count") > a4)
  {
    differentialPrivacyFeatures = self->_differentialPrivacyFeatures;
    PKBillPaymentDifferentialPrivacyFeatureToString(a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray replaceObjectAtIndex:withObject:](differentialPrivacyFeatures, "replaceObjectAtIndex:withObject:", a4, v8);

  }
}

- (void)recordPaymentActionWithDifferentialPrivacy:(unint64_t)a3
{
  NSMutableArray *differentialPrivacyFeatures;
  void *v5;
  void *v6;
  _DPStringRecorder *v7;
  _DPStringRecorder *differentialPrivacyRecorder;
  _DPStringRecorder *v9;
  void *v10;
  int v11;
  NSObject *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  differentialPrivacyFeatures = self->_differentialPrivacyFeatures;
  PKBillPaymentDifferentialPrivacyButtonActionToString(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray replaceObjectAtIndex:withObject:](differentialPrivacyFeatures, "replaceObjectAtIndex:withObject:", 3, v5);

  -[PKBillPaymentSuggestedAmountController differentialPrivacyFeaturesAsString](self, "differentialPrivacyFeaturesAsString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (_DPStringRecorder *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D328]), "initWithKey:", CFSTR("com.apple.wallet.suggestions"));
  differentialPrivacyRecorder = self->_differentialPrivacyRecorder;
  self->_differentialPrivacyRecorder = v7;

  v9 = self->_differentialPrivacyRecorder;
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_DPStringRecorder record:](v9, "record:", v10);

  PKLogFacilityTypeGetObject(0xEuLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("Fail");
    if (v11)
      v13 = CFSTR("Success");
    v14 = 138543362;
    v15 = v13;
    _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "DifferentialPrivacy recorder status : %{public}@", (uint8_t *)&v14, 0xCu);
  }

}

- (void)recordPaymentRingAction:(unint64_t)a3
{
  NSMutableDictionary *paymentRingInstrumentationRecord;
  void *v5;
  void *v6;
  NSObject *v7;
  NSMutableDictionary *v8;
  int v9;
  NSMutableDictionary *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  paymentRingInstrumentationRecord = self->_paymentRingInstrumentationRecord;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  off_1ECF21BF0();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](paymentRingInstrumentationRecord, "setObject:forKey:", v5, v6);

  -[FHPaymentRingSuggestionController recordPaymentRingAction:](self->_fhController, "recordPaymentRingAction:", self->_paymentRingInstrumentationRecord);
  PKLogFacilityTypeGetObject(0xEuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->_paymentRingInstrumentationRecord;
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Payment action recorded: %@", (uint8_t *)&v9, 0xCu);
  }

}

- (id)differentialPrivacyFeaturesAsString
{
  return (id)-[NSMutableArray componentsJoinedByString:](self->_differentialPrivacyFeatures, "componentsJoinedByString:", CFSTR(","));
}

- (id)paymentRingInstrumentationRecordAsString
{
  id v3;
  NSMutableDictionary *paymentRingInstrumentationRecord;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  paymentRingInstrumentationRecord = self->_paymentRingInstrumentationRecord;
  off_1ECF21BF8();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](paymentRingInstrumentationRecord, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = self->_paymentRingInstrumentationRecord;
  off_1ECF21C00();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  v12 = self->_paymentRingInstrumentationRecord;
  _MergedGlobals_182();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  v16 = self->_paymentRingInstrumentationRecord;
  off_1ECF21BF0();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v16, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
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

- (NSArray)currentStatementSelectedSuggestedAmountEvents
{
  return self->_currentStatementSelectedSuggestedAmountEvents;
}

- (NSArray)previousStatementSelectedSuggestedAmountEvents
{
  return self->_previousStatementSelectedSuggestedAmountEvents;
}

- (NSDecimalNumber)currentStatementPurchasesSum
{
  return self->_currentStatementPurchasesSum;
}

- (NSDecimalNumber)currentStatementPaymentsSum
{
  return self->_currentStatementPaymentsSum;
}

- (NSDecimalNumber)previousStatementPurchasesSum
{
  return self->_previousStatementPurchasesSum;
}

- (NSDecimalNumber)previousStatementPaymentsSum
{
  return self->_previousStatementPaymentsSum;
}

- (NSDictionary)previousStatementMerchantCategoryTransactionSums
{
  return self->_previousStatementMerchantCategoryTransactionSums;
}

- (NSDictionary)currentStatementMerchantCategoryTransactionSums
{
  return self->_currentStatementMerchantCategoryTransactionSums;
}

- (PKAccountServiceAccountResolutionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStatementMerchantCategoryTransactionSums, 0);
  objc_storeStrong((id *)&self->_previousStatementMerchantCategoryTransactionSums, 0);
  objc_storeStrong((id *)&self->_previousStatementPaymentsSum, 0);
  objc_storeStrong((id *)&self->_previousStatementPurchasesSum, 0);
  objc_storeStrong((id *)&self->_currentStatementPaymentsSum, 0);
  objc_storeStrong((id *)&self->_currentStatementPurchasesSum, 0);
  objc_storeStrong((id *)&self->_previousStatementSelectedSuggestedAmountEvents, 0);
  objc_storeStrong((id *)&self->_currentStatementSelectedSuggestedAmountEvents, 0);
  objc_storeStrong((id *)&self->_transactionSource, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_fhController, 0);
  objc_storeStrong((id *)&self->_differentialPrivacyRecorder, 0);
  objc_storeStrong((id *)&self->_paymentRingInstrumentationRecord, 0);
  objc_storeStrong((id *)&self->_differentialPrivacyFeatures, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_merchantCategoryTransactionSums, 0);
  objc_storeStrong((id *)&self->_statementPurchasesSum, 0);
  objc_storeStrong((id *)&self->_monthFormatter, 0);
  objc_storeStrong((id *)&self->_monthAndDayFormatter, 0);
}

@end
