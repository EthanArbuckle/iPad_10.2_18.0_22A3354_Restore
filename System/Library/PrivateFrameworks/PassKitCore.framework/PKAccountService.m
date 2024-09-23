@implementation PKAccountService

- (void)updateFinancingPlansForAccountWithIdentifier:(id)a3 pageOffset:(unint64_t)a4 limit:(unint64_t)a5 ignoreLastUpdatedDate:(BOOL)a6 forceFetch:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;

  v8 = a7;
  v9 = a6;
  v15 = a8;
  v16 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __136__PKAccountService_PayLater__updateFinancingPlansForAccountWithIdentifier_pageOffset_limit_ignoreLastUpdatedDate_forceFetch_completion___block_invoke;
  v24[3] = &unk_1E2ABD9C8;
  v17 = v15;
  v25 = v17;
  v18 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __136__PKAccountService_PayLater__updateFinancingPlansForAccountWithIdentifier_pageOffset_limit_ignoreLastUpdatedDate_forceFetch_completion___block_invoke_2;
  v22[3] = &unk_1E2ABE710;
  v22[4] = self;
  v23 = v17;
  v21 = v17;
  objc_msgSend(v20, "updateFinancingPlansForAccountWithIdentifier:pageOffset:limit:ignoreLastUpdatedDate:forceFetch:completion:", v18, a4, a5, v9, v8, v22);

}

uint64_t __136__PKAccountService_PayLater__updateFinancingPlansForAccountWithIdentifier_pageOffset_limit_ignoreLastUpdatedDate_forceFetch_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __136__PKAccountService_PayLater__updateFinancingPlansForAccountWithIdentifier_pageOffset_limit_ignoreLastUpdatedDate_forceFetch_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __136__PKAccountService_PayLater__updateFinancingPlansForAccountWithIdentifier_pageOffset_limit_ignoreLastUpdatedDate_forceFetch_completion___block_invoke_3;
  v13[3] = &unk_1E2ABDB58;
  v9 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v10 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_16;
  block[3] = &unk_1E2ABD9A0;
  v19 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

uint64_t __136__PKAccountService_PayLater__updateFinancingPlansForAccountWithIdentifier_pageOffset_limit_ignoreLastUpdatedDate_forceFetch_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)cancelFinancingPlanWithIdentifier:(id)a3 accountIdentifier:(id)a4 cancellationReasonIdentifier:(id)a5 cancellationReasonDescription:(id)a6 completion:(id)a7
{
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;

  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __152__PKAccountService_PayLater__cancelFinancingPlanWithIdentifier_accountIdentifier_cancellationReasonIdentifier_cancellationReasonDescription_completion___block_invoke;
  v25[3] = &unk_1E2ABD9C8;
  v15 = v13;
  v26 = v15;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __152__PKAccountService_PayLater__cancelFinancingPlanWithIdentifier_accountIdentifier_cancellationReasonIdentifier_cancellationReasonDescription_completion___block_invoke_2;
  v23[3] = &unk_1E2ABEB88;
  v23[4] = self;
  v24 = v15;
  v22 = v15;
  objc_msgSend(v21, "cancelFinancingPlanWithIdentifier:accountIdentifier:cancellationReasonIdentifier:cancellationReasonDescription:completion:", v19, v18, v17, v16, v23);

}

uint64_t __152__PKAccountService_PayLater__cancelFinancingPlanWithIdentifier_accountIdentifier_cancellationReasonIdentifier_cancellationReasonDescription_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __152__PKAccountService_PayLater__cancelFinancingPlanWithIdentifier_accountIdentifier_cancellationReasonIdentifier_cancellationReasonDescription_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __152__PKAccountService_PayLater__cancelFinancingPlanWithIdentifier_accountIdentifier_cancellationReasonIdentifier_cancellationReasonDescription_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_16;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __152__PKAccountService_PayLater__cancelFinancingPlanWithIdentifier_accountIdentifier_cancellationReasonIdentifier_cancellationReasonDescription_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)financingPlansForAllAccountsWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__PKAccountService_PayLater__financingPlansForAllAccountsWithCompletion___block_invoke;
  v13[3] = &unk_1E2ABD9C8;
  v7 = v5;
  v14 = v7;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __73__PKAccountService_PayLater__financingPlansForAllAccountsWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABDE50;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "financingPlansForAllAccountsWithCompletion:", v11);

}

uint64_t __73__PKAccountService_PayLater__financingPlansForAllAccountsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __73__PKAccountService_PayLater__financingPlansForAllAccountsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__PKAccountService_PayLater__financingPlansForAllAccountsWithCompletion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_16;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __73__PKAccountService_PayLater__financingPlansForAllAccountsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)financingPlansWithQuery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD block[4];
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v22[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __65__PKAccountService_PayLater__financingPlansWithQuery_completion___block_invoke_2;
    v15[3] = &unk_1E2AD3A48;
    v15[4] = self;
    v17 = v7;
    v16 = v6;
    v9 = v7;
    -[PKAccountService financingPlansWithQueries:completion:](self, "financingPlansWithQueries:completion:", v8, v15);

    v10 = v17;
  }
  else
  {
    -[PKAccountService replyQueue](self, "replyQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __65__PKAccountService_PayLater__financingPlansWithQuery_completion___block_invoke;
    v18[3] = &unk_1E2ABD9A0;
    v19 = v7;
    v13 = v18;
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_16;
    block[3] = &unk_1E2ABD9A0;
    v21 = v13;
    v14 = v7;
    dispatch_async(v11, block);

    v10 = v19;
  }

}

uint64_t __65__PKAccountService_PayLater__financingPlansWithQuery_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __65__PKAccountService_PayLater__financingPlansWithQuery_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    v4 = a2;
    objc_msgSend(v3, "queryIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
  }
}

- (void)financingPlansWithQueries:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__PKAccountService_PayLater__financingPlansWithQueries_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __67__PKAccountService_PayLater__financingPlansWithQueries_completion___block_invoke_2;
  v14[3] = &unk_1E2AC44A8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "financingPlansWithQueries:completion:", v10, v14);

}

uint64_t __67__PKAccountService_PayLater__financingPlansWithQueries_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __67__PKAccountService_PayLater__financingPlansWithQueries_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__PKAccountService_PayLater__financingPlansWithQueries_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_16;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __67__PKAccountService_PayLater__financingPlansWithQueries_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)financingPlanInstallmentsDueDateRangeForAccountIdentifier:(id)a3 financingPlanStates:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __119__PKAccountService_PayLater__financingPlanInstallmentsDueDateRangeForAccountIdentifier_financingPlanStates_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __119__PKAccountService_PayLater__financingPlanInstallmentsDueDateRangeForAccountIdentifier_financingPlanStates_completion___block_invoke_2;
  v17[3] = &unk_1E2AD7350;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "financingPlanInstallmentsDueDateRangeForAccountIdentifier:financingPlanStates:completion:", v13, v12, v17);

}

uint64_t __119__PKAccountService_PayLater__financingPlanInstallmentsDueDateRangeForAccountIdentifier_financingPlanStates_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __119__PKAccountService_PayLater__financingPlanInstallmentsDueDateRangeForAccountIdentifier_financingPlanStates_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __119__PKAccountService_PayLater__financingPlanInstallmentsDueDateRangeForAccountIdentifier_financingPlanStates_completion___block_invoke_3;
  v13[3] = &unk_1E2ABDB58;
  v9 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v10 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_16;
  block[3] = &unk_1E2ABD9A0;
  v19 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

uint64_t __119__PKAccountService_PayLater__financingPlanInstallmentsDueDateRangeForAccountIdentifier_financingPlanStates_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)reprocessPayLaterFinancingPlansForMerchantCleanup:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__PKAccountService_PayLater__reprocessPayLaterFinancingPlansForMerchantCleanup___block_invoke;
  v13[3] = &unk_1E2ABD9C8;
  v7 = v5;
  v14 = v7;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __80__PKAccountService_PayLater__reprocessPayLaterFinancingPlansForMerchantCleanup___block_invoke_2;
  v11[3] = &unk_1E2ABE058;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "reprocessPayLaterFinancingPlansForMerchantCleanup:", v11);

}

uint64_t __80__PKAccountService_PayLater__reprocessPayLaterFinancingPlansForMerchantCleanup___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __80__PKAccountService_PayLater__reprocessPayLaterFinancingPlansForMerchantCleanup___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  _QWORD v6[5];
  id v7;
  _QWORD block[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__PKAccountService_PayLater__reprocessPayLaterFinancingPlansForMerchantCleanup___block_invoke_3;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v6;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_16;
  block[3] = &unk_1E2ABD9A0;
  v9 = v5;
  dispatch_async(v2, block);

}

uint64_t __80__PKAccountService_PayLater__reprocessPayLaterFinancingPlansForMerchantCleanup___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteFinancingPlansForAllAccountsWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__PKAccountService_PayLater__deleteFinancingPlansForAllAccountsWithCompletion___block_invoke;
  v13[3] = &unk_1E2ABD9C8;
  v7 = v5;
  v14 = v7;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __79__PKAccountService_PayLater__deleteFinancingPlansForAllAccountsWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABE058;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "deleteFinancingPlansForAllAccountsWithCompletion:", v11);

}

uint64_t __79__PKAccountService_PayLater__deleteFinancingPlansForAllAccountsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __79__PKAccountService_PayLater__deleteFinancingPlansForAllAccountsWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  _QWORD v6[5];
  id v7;
  _QWORD block[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__PKAccountService_PayLater__deleteFinancingPlansForAllAccountsWithCompletion___block_invoke_3;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v6;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_16;
  block[3] = &unk_1E2ABD9A0;
  v9 = v5;
  dispatch_async(v2, block);

}

uint64_t __79__PKAccountService_PayLater__deleteFinancingPlansForAllAccountsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteFinancingPlansForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__PKAccountService_PayLater__deleteFinancingPlansForAccountIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __82__PKAccountService_PayLater__deleteFinancingPlansForAccountIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABE058;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "deleteFinancingPlansForAccountIdentifier:completion:", v10, v14);

}

uint64_t __82__PKAccountService_PayLater__deleteFinancingPlansForAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __82__PKAccountService_PayLater__deleteFinancingPlansForAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  _QWORD v6[5];
  id v7;
  _QWORD block[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__PKAccountService_PayLater__deleteFinancingPlansForAccountIdentifier_completion___block_invoke_3;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v6;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_16;
  block[3] = &unk_1E2ABD9A0;
  v9 = v5;
  dispatch_async(v2, block);

}

uint64_t __82__PKAccountService_PayLater__deleteFinancingPlansForAccountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteFinancingPlanWithIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __93__PKAccountService_PayLater__deleteFinancingPlanWithIdentifier_accountIdentifier_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __93__PKAccountService_PayLater__deleteFinancingPlanWithIdentifier_accountIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ABE058;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "deleteFinancingPlanWithIdentifier:accountIdentifier:completion:", v13, v12, v17);

}

uint64_t __93__PKAccountService_PayLater__deleteFinancingPlanWithIdentifier_accountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __93__PKAccountService_PayLater__deleteFinancingPlanWithIdentifier_accountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  _QWORD v6[5];
  id v7;
  _QWORD block[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __93__PKAccountService_PayLater__deleteFinancingPlanWithIdentifier_accountIdentifier_completion___block_invoke_3;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v6;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_16;
  block[3] = &unk_1E2ABD9A0;
  v9 = v5;
  dispatch_async(v2, block);

}

uint64_t __93__PKAccountService_PayLater__deleteFinancingPlanWithIdentifier_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)payLaterCardMagnitudesForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__PKAccountService_PayLater__payLaterCardMagnitudesForAccountIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __84__PKAccountService_PayLater__payLaterCardMagnitudesForAccountIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2AD7378;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "payLaterCardMagnitudesForAccountIdentifier:completion:", v10, v14);

}

uint64_t __84__PKAccountService_PayLater__payLaterCardMagnitudesForAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __84__PKAccountService_PayLater__payLaterCardMagnitudesForAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)financingPlanForPlanIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__PKAccountService_PayLater__financingPlanForPlanIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __72__PKAccountService_PayLater__financingPlanForPlanIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2AD73A0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "financingPlanForPlanIdentifier:completion:", v10, v14);

}

uint64_t __72__PKAccountService_PayLater__financingPlanForPlanIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __72__PKAccountService_PayLater__financingPlanForPlanIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "replyQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__PKAccountService_PayLater__financingPlanForPlanIdentifier_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_16;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __72__PKAccountService_PayLater__financingPlanForPlanIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

+ (PKAccountService)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PKAccountService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_287 != -1)
    dispatch_once(&_MergedGlobals_287, block);
  return (PKAccountService *)(id)qword_1ECF22C90;
}

void __34__PKAccountService_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECF22C90;
  qword_1ECF22C90 = (uint64_t)v1;

}

- (PKAccountService)init
{
  PKAccountService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *replyQueue;
  PKXPCService *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PKXPCService *remoteService;
  uint64_t v10;
  NSHashTable *observers;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKAccountService;
  v2 = -[PKAccountService init](&v14, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.passkit.pkpassservice.reply", 0);
    replyQueue = v2->_replyQueue;
    v2->_replyQueue = (OS_dispatch_queue *)v3;

    v5 = [PKXPCService alloc];
    PDAccountServiceInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKAccountServiceInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKXPCService initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:](v5, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:", CFSTR("com.apple.passd.account"), v6, v7, v2);
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v8;

    v2->_lockObservers._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
    v10 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v10;

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:suspensionBehavior:", v2, sel__accountsChanged_, CFSTR("PKAccountServiceAccountsChangedDistributedNotification"), 0, 2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKAccountService;
  -[PKAccountService dealloc](&v4, sel_dealloc);
}

- (void)_accountsChanged:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("PKAccountServiceAccountsChangedNotification"), self);

}

- (id)errorHandlerForMethod:(SEL)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD aBlock[5];
  id v12;
  SEL v13;

  v6 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PKAccountService_errorHandlerForMethod_completion___block_invoke;
  aBlock[3] = &unk_1E2AC2788;
  v12 = v6;
  v13 = a3;
  aBlock[4] = self;
  v7 = v6;
  v8 = _Block_copy(aBlock);
  v9 = _Block_copy(v8);

  return v9;
}

void __53__PKAccountService_errorHandlerForMethod_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  __int128 buf;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKAccountService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__PKAccountService_errorHandlerForMethod_completion___block_invoke_18;
  v13[3] = &unk_1E2ABDA68;
  v9 = v6;
  v10 = *(_QWORD *)(a1 + 32);
  v14 = v3;
  v15 = v10;
  v16 = v9;
  v11 = v13;
  *(_QWORD *)&buf = v8;
  *((_QWORD *)&buf + 1) = 3221225472;
  v18 = __dispatch_async_ar_block_invoke_23;
  v19 = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v3;
  dispatch_async(v7, &buf);

}

uint64_t __53__PKAccountService_errorHandlerForMethod_completion___block_invoke_18(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PKXPCService remoteObjectProxyWithErrorHandler:](self->_remoteService, "remoteObjectProxyWithErrorHandler:", a3);
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PKXPCService synchronousRemoteObjectProxyWithErrorHandler:](self->_remoteService, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

- (void)accountsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__PKAccountService_accountsWithCompletion___block_invoke;
    v13[3] = &unk_1E2ABD9C8;
    v8 = v5;
    v14 = v8;
    -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __43__PKAccountService_accountsWithCompletion___block_invoke_2;
    v11[3] = &unk_1E2ABE710;
    v11[4] = self;
    v12 = v8;
    objc_msgSend(v10, "accountsWithCompletion:", v11);

  }
}

uint64_t __43__PKAccountService_accountsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __43__PKAccountService_accountsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43__PKAccountService_accountsWithCompletion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __43__PKAccountService_accountsWithCompletion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)accountsForProvisioningWithCompletion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__PKAccountService_accountsForProvisioningWithCompletion___block_invoke;
    v13[3] = &unk_1E2ABD9C8;
    v8 = v5;
    v14 = v8;
    -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __58__PKAccountService_accountsForProvisioningWithCompletion___block_invoke_2;
    v11[3] = &unk_1E2ADC698;
    v11[4] = self;
    v12 = v8;
    objc_msgSend(v10, "accountsForProvisioningWithCompletion:", v11);

  }
}

uint64_t __58__PKAccountService_accountsForProvisioningWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

void __58__PKAccountService_accountsForProvisioningWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  _QWORD block[4];
  id v26;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __58__PKAccountService_accountsForProvisioningWithCompletion___block_invoke_3;
  v19[3] = &unk_1E2ACA258;
  v13 = v10;
  v20 = v7;
  v21 = v8;
  v14 = *(_QWORD *)(a1 + 32);
  v22 = v9;
  v23 = v14;
  v24 = v13;
  v15 = v19;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v26 = v15;
  v16 = v9;
  v17 = v8;
  v18 = v7;
  dispatch_async(v11, block);

}

uint64_t __58__PKAccountService_accountsForProvisioningWithCompletion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[8];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5], a1[6]);
  return result;
}

- (void)accountsWithPassLocallyProvisionedWithCompletion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__PKAccountService_accountsWithPassLocallyProvisionedWithCompletion___block_invoke;
    v13[3] = &unk_1E2ABD9C8;
    v8 = v5;
    v14 = v8;
    -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __69__PKAccountService_accountsWithPassLocallyProvisionedWithCompletion___block_invoke_2;
    v11[3] = &unk_1E2ABE710;
    v11[4] = self;
    v12 = v8;
    objc_msgSend(v10, "accountsWithPassLocallyProvisionedWithCompletion:", v11);

  }
}

uint64_t __69__PKAccountService_accountsWithPassLocallyProvisionedWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __69__PKAccountService_accountsWithPassLocallyProvisionedWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__PKAccountService_accountsWithPassLocallyProvisionedWithCompletion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __69__PKAccountService_accountsWithPassLocallyProvisionedWithCompletion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)updateAccountsWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__PKAccountService_updateAccountsWithCompletion___block_invoke;
  v13[3] = &unk_1E2ABD9C8;
  v7 = v5;
  v14 = v7;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __49__PKAccountService_updateAccountsWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABE710;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "updateAccountsWithCompletion:", v11);

}

uint64_t __49__PKAccountService_updateAccountsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __49__PKAccountService_updateAccountsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__PKAccountService_updateAccountsWithCompletion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __49__PKAccountService_updateAccountsWithCompletion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)updateMockAccountWithAccount:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__PKAccountService_updateMockAccountWithAccount_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __60__PKAccountService_updateMockAccountWithAccount_completion___block_invoke_2;
  v14[3] = &unk_1E2ADC6C0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "updateMockAccountWithAccount:completion:", v10, v14);

}

uint64_t __60__PKAccountService_updateMockAccountWithAccount_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __60__PKAccountService_updateMockAccountWithAccount_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__PKAccountService_updateMockAccountWithAccount_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __60__PKAccountService_updateMockAccountWithAccount_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)accountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __53__PKAccountService_accountWithIdentifier_completion___block_invoke;
    v16[3] = &unk_1E2ABD9C8;
    v10 = v7;
    v17 = v10;
    v11 = a3;
    -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __53__PKAccountService_accountWithIdentifier_completion___block_invoke_2;
    v14[3] = &unk_1E2ABDEA0;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "accountWithIdentifier:completion:", v11, v14);

  }
}

uint64_t __53__PKAccountService_accountWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __53__PKAccountService_accountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__PKAccountService_accountWithIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __53__PKAccountService_accountWithIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)accountWithVirtualCardIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__PKAccountService_accountWithVirtualCardIdentifier_completion___block_invoke;
    v16[3] = &unk_1E2ABD9C8;
    v10 = v7;
    v17 = v10;
    v11 = a3;
    -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __64__PKAccountService_accountWithVirtualCardIdentifier_completion___block_invoke_2;
    v14[3] = &unk_1E2ABDEA0;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "accountWithVirtualCardIdentifier:completion:", v11, v14);

  }
}

uint64_t __64__PKAccountService_accountWithVirtualCardIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __64__PKAccountService_accountWithVirtualCardIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__PKAccountService_accountWithVirtualCardIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __64__PKAccountService_accountWithVirtualCardIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)accountForPassWithUniqueID:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__PKAccountService_accountForPassWithUniqueID_completion___block_invoke;
    v16[3] = &unk_1E2ABD9C8;
    v10 = v7;
    v17 = v10;
    v11 = a3;
    -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __58__PKAccountService_accountForPassWithUniqueID_completion___block_invoke_2;
    v14[3] = &unk_1E2ADC6C0;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "accountForPassWithUniqueID:completion:", v11, v14);

  }
}

uint64_t __58__PKAccountService_accountForPassWithUniqueID_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __58__PKAccountService_accountForPassWithUniqueID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__PKAccountService_accountForPassWithUniqueID_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __58__PKAccountService_accountForPassWithUniqueID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)updateAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__PKAccountService_updateAccountWithIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __59__PKAccountService_updateAccountWithIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABDEA0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "updateAccountWithIdentifier:extended:completion:", v10, 0, v14);

}

uint64_t __59__PKAccountService_updateAccountWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __59__PKAccountService_updateAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__PKAccountService_updateAccountWithIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __59__PKAccountService_updateAccountWithIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)updateAccountWithIdentifier:(id)a3 extended:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __68__PKAccountService_updateAccountWithIdentifier_extended_completion___block_invoke;
  v18[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v19 = v11;
  v12 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __68__PKAccountService_updateAccountWithIdentifier_extended_completion___block_invoke_2;
  v16[3] = &unk_1E2ABDEA0;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "updateAccountWithIdentifier:extended:completion:", v12, v5, v16);

}

uint64_t __68__PKAccountService_updateAccountWithIdentifier_extended_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __68__PKAccountService_updateAccountWithIdentifier_extended_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__PKAccountService_updateAccountWithIdentifier_extended_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __68__PKAccountService_updateAccountWithIdentifier_extended_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)updateAccountUsersForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__PKAccountService_updateAccountUsersForAccountWithIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __74__PKAccountService_updateAccountUsersForAccountWithIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ACF9F8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "updateAccountUsersForAccountWithIdentifier:completion:", v10, v14);

}

uint64_t __74__PKAccountService_updateAccountUsersForAccountWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __74__PKAccountService_updateAccountUsersForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__PKAccountService_updateAccountUsersForAccountWithIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __74__PKAccountService_updateAccountUsersForAccountWithIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)accountUsersForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__PKAccountService_accountUsersForAccountWithIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __68__PKAccountService_accountUsersForAccountWithIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABDD60;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "accountUsersForAccountWithIdentifier:completion:", v10, v14);

}

uint64_t __68__PKAccountService_accountUsersForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __68__PKAccountService_accountUsersForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__PKAccountService_accountUsersForAccountWithIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __68__PKAccountService_accountUsersForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)deleteAccountUserWithAltDSID:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __85__PKAccountService_deleteAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __85__PKAccountService_deleteAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ABEB88;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "deleteAccountUserWithAltDSID:forAccountWithIdentifier:completion:", v13, v12, v17);

}

uint64_t __85__PKAccountService_deleteAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __85__PKAccountService_deleteAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__PKAccountService_deleteAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __85__PKAccountService_deleteAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)deleteBeneficiaryWithIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81__PKAccountService_deleteBeneficiaryWithIdentifier_accountIdentifier_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __81__PKAccountService_deleteBeneficiaryWithIdentifier_accountIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ABEB88;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "deleteBeneficiaryWithIdentifier:accountIdentifier:completion:", v13, v12, v17);

}

uint64_t __81__PKAccountService_deleteBeneficiaryWithIdentifier_accountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __81__PKAccountService_deleteBeneficiaryWithIdentifier_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__PKAccountService_deleteBeneficiaryWithIdentifier_accountIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __81__PKAccountService_deleteBeneficiaryWithIdentifier_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)updateAccountUserPreferences:(id)a3 forAccountUserWithAltDSID:(id)a4 forAccountWithIdentifier:(id)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __111__PKAccountService_updateAccountUserPreferences_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke;
  v22[3] = &unk_1E2ABD9C8;
  v13 = v11;
  v23 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __111__PKAccountService_updateAccountUserPreferences_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_2;
  v20[3] = &unk_1E2ADC6E8;
  v20[4] = self;
  v21 = v13;
  v19 = v13;
  objc_msgSend(v18, "updateAccountUserPreferences:forAccountUserWithAltDSID:forAccountWithIdentifier:completion:", v16, v15, v14, v20);

}

uint64_t __111__PKAccountService_updateAccountUserPreferences_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __111__PKAccountService_updateAccountUserPreferences_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __111__PKAccountService_updateAccountUserPreferences_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __111__PKAccountService_updateAccountUserPreferences_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)updateAccountUserNotificationSettings:(id)a3 forAccountUserWithAltDSID:(id)a4 forAccountWithIdentifier:(id)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __120__PKAccountService_updateAccountUserNotificationSettings_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke;
  v22[3] = &unk_1E2ABD9C8;
  v13 = v11;
  v23 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __120__PKAccountService_updateAccountUserNotificationSettings_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_2;
  v20[3] = &unk_1E2ADC6E8;
  v20[4] = self;
  v21 = v13;
  v19 = v13;
  objc_msgSend(v18, "updateAccountUserNotificationSettings:forAccountUserWithAltDSID:forAccountWithIdentifier:completion:", v16, v15, v14, v20);

}

uint64_t __120__PKAccountService_updateAccountUserNotificationSettings_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __120__PKAccountService_updateAccountUserNotificationSettings_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __120__PKAccountService_updateAccountUserNotificationSettings_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __120__PKAccountService_updateAccountUserNotificationSettings_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)deleteAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__PKAccountService_deleteAccountWithIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __59__PKAccountService_deleteAccountWithIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABEB88;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "deleteAccountWithIdentifier:completion:", v10, v14);

}

uint64_t __59__PKAccountService_deleteAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __59__PKAccountService_deleteAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__PKAccountService_deleteAccountWithIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __59__PKAccountService_deleteAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)deleteLocalAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__PKAccountService_deleteLocalAccountWithIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __64__PKAccountService_deleteLocalAccountWithIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABEB88;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "deleteLocalAccountWithIdentifier:completion:", v10, v14);

}

uint64_t __64__PKAccountService_deleteLocalAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __64__PKAccountService_deleteLocalAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__PKAccountService_deleteLocalAccountWithIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __64__PKAccountService_deleteLocalAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)insertOrUpdateLocalAccount:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__PKAccountService_insertOrUpdateLocalAccount_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __58__PKAccountService_insertOrUpdateLocalAccount_completion___block_invoke_2;
  v14[3] = &unk_1E2ADC6C0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "insertOrUpdateLocalAccount:completion:", v10, v14);

}

uint64_t __58__PKAccountService_insertOrUpdateLocalAccount_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __58__PKAccountService_insertOrUpdateLocalAccount_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__PKAccountService_insertOrUpdateLocalAccount_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __58__PKAccountService_insertOrUpdateLocalAccount_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)insertOrUpdateLocalFinancingPlans:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __83__PKAccountService_insertOrUpdateLocalFinancingPlans_accountIdentifier_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __83__PKAccountService_insertOrUpdateLocalFinancingPlans_accountIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ABDE50;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "insertOrUpdateLocalFinancingPlans:accountIdentifier:completion:", v13, v12, v17);

}

uint64_t __83__PKAccountService_insertOrUpdateLocalFinancingPlans_accountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __83__PKAccountService_insertOrUpdateLocalFinancingPlans_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__PKAccountService_insertOrUpdateLocalFinancingPlans_accountIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __83__PKAccountService_insertOrUpdateLocalFinancingPlans_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)setNeedsSyncToFinanceForAllTransactionsWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__PKAccountService_setNeedsSyncToFinanceForAllTransactionsWithCompletion___block_invoke;
  v13[3] = &unk_1E2ABD9C8;
  v7 = v5;
  v14 = v7;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __74__PKAccountService_setNeedsSyncToFinanceForAllTransactionsWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABDCE8;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "setNeedsSyncToFinanceForAllTransactionsWithCompletion:", v11);

}

uint64_t __74__PKAccountService_setNeedsSyncToFinanceForAllTransactionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __74__PKAccountService_setNeedsSyncToFinanceForAllTransactionsWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD v7[4];
  id v8;
  char v9;
  _QWORD block[4];
  id v11;

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v5 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__PKAccountService_setNeedsSyncToFinanceForAllTransactionsWithCompletion___block_invoke_3;
  v7[3] = &unk_1E2ABDCC0;
  v8 = v3;
  v9 = a2;
  v6 = v7;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v11 = v6;
  dispatch_async(v4, block);

}

uint64_t __74__PKAccountService_setNeedsSyncToFinanceForAllTransactionsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (void)scheduleSetupReminderForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v7 = a4;
  v8 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, &__block_literal_global_220);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__PKAccountService_scheduleSetupReminderForAccountWithIdentifier_completion___block_invoke_2;
  v12[3] = &unk_1E2ABE058;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "scheduleSetupReminderForAccountWithIdentifier:completion:", v8, v12);

}

void __77__PKAccountService_scheduleSetupReminderForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  _QWORD v7[5];
  id v8;
  _QWORD block[4];
  id v10;

  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__PKAccountService_scheduleSetupReminderForAccountWithIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E2ABDA18;
  v5 = v2;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v7;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v10 = v6;
  dispatch_async(v3, block);

}

uint64_t __77__PKAccountService_scheduleSetupReminderForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)insertSummaryNotificationForAccountIdentifier:(id)a3 summaryType:(int64_t)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __89__PKAccountService_insertSummaryNotificationForAccountIdentifier_summaryType_completion___block_invoke;
  v18[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v19 = v11;
  v12 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __89__PKAccountService_insertSummaryNotificationForAccountIdentifier_summaryType_completion___block_invoke_2;
  v16[3] = &unk_1E2ABEB88;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "insertSummaryNotificationForAccountIdentifier:summaryType:completion:", v12, a4, v16);

}

uint64_t __89__PKAccountService_insertSummaryNotificationForAccountIdentifier_summaryType_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __89__PKAccountService_insertSummaryNotificationForAccountIdentifier_summaryType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__PKAccountService_insertSummaryNotificationForAccountIdentifier_summaryType_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __89__PKAccountService_insertSummaryNotificationForAccountIdentifier_summaryType_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)insertDailyCashNotificationForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__PKAccountService_insertDailyCashNotificationForAccountIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __79__PKAccountService_insertDailyCashNotificationForAccountIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABEB88;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "insertDailyCashNotificationForAccountIdentifier:completion:", v10, v14);

}

uint64_t __79__PKAccountService_insertDailyCashNotificationForAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __79__PKAccountService_insertDailyCashNotificationForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__PKAccountService_insertDailyCashNotificationForAccountIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __79__PKAccountService_insertDailyCashNotificationForAccountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)paymentFundingSourcesForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__PKAccountService_paymentFundingSourcesForAccountIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __73__PKAccountService_paymentFundingSourcesForAccountIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABDE50;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "paymentFundingSourcesForAccountIdentifier:completion:", v10, v14);

}

uint64_t __73__PKAccountService_paymentFundingSourcesForAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __73__PKAccountService_paymentFundingSourcesForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PKAccountService_paymentFundingSourcesForAccountIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __73__PKAccountService_paymentFundingSourcesForAccountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)paymentFundingSourceForIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __83__PKAccountService_paymentFundingSourceForIdentifier_accountIdentifier_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __83__PKAccountService_paymentFundingSourceForIdentifier_accountIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ADC710;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "paymentFundingSourceForIdentifier:accountIdentifier:completion:", v13, v12, v17);

}

uint64_t __83__PKAccountService_paymentFundingSourceForIdentifier_accountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __83__PKAccountService_paymentFundingSourceForIdentifier_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__PKAccountService_paymentFundingSourceForIdentifier_accountIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __83__PKAccountService_paymentFundingSourceForIdentifier_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)updatePaymentFundingSourcesForAccountIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __85__PKAccountService_updatePaymentFundingSourcesForAccountIdentifier_force_completion___block_invoke;
  v18[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v19 = v11;
  v12 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __85__PKAccountService_updatePaymentFundingSourcesForAccountIdentifier_force_completion___block_invoke_2;
  v16[3] = &unk_1E2ABE710;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "updatePaymentFundingSourcesForAccountIdentifier:force:completion:", v12, v5, v16);

}

uint64_t __85__PKAccountService_updatePaymentFundingSourcesForAccountIdentifier_force_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __85__PKAccountService_updatePaymentFundingSourcesForAccountIdentifier_force_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__PKAccountService_updatePaymentFundingSourcesForAccountIdentifier_force_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __85__PKAccountService_updatePaymentFundingSourcesForAccountIdentifier_force_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)defaultAccountForFeature:(unint64_t)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__PKAccountService_defaultAccountForFeature_completion___block_invoke;
    v15[3] = &unk_1E2ABD9C8;
    v10 = v7;
    v16 = v10;
    -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __56__PKAccountService_defaultAccountForFeature_completion___block_invoke_2;
    v13[3] = &unk_1E2ADC738;
    v13[4] = self;
    v14 = v10;
    objc_msgSend(v12, "defaultAccountForFeature:completion:", a3, v13);

  }
}

uint64_t __56__PKAccountService_defaultAccountForFeature_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__PKAccountService_defaultAccountForFeature_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)termsWithIdentifier:(id)a3 accepted:(BOOL)a4 withAccountIdentifier:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v7 = a4;
  v11 = a6;
  v12 = v11;
  if (v11)
  {
    v13 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __82__PKAccountService_termsWithIdentifier_accepted_withAccountIdentifier_completion___block_invoke;
    v21[3] = &unk_1E2ABD9C8;
    v14 = v11;
    v22 = v14;
    v15 = a5;
    v16 = a3;
    -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __82__PKAccountService_termsWithIdentifier_accepted_withAccountIdentifier_completion___block_invoke_2;
    v19[3] = &unk_1E2ABD9C8;
    v20 = v14;
    objc_msgSend(v18, "termsWithIdentifier:accepted:withAccountIdentifier:completion:", v16, v7, v15, v19);

  }
}

uint64_t __82__PKAccountService_termsWithIdentifier_accepted_withAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __82__PKAccountService_termsWithIdentifier_accepted_withAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performAccountAction:(id)a3 withAccountIdentifier:(id)a4 accountUserAltDSID:(id)a5 completion:(id)a6
{
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;

  v11 = a6;
  v12 = v11;
  if (v11)
  {
    v13 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __93__PKAccountService_performAccountAction_withAccountIdentifier_accountUserAltDSID_completion___block_invoke;
    v22[3] = &unk_1E2ABD9C8;
    v14 = v11;
    v23 = v14;
    v15 = a5;
    v16 = a4;
    v17 = a3;
    -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __93__PKAccountService_performAccountAction_withAccountIdentifier_accountUserAltDSID_completion___block_invoke_2;
    v20[3] = &unk_1E2ABDEA0;
    v20[4] = self;
    v21 = v14;
    objc_msgSend(v19, "performAccountAction:withAccountIdentifier:accountUserAltDSID:completion:", v17, v16, v15, v20);

  }
}

uint64_t __93__PKAccountService_performAccountAction_withAccountIdentifier_accountUserAltDSID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __93__PKAccountService_performAccountAction_withAccountIdentifier_accountUserAltDSID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__PKAccountService_performAccountAction_withAccountIdentifier_accountUserAltDSID_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __93__PKAccountService_performAccountAction_withAccountIdentifier_accountUserAltDSID_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)userInfoForAccountIdentifier:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __71__PKAccountService_userInfoForAccountIdentifier_forceFetch_completion___block_invoke;
    v18[3] = &unk_1E2ABD9C8;
    v12 = v9;
    v19 = v12;
    v13 = a3;
    -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __71__PKAccountService_userInfoForAccountIdentifier_forceFetch_completion___block_invoke_2;
    v16[3] = &unk_1E2ADC760;
    v16[4] = self;
    v17 = v12;
    objc_msgSend(v15, "userInfoForAccountIdentifier:forceFetch:completion:", v13, v5, v16);

  }
}

uint64_t __71__PKAccountService_userInfoForAccountIdentifier_forceFetch_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __71__PKAccountService_userInfoForAccountIdentifier_forceFetch_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__PKAccountService_userInfoForAccountIdentifier_forceFetch_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __71__PKAccountService_userInfoForAccountIdentifier_forceFetch_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)updateUserInfoForAccountIdentifier:(id)a3 contact:(id)a4 completion:(id)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __74__PKAccountService_updateUserInfoForAccountIdentifier_contact_completion___block_invoke;
    v19[3] = &unk_1E2ABD9C8;
    v12 = v9;
    v20 = v12;
    v13 = a4;
    v14 = a3;
    -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __74__PKAccountService_updateUserInfoForAccountIdentifier_contact_completion___block_invoke_2;
    v17[3] = &unk_1E2ADC788;
    v17[4] = self;
    v18 = v12;
    objc_msgSend(v16, "updateUserInfoForAccountIdentifier:contact:completion:", v14, v13, v17);

  }
}

uint64_t __74__PKAccountService_updateUserInfoForAccountIdentifier_contact_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __74__PKAccountService_updateUserInfoForAccountIdentifier_contact_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__PKAccountService_updateUserInfoForAccountIdentifier_contact_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __74__PKAccountService_updateUserInfoForAccountIdentifier_contact_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)lastUsedInAppFundingSourceForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __78__PKAccountService_lastUsedInAppFundingSourceForAccountIdentifier_completion___block_invoke;
    v16[3] = &unk_1E2ABD9C8;
    v10 = v7;
    v17 = v10;
    v11 = a3;
    -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __78__PKAccountService_lastUsedInAppFundingSourceForAccountIdentifier_completion___block_invoke_2;
    v14[3] = &unk_1E2ADC7B0;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "lastUsedInAppFundingSourceForAccountIdentifier:completion:", v11, v14);

  }
}

uint64_t __78__PKAccountService_lastUsedInAppFundingSourceForAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __78__PKAccountService_lastUsedInAppFundingSourceForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__PKAccountService_lastUsedInAppFundingSourceForAccountIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __78__PKAccountService_lastUsedInAppFundingSourceForAccountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)updateLastUsedInAppFundingSource:(id)a3 accountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateLastUsedInAppFundingSource:accountIdentifier:", v7, v6);

  }
}

- (void)eventsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__PKAccountService_eventsForAccountIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __58__PKAccountService_eventsForAccountIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ACF9F8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "eventsForAccountIdentifier:completion:", v10, v14);

}

uint64_t __58__PKAccountService_eventsForAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __58__PKAccountService_eventsForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__PKAccountService_eventsForAccountIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __58__PKAccountService_eventsForAccountIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)eventsForAccountIdentifier:(id)a3 types:(id)a4 startDate:(id)a5 endDate:(id)a6 orderedByDate:(int64_t)a7 limit:(unint64_t)a8 completion:(id)a9
{
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;

  v16 = a9;
  v17 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __102__PKAccountService_eventsForAccountIdentifier_types_startDate_endDate_orderedByDate_limit_completion___block_invoke;
  v29[3] = &unk_1E2ABD9C8;
  v18 = v16;
  v30 = v18;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __102__PKAccountService_eventsForAccountIdentifier_types_startDate_endDate_orderedByDate_limit_completion___block_invoke_2;
  v27[3] = &unk_1E2ABE710;
  v27[4] = self;
  v28 = v18;
  v25 = v18;
  objc_msgSend(v24, "eventsForAccountIdentifier:types:startDate:endDate:orderedByDate:limit:completion:", v22, v21, v20, v19, a7, a8, v27);

}

uint64_t __102__PKAccountService_eventsForAccountIdentifier_types_startDate_endDate_orderedByDate_limit_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __102__PKAccountService_eventsForAccountIdentifier_types_startDate_endDate_orderedByDate_limit_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __102__PKAccountService_eventsForAccountIdentifier_types_startDate_endDate_orderedByDate_limit_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __102__PKAccountService_eventsForAccountIdentifier_types_startDate_endDate_orderedByDate_limit_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)deleteEventsWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__PKAccountService_deleteEventsWithAccountIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __65__PKAccountService_deleteEventsWithAccountIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABEB88;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "deleteEventsWithAccountIdentifier:completion:", v10, v14);

}

uint64_t __65__PKAccountService_deleteEventsWithAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __65__PKAccountService_deleteEventsWithAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__PKAccountService_deleteEventsWithAccountIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __65__PKAccountService_deleteEventsWithAccountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)deleteEventWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__PKAccountService_deleteEventWithIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __57__PKAccountService_deleteEventWithIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABEB88;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "deleteEventWithIdentifier:completion:", v10, v14);

}

uint64_t __57__PKAccountService_deleteEventWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __57__PKAccountService_deleteEventWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__PKAccountService_deleteEventWithIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __57__PKAccountService_deleteEventWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)deleteEventsWithAccountIdentifier:(id)a3 excludingTypes:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __80__PKAccountService_deleteEventsWithAccountIdentifier_excludingTypes_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __80__PKAccountService_deleteEventsWithAccountIdentifier_excludingTypes_completion___block_invoke_2;
  v17[3] = &unk_1E2ABEB88;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "deleteEventsWithAccountIdentifier:excludingTypes:completion:", v13, v12, v17);

}

uint64_t __80__PKAccountService_deleteEventsWithAccountIdentifier_excludingTypes_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __80__PKAccountService_deleteEventsWithAccountIdentifier_excludingTypes_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__PKAccountService_deleteEventsWithAccountIdentifier_excludingTypes_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __80__PKAccountService_deleteEventsWithAccountIdentifier_excludingTypes_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)insertEvents:(id)a3 withAccountidentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__PKAccountService_insertEvents_withAccountidentifier_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __66__PKAccountService_insertEvents_withAccountidentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ABEB88;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "insertEvents:withAccountidentifier:completion:", v13, v12, v17);

}

uint64_t __66__PKAccountService_insertEvents_withAccountidentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __66__PKAccountService_insertEvents_withAccountidentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__PKAccountService_insertEvents_withAccountidentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __66__PKAccountService_insertEvents_withAccountidentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)updateCreditStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__PKAccountService_updateCreditStatementsForAccountIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __74__PKAccountService_updateCreditStatementsForAccountIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ACF9F8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "updateCreditStatementsForAccountIdentifier:completion:", v10, v14);

}

uint64_t __74__PKAccountService_updateCreditStatementsForAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __74__PKAccountService_updateCreditStatementsForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__PKAccountService_updateCreditStatementsForAccountIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __74__PKAccountService_updateCreditStatementsForAccountIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)creditStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__PKAccountService_creditStatementsForAccountIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __68__PKAccountService_creditStatementsForAccountIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ACF9F8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "creditStatementsForAccountIdentifier:completion:", v10, v14);

}

uint64_t __68__PKAccountService_creditStatementsForAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __68__PKAccountService_creditStatementsForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__PKAccountService_creditStatementsForAccountIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __68__PKAccountService_creditStatementsForAccountIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)creditStatementsForStatementIdentifiers:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __89__PKAccountService_creditStatementsForStatementIdentifiers_accountIdentifier_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __89__PKAccountService_creditStatementsForStatementIdentifiers_accountIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ACF9F8;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "creditStatementsForStatementIdentifiers:accountIdentifier:completion:", v13, v12, v17);

}

uint64_t __89__PKAccountService_creditStatementsForStatementIdentifiers_accountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __89__PKAccountService_creditStatementsForStatementIdentifiers_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__PKAccountService_creditStatementsForStatementIdentifiers_accountIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __89__PKAccountService_creditStatementsForStatementIdentifiers_accountIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)updateSavingsStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__PKAccountService_updateSavingsStatementsForAccountIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __75__PKAccountService_updateSavingsStatementsForAccountIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABE710;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "updateSavingsStatementsForAccountIdentifier:completion:", v10, v14);

}

uint64_t __75__PKAccountService_updateSavingsStatementsForAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __75__PKAccountService_updateSavingsStatementsForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__PKAccountService_updateSavingsStatementsForAccountIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __75__PKAccountService_updateSavingsStatementsForAccountIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)savingsStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__PKAccountService_savingsStatementsForAccountIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __69__PKAccountService_savingsStatementsForAccountIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABE710;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "savingsStatementsForAccountIdentifier:completion:", v10, v14);

}

uint64_t __69__PKAccountService_savingsStatementsForAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __69__PKAccountService_savingsStatementsForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__PKAccountService_savingsStatementsForAccountIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __69__PKAccountService_savingsStatementsForAccountIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)accountStatementMetadataForAllAccountsWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__PKAccountService_accountStatementMetadataForAllAccountsWithCompletion___block_invoke;
  v13[3] = &unk_1E2ABD9C8;
  v7 = v5;
  v14 = v7;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __73__PKAccountService_accountStatementMetadataForAllAccountsWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABDA90;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "accountStatementMetadataForAllAccountsWithCompletion:", v11);

}

uint64_t __73__PKAccountService_accountStatementMetadataForAllAccountsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __73__PKAccountService_accountStatementMetadataForAllAccountsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__PKAccountService_accountStatementMetadataForAllAccountsWithCompletion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __73__PKAccountService_accountStatementMetadataForAllAccountsWithCompletion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)accountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __96__PKAccountService_accountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __96__PKAccountService_accountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ADC7D8;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "accountStatementMetadataForStatementIdentifier:accountIdentifier:completion:", v13, v12, v17);

}

uint64_t __96__PKAccountService_accountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __96__PKAccountService_accountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __96__PKAccountService_accountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __96__PKAccountService_accountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)updateAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __102__PKAccountService_updateAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __102__PKAccountService_updateAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ADC7D8;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "updateAccountStatementMetadataForStatementIdentifier:accountIdentifier:completion:", v13, v12, v17);

}

uint64_t __102__PKAccountService_updateAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __102__PKAccountService_updateAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __102__PKAccountService_updateAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __102__PKAccountService_updateAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)deleteAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __102__PKAccountService_deleteAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __102__PKAccountService_deleteAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ABEB88;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "deleteAccountStatementMetadataForStatementIdentifier:accountIdentifier:completion:", v13, v12, v17);

}

uint64_t __102__PKAccountService_deleteAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __102__PKAccountService_deleteAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __102__PKAccountService_deleteAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __102__PKAccountService_deleteAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)triggerStatementMetadataProcessingForAccountIdentifier:(id)a3 statementIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __106__PKAccountService_triggerStatementMetadataProcessingForAccountIdentifier_statementIdentifier_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __106__PKAccountService_triggerStatementMetadataProcessingForAccountIdentifier_statementIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ADC7D8;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "triggerStatementMetadataProcessingForAccountIdentifier:statementIdentifier:completion:", v13, v12, v17);

}

uint64_t __106__PKAccountService_triggerStatementMetadataProcessingForAccountIdentifier_statementIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __106__PKAccountService_triggerStatementMetadataProcessingForAccountIdentifier_statementIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __106__PKAccountService_triggerStatementMetadataProcessingForAccountIdentifier_statementIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __106__PKAccountService_triggerStatementMetadataProcessingForAccountIdentifier_statementIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)updateTaxFormsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__PKAccountService_updateTaxFormsForAccountIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __66__PKAccountService_updateTaxFormsForAccountIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABE710;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "updateTaxFormsForAccountIdentifier:completion:", v10, v14);

}

uint64_t __66__PKAccountService_updateTaxFormsForAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __66__PKAccountService_updateTaxFormsForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__PKAccountService_updateTaxFormsForAccountIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __66__PKAccountService_updateTaxFormsForAccountIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)taxFormsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__PKAccountService_taxFormsForAccountIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __60__PKAccountService_taxFormsForAccountIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABE710;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "taxFormsForAccountIdentifier:completion:", v10, v14);

}

uint64_t __60__PKAccountService_taxFormsForAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __60__PKAccountService_taxFormsForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__PKAccountService_taxFormsForAccountIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __60__PKAccountService_taxFormsForAccountIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)lastRedemptionEventToDestination:(unint64_t)a3 forAccountIdentifier:(id)a4 altDSID:(id)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __93__PKAccountService_lastRedemptionEventToDestination_forAccountIdentifier_altDSID_completion___block_invoke;
  v21[3] = &unk_1E2ABD9C8;
  v13 = v11;
  v22 = v13;
  v14 = a5;
  v15 = a4;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __93__PKAccountService_lastRedemptionEventToDestination_forAccountIdentifier_altDSID_completion___block_invoke_2;
  v19[3] = &unk_1E2ADC800;
  v19[4] = self;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "lastRedemptionEventToDestination:forAccountIdentifier:altDSID:completion:", a3, v15, v14, v19);

}

uint64_t __93__PKAccountService_lastRedemptionEventToDestination_forAccountIdentifier_altDSID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __93__PKAccountService_lastRedemptionEventToDestination_forAccountIdentifier_altDSID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__PKAccountService_lastRedemptionEventToDestination_forAccountIdentifier_altDSID_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __93__PKAccountService_lastRedemptionEventToDestination_forAccountIdentifier_altDSID_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)createVirtualCard:(int64_t)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__PKAccountService_createVirtualCard_forAccountIdentifier_completion___block_invoke;
  v18[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v19 = v11;
  v12 = a4;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __70__PKAccountService_createVirtualCard_forAccountIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E2ADC828;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "createVirtualCard:forAccountIdentifier:completion:", a3, v12, v16);

}

uint64_t __70__PKAccountService_createVirtualCard_forAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

void __70__PKAccountService_createVirtualCard_forAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  _QWORD block[4];
  id v26;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __70__PKAccountService_createVirtualCard_forAccountIdentifier_completion___block_invoke_3;
  v19[3] = &unk_1E2ACA258;
  v13 = v10;
  v20 = v7;
  v21 = v8;
  v14 = *(_QWORD *)(a1 + 32);
  v22 = v9;
  v23 = v14;
  v24 = v13;
  v15 = v19;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v26 = v15;
  v16 = v9;
  v17 = v8;
  v18 = v7;
  dispatch_async(v11, block);

}

uint64_t __70__PKAccountService_createVirtualCard_forAccountIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[8];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5], a1[6]);
  return result;
}

- (void)performVirtualCardAction:(int64_t)a3 forVirtualCardIdentifier:(id)a4 forAccountIdentifier:(id)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __102__PKAccountService_performVirtualCardAction_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke;
  v21[3] = &unk_1E2ABD9C8;
  v13 = v11;
  v22 = v13;
  v14 = a5;
  v15 = a4;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __102__PKAccountService_performVirtualCardAction_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_2;
  v19[3] = &unk_1E2ADC828;
  v19[4] = self;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "performVirtualCardAction:forVirtualCardIdentifier:forAccountIdentifier:completion:", a3, v15, v14, v19);

}

uint64_t __102__PKAccountService_performVirtualCardAction_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

void __102__PKAccountService_performVirtualCardAction_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  _QWORD block[4];
  id v26;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __102__PKAccountService_performVirtualCardAction_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_3;
  v19[3] = &unk_1E2ACA258;
  v13 = v10;
  v20 = v7;
  v21 = v8;
  v14 = *(_QWORD *)(a1 + 32);
  v22 = v9;
  v23 = v14;
  v24 = v13;
  v15 = v19;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v26 = v15;
  v16 = v9;
  v17 = v8;
  v18 = v7;
  dispatch_async(v11, block);

}

uint64_t __102__PKAccountService_performVirtualCardAction_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[8];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5], a1[6]);
  return result;
}

- (void)updateVirtualCardsWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__PKAccountService_updateVirtualCardsWithAccountIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __71__PKAccountService_updateVirtualCardsWithAccountIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ADC850;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "updateVirtualCardsWithAccountIdentifier:completion:", v10, v14);

}

uint64_t __71__PKAccountService_updateVirtualCardsWithAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

void __71__PKAccountService_updateVirtualCardsWithAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  _QWORD block[4];
  id v26;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__PKAccountService_updateVirtualCardsWithAccountIdentifier_completion___block_invoke_3;
  v19[3] = &unk_1E2ACA258;
  v13 = v10;
  v20 = v7;
  v21 = v8;
  v14 = *(_QWORD *)(a1 + 32);
  v22 = v9;
  v23 = v14;
  v24 = v13;
  v15 = v19;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v26 = v15;
  v16 = v9;
  v17 = v8;
  v18 = v7;
  dispatch_async(v11, block);

}

uint64_t __71__PKAccountService_updateVirtualCardsWithAccountIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[8];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5], a1[6]);
  return result;
}

- (void)cardCredentialsForVirtualCard:(id)a3 authorization:(id)a4 action:(int64_t)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __82__PKAccountService_cardCredentialsForVirtualCard_authorization_action_completion___block_invoke;
  v21[3] = &unk_1E2ABD9C8;
  v13 = v11;
  v22 = v13;
  v14 = a4;
  v15 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __82__PKAccountService_cardCredentialsForVirtualCard_authorization_action_completion___block_invoke_2;
  v19[3] = &unk_1E2ADC878;
  v19[4] = self;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "cardCredentialsForVirtualCard:authorization:action:completion:", v15, v14, a5, v19);

}

uint64_t __82__PKAccountService_cardCredentialsForVirtualCard_authorization_action_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __82__PKAccountService_cardCredentialsForVirtualCard_authorization_action_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__PKAccountService_cardCredentialsForVirtualCard_authorization_action_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __82__PKAccountService_cardCredentialsForVirtualCard_authorization_action_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)noteVirtualCardAutoFilledBySafari:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__PKAccountService_noteVirtualCardAutoFilledBySafari_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __65__PKAccountService_noteVirtualCardAutoFilledBySafari_completion___block_invoke_2;
  v14[3] = &unk_1E2ABEB88;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "noteVirtualCardAutoFilledBySafari:completion:", v10, v14);

}

uint64_t __65__PKAccountService_noteVirtualCardAutoFilledBySafari_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __65__PKAccountService_noteVirtualCardAutoFilledBySafari_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__PKAccountService_noteVirtualCardAutoFilledBySafari_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __65__PKAccountService_noteVirtualCardAutoFilledBySafari_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)fetchKeychainCredentialForVirtualCardIdentifier:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __100__PKAccountService_fetchKeychainCredentialForVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __100__PKAccountService_fetchKeychainCredentialForVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ABEB88;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "fetchKeychainCredentialForVirtualCardIdentifier:forAccountIdentifier:completion:", v13, v12, v17);

}

uint64_t __100__PKAccountService_fetchKeychainCredentialForVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __100__PKAccountService_fetchKeychainCredentialForVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __100__PKAccountService_fetchKeychainCredentialForVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __100__PKAccountService_fetchKeychainCredentialForVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)writeVirtualCardToKeychain:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__PKAccountService_writeVirtualCardToKeychain_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __58__PKAccountService_writeVirtualCardToKeychain_completion___block_invoke_2;
  v14[3] = &unk_1E2ABE058;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "writeVirtualCardToKeychain:completion:", v10, v14);

}

uint64_t __58__PKAccountService_writeVirtualCardToKeychain_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __58__PKAccountService_writeVirtualCardToKeychain_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  _QWORD v7[5];
  id v8;
  _QWORD block[4];
  id v10;

  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__PKAccountService_writeVirtualCardToKeychain_completion___block_invoke_3;
  v7[3] = &unk_1E2ABDA18;
  v5 = v2;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v7;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v10 = v6;
  dispatch_async(v3, block);

}

uint64_t __58__PKAccountService_writeVirtualCardToKeychain_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)virtualCardsInKeychainWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__PKAccountService_virtualCardsInKeychainWithCompletion___block_invoke;
  v13[3] = &unk_1E2ABD9C8;
  v7 = v5;
  v14 = v7;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __57__PKAccountService_virtualCardsInKeychainWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABDD60;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "virtualCardsInKeychainWithCompletion:", v11);

}

uint64_t __57__PKAccountService_virtualCardsInKeychainWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __57__PKAccountService_virtualCardsInKeychainWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__PKAccountService_virtualCardsInKeychainWithCompletion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __57__PKAccountService_virtualCardsInKeychainWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)noteSecurityCodeActivityWithAction:(int64_t)a3 forSecurityCodeIdentifier:(id)a4 forVirtualCardIdentifier:(id)a5 forAccountIdentifier:(id)a6 completion:(id)a7
{
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;

  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __138__PKAccountService_noteSecurityCodeActivityWithAction_forSecurityCodeIdentifier_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke;
  v24[3] = &unk_1E2ABD9C8;
  v15 = v13;
  v25 = v15;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __138__PKAccountService_noteSecurityCodeActivityWithAction_forSecurityCodeIdentifier_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_2;
  v22[3] = &unk_1E2ADC8A0;
  v22[4] = self;
  v23 = v15;
  v21 = v15;
  objc_msgSend(v20, "noteSecurityCodeActivityWithAction:forSecurityCodeIdentifier:forVirtualCardIdentifier:forAccountIdentifier:completion:", a3, v18, v17, v16, v22);

}

uint64_t __138__PKAccountService_noteSecurityCodeActivityWithAction_forSecurityCodeIdentifier_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __138__PKAccountService_noteSecurityCodeActivityWithAction_forSecurityCodeIdentifier_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __138__PKAccountService_noteSecurityCodeActivityWithAction_forSecurityCodeIdentifier_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __138__PKAccountService_noteSecurityCodeActivityWithAction_forSecurityCodeIdentifier_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)physicalCardsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__PKAccountService_physicalCardsForAccountWithIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __69__PKAccountService_physicalCardsForAccountWithIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABDD60;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "physicalCardsForAccountWithIdentifier:completion:", v10, v14);

}

uint64_t __69__PKAccountService_physicalCardsForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __69__PKAccountService_physicalCardsForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKAccountService_physicalCardsForAccountWithIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E2ABDA68;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v7;
  v12 = v6;
  v8 = v3;
  dispatch_async(v5, block);

}

uint64_t __69__PKAccountService_physicalCardsForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)updatePhysicalCardsForAccountWithIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__PKAccountService_updatePhysicalCardsForAccountWithIdentifier_force_completion___block_invoke;
  v18[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v19 = v11;
  v12 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __81__PKAccountService_updatePhysicalCardsForAccountWithIdentifier_force_completion___block_invoke_2;
  v16[3] = &unk_1E2ACF9F8;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "updatePhysicalCardsForAccountWithIdentifier:force:completion:", v12, v5, v16);

}

uint64_t __81__PKAccountService_updatePhysicalCardsForAccountWithIdentifier_force_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __81__PKAccountService_updatePhysicalCardsForAccountWithIdentifier_force_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__PKAccountService_updatePhysicalCardsForAccountWithIdentifier_force_completion___block_invoke_3;
  v12[3] = &unk_1E2ABDB58;
  v9 = v7;
  v13 = v5;
  v14 = v6;
  v15 = *(_QWORD *)(a1 + 32);
  v16 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(v8, v12);

}

uint64_t __81__PKAccountService_updatePhysicalCardsForAccountWithIdentifier_force_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)beginPhysicalCardRequestWithOrder:(id)a3 forAccountWithIdentifier:(id)a4 accountUserAltDSID:(id)a5 deviceMetadata:(id)a6 completion:(id)a7
{
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;

  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __124__PKAccountService_beginPhysicalCardRequestWithOrder_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke;
  v25[3] = &unk_1E2ABD9C8;
  v15 = v13;
  v26 = v15;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __124__PKAccountService_beginPhysicalCardRequestWithOrder_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke_2;
  v23[3] = &unk_1E2ADC8C8;
  v23[4] = self;
  v24 = v15;
  v22 = v15;
  objc_msgSend(v21, "beginPhysicalCardRequestWithOrder:forAccountWithIdentifier:accountUserAltDSID:deviceMetadata:completion:", v19, v18, v17, v16, v23);

}

uint64_t __124__PKAccountService_beginPhysicalCardRequestWithOrder_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, 0, 0, a2);
  return result;
}

void __124__PKAccountService_beginPhysicalCardRequestWithOrder_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  _QWORD block[4];
  id v36;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = *(void **)(a1 + 40);
  v17 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v18 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __124__PKAccountService_beginPhysicalCardRequestWithOrder_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke_3;
  v27[3] = &unk_1E2AC3EE8;
  v19 = v16;
  v28 = v11;
  v29 = v12;
  v30 = v13;
  v31 = v14;
  v20 = *(_QWORD *)(a1 + 32);
  v32 = v15;
  v33 = v20;
  v34 = v19;
  v21 = v27;
  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v36 = v21;
  v22 = v15;
  v23 = v14;
  v24 = v13;
  v25 = v12;
  v26 = v11;
  dispatch_async(v17, block);

}

uint64_t __124__PKAccountService_beginPhysicalCardRequestWithOrder_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[10];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5], a1[6], a1[7], a1[8]);
  return result;
}

- (void)completePhysicalCardRequest:(id)a3 withSignature:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73__PKAccountService_completePhysicalCardRequest_withSignature_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __73__PKAccountService_completePhysicalCardRequest_withSignature_completion___block_invoke_2;
  v17[3] = &unk_1E2ADC8F0;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "completePhysicalCardRequest:withSignature:completion:", v13, v12, v17);

}

uint64_t __73__PKAccountService_completePhysicalCardRequest_withSignature_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

void __73__PKAccountService_completePhysicalCardRequest_withSignature_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  _QWORD block[4];
  id v26;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73__PKAccountService_completePhysicalCardRequest_withSignature_completion___block_invoke_3;
  v19[3] = &unk_1E2ACA258;
  v13 = v10;
  v20 = v7;
  v21 = v8;
  v14 = *(_QWORD *)(a1 + 32);
  v22 = v9;
  v23 = v14;
  v24 = v13;
  v15 = v19;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v26 = v15;
  v16 = v9;
  v17 = v8;
  v18 = v7;
  dispatch_async(v11, block);

}

uint64_t __73__PKAccountService_completePhysicalCardRequest_withSignature_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[8];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5], a1[6]);
  return result;
}

- (void)beginPhysicalCardAction:(id)a3 onPhysicalCardWithIdentifier:(id)a4 forAccountWithIdentifier:(id)a5 accountUserAltDSID:(id)a6 deviceMetadata:(id)a7 completion:(id)a8
{
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[4];
  id v29;

  v15 = a8;
  v16 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __143__PKAccountService_beginPhysicalCardAction_onPhysicalCardWithIdentifier_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke;
  v28[3] = &unk_1E2ABD9C8;
  v17 = v15;
  v29 = v17;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = v16;
  v26[1] = 3221225472;
  v26[2] = __143__PKAccountService_beginPhysicalCardAction_onPhysicalCardWithIdentifier_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke_2;
  v26[3] = &unk_1E2ADC918;
  v26[4] = self;
  v27 = v17;
  v25 = v17;
  objc_msgSend(v24, "beginPhysicalCardAction:onPhysicalCardWithIdentifier:forAccountWithIdentifier:accountUserAltDSID:deviceMetadata:completion:", v22, v21, v20, v19, v18, v26);

}

uint64_t __143__PKAccountService_beginPhysicalCardAction_onPhysicalCardWithIdentifier_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, 0, 0, a2);
  return result;
}

void __143__PKAccountService_beginPhysicalCardAction_onPhysicalCardWithIdentifier_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  _QWORD block[4];
  id v36;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = *(void **)(a1 + 40);
  v17 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v18 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __143__PKAccountService_beginPhysicalCardAction_onPhysicalCardWithIdentifier_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke_3;
  v27[3] = &unk_1E2AC3EE8;
  v19 = v16;
  v28 = v11;
  v29 = v12;
  v30 = v13;
  v31 = v14;
  v20 = *(_QWORD *)(a1 + 32);
  v32 = v15;
  v33 = v20;
  v34 = v19;
  v21 = v27;
  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v36 = v21;
  v22 = v15;
  v23 = v14;
  v24 = v13;
  v25 = v12;
  v26 = v11;
  dispatch_async(v17, block);

}

uint64_t __143__PKAccountService_beginPhysicalCardAction_onPhysicalCardWithIdentifier_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[10];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5], a1[6], a1[7], a1[8]);
  return result;
}

- (void)completePhysicalCardActionRequest:(id)a3 withSignature:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __79__PKAccountService_completePhysicalCardActionRequest_withSignature_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __79__PKAccountService_completePhysicalCardActionRequest_withSignature_completion___block_invoke_2;
  v17[3] = &unk_1E2ADC850;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "completePhysicalCardActionRequest:withSignature:completion:", v13, v12, v17);

}

uint64_t __79__PKAccountService_completePhysicalCardActionRequest_withSignature_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

void __79__PKAccountService_completePhysicalCardActionRequest_withSignature_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  _QWORD block[4];
  id v26;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __79__PKAccountService_completePhysicalCardActionRequest_withSignature_completion___block_invoke_3;
  v19[3] = &unk_1E2ACA258;
  v13 = v10;
  v20 = v7;
  v21 = v8;
  v14 = *(_QWORD *)(a1 + 32);
  v22 = v9;
  v23 = v14;
  v24 = v13;
  v15 = v19;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v26 = v15;
  v16 = v9;
  v17 = v8;
  v18 = v7;
  dispatch_async(v11, block);

}

uint64_t __79__PKAccountService_completePhysicalCardActionRequest_withSignature_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[8];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5], a1[6]);
  return result;
}

- (void)activateBroadwayPhysicalCardWithActivationCode:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__PKAccountService_activateBroadwayPhysicalCardWithActivationCode_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __78__PKAccountService_activateBroadwayPhysicalCardWithActivationCode_completion___block_invoke_2;
  v14[3] = &unk_1E2ABDCE8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "activatePhysicalCardWithActivationCode:completion:", v10, v14);

}

uint64_t __78__PKAccountService_activateBroadwayPhysicalCardWithActivationCode_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __78__PKAccountService_activateBroadwayPhysicalCardWithActivationCode_completion___block_invoke_2(uint64_t a1, char a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;
  char v11;
  _QWORD block[4];
  id v13;

  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__PKAccountService_activateBroadwayPhysicalCardWithActivationCode_completion___block_invoke_3;
  v9[3] = &unk_1E2ABDAB8;
  v7 = v4;
  v11 = a2;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v8 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v13 = v8;
  dispatch_async(v5, block);

}

uint64_t __78__PKAccountService_activateBroadwayPhysicalCardWithActivationCode_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)inactivePhysicalCardForFeatureIdentifier:(unint64_t)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__PKAccountService_inactivePhysicalCardForFeatureIdentifier_completion___block_invoke;
  v15[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v16 = v9;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __72__PKAccountService_inactivePhysicalCardForFeatureIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E2ADC940;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "inactivatePhysicalCardForFeatureIdentifier:completion:", a3, v13);

}

uint64_t __72__PKAccountService_inactivePhysicalCardForFeatureIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __72__PKAccountService_inactivePhysicalCardForFeatureIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__PKAccountService_inactivePhysicalCardForFeatureIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __72__PKAccountService_inactivePhysicalCardForFeatureIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)physicalCardForFeatureIdentifier:(unint64_t)a3 activationCode:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __79__PKAccountService_physicalCardForFeatureIdentifier_activationCode_completion___block_invoke;
  v18[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v19 = v11;
  v12 = a4;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __79__PKAccountService_physicalCardForFeatureIdentifier_activationCode_completion___block_invoke_2;
  v16[3] = &unk_1E2ADC940;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "physicalCardForFeatureIdentifier:activationCode:completion:", a3, v12, v16);

}

uint64_t __79__PKAccountService_physicalCardForFeatureIdentifier_activationCode_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __79__PKAccountService_physicalCardForFeatureIdentifier_activationCode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__PKAccountService_physicalCardForFeatureIdentifier_activationCode_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __79__PKAccountService_physicalCardForFeatureIdentifier_activationCode_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)activatePhysicalCard:(id)a3 withActivationCode:(id)a4 forFeatureIdentifier:(unint64_t)a5 completion:(id)a6
{
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;

  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __92__PKAccountService_activatePhysicalCard_withActivationCode_forFeatureIdentifier_completion___block_invoke;
  v21[3] = &unk_1E2ABD9C8;
  v12 = v10;
  v22 = v12;
  v13 = a4;
  v14 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __92__PKAccountService_activatePhysicalCard_withActivationCode_forFeatureIdentifier_completion___block_invoke_2;
  v19[3] = &unk_1E2AC3EC0;
  v19[4] = self;
  v20 = v12;
  v18 = v12;
  objc_msgSend(v16, "activatePhysicalCardWithIdentifier:activationCode:completion:", v17, v13, v19);

}

uint64_t __92__PKAccountService_activatePhysicalCard_withActivationCode_forFeatureIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 3);
  return result;
}

void __92__PKAccountService_activatePhysicalCard_withActivationCode_forFeatureIdentifier_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  _QWORD block[4];
  id v12;

  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__PKAccountService_activatePhysicalCard_withActivationCode_forFeatureIdentifier_completion___block_invoke_3;
  v8[3] = &unk_1E2ABDBD0;
  v9 = v4;
  v10 = a2;
  v8[4] = *(_QWORD *)(a1 + 32);
  v7 = v8;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  dispatch_async(v5, block);

}

uint64_t __92__PKAccountService_activatePhysicalCard_withActivationCode_forFeatureIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

- (void)processPhysicalCardExpirationMessaging:(id)a3 physicalCards:(id)a4 account:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "processPhysicalCardExpirationMessaging:physicalCards:account:", v11, v10, v9);
}

- (void)billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:(id)a3 withStatementIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __120__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStatementIdentifier_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __120__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStatementIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ABE710;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:withStatementIdentifier:completion:", v13, v12, v17);

}

uint64_t __120__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStatementIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __120__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStatementIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __120__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStatementIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __120__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStatementIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:(id)a3 withStartDate:(id)a4 endDate:(id)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __118__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStartDate_endDate_completion___block_invoke;
  v22[3] = &unk_1E2ABD9C8;
  v13 = v11;
  v23 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __118__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStartDate_endDate_completion___block_invoke_2;
  v20[3] = &unk_1E2ABE710;
  v20[4] = self;
  v21 = v13;
  v19 = v13;
  objc_msgSend(v18, "billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:withStartDate:endDate:completion:", v16, v15, v14, v20);

}

uint64_t __118__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStartDate_endDate_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __118__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStartDate_endDate_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __118__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStartDate_endDate_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __118__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStartDate_endDate_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)scheduledPaymentsWithAccountIdentifier:(id)a3 includeFailedRecurringPayments:(BOOL)a4 allowFetchFromServer:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;

  v6 = a5;
  v7 = a4;
  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __122__PKAccountService_scheduledPaymentsWithAccountIdentifier_includeFailedRecurringPayments_allowFetchFromServer_completion___block_invoke;
  v20[3] = &unk_1E2ABD9C8;
  v13 = v11;
  v21 = v13;
  v14 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __122__PKAccountService_scheduledPaymentsWithAccountIdentifier_includeFailedRecurringPayments_allowFetchFromServer_completion___block_invoke_2;
  v18[3] = &unk_1E2ABE710;
  v18[4] = self;
  v19 = v13;
  v17 = v13;
  objc_msgSend(v16, "scheduledPaymentsWithAccountIdentifier:includeFailedRecurringPayments:allowFetchFromServer:completion:", v14, v7, v6, v18);

}

uint64_t __122__PKAccountService_scheduledPaymentsWithAccountIdentifier_includeFailedRecurringPayments_allowFetchFromServer_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __122__PKAccountService_scheduledPaymentsWithAccountIdentifier_includeFailedRecurringPayments_allowFetchFromServer_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __122__PKAccountService_scheduledPaymentsWithAccountIdentifier_includeFailedRecurringPayments_allowFetchFromServer_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __122__PKAccountService_scheduledPaymentsWithAccountIdentifier_includeFailedRecurringPayments_allowFetchFromServer_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)scheduledPaymentsWithAccountIdentifier:(id)a3 includeFailedRecurringPayments:(BOOL)a4 completion:(id)a5
{
  -[PKAccountService scheduledPaymentsWithAccountIdentifier:includeFailedRecurringPayments:allowFetchFromServer:completion:](self, "scheduledPaymentsWithAccountIdentifier:includeFailedRecurringPayments:allowFetchFromServer:completion:", a3, a4, 1, a5);
}

- (void)updateScheduledPaymentsWithAccount:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__PKAccountService_updateScheduledPaymentsWithAccount_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __66__PKAccountService_updateScheduledPaymentsWithAccount_completion___block_invoke_2;
  v14[3] = &unk_1E2ABE710;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "updateScheduledPaymentsWithAccount:completion:", v10, v14);

}

uint64_t __66__PKAccountService_updateScheduledPaymentsWithAccount_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __66__PKAccountService_updateScheduledPaymentsWithAccount_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__PKAccountService_updateScheduledPaymentsWithAccount_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __66__PKAccountService_updateScheduledPaymentsWithAccount_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)markUserViewedIntroduction:(BOOL)a3 forInstallmentIdentifiers:(id)a4 accountIdentifier:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v6 = a3;
  v9 = a5;
  v10 = a4;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__PKAccountService_markUserViewedIntroduction_forInstallmentIdentifiers_accountIdentifier___block_invoke;
  v13[3] = &unk_1E2AC0EF0;
  v13[4] = self;
  objc_msgSend(v12, "markUserViewedIntroduction:forInstallmentIdentifiers:accountIdentifier:completion:", v6, v10, v9, v13);

}

void __91__PKAccountService_markUserViewedIntroduction_forInstallmentIdentifiers_accountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 40);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__PKAccountService_markUserViewedIntroduction_forInstallmentIdentifiers_accountIdentifier___block_invoke_2;
  v9[3] = &unk_1E2ABE0D0;
  v10 = v3;
  v11 = v4;
  v7 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v13 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

void __91__PKAccountService_markUserViewedIntroduction_forInstallmentIdentifiers_accountIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = v1;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Error in markBillPaymentInstallmentInterstitialViewedForInstallment: %@", (uint8_t *)&v3, 0xCu);
    }

  }
}

- (void)exportTransactionDataForAccountIdentifier:(id)a3 withFileFormat:(id)a4 beginDate:(id)a5 endDate:(id)a6 productTimeZone:(id)a7 completion:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;

  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __122__PKAccountService_exportTransactionDataForAccountIdentifier_withFileFormat_beginDate_endDate_productTimeZone_completion___block_invoke;
  v24[3] = &unk_1E2ADC968;
  v24[4] = self;
  v25 = v15;
  v23 = v15;
  objc_msgSend(v22, "exportTransactionDataForAccountIdentifier:withFileFormat:beginDate:endDate:productTimeZone:completion:", v20, v19, v18, v17, v16, v24);

}

void __122__PKAccountService_exportTransactionDataForAccountIdentifier_withFileFormat_beginDate_endDate_productTimeZone_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __122__PKAccountService_exportTransactionDataForAccountIdentifier_withFileFormat_beginDate_endDate_productTimeZone_completion___block_invoke_2;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __122__PKAccountService_exportTransactionDataForAccountIdentifier_withFileFormat_beginDate_endDate_productTimeZone_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)sharedAccountCloudStoreWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v7 = a4;
  v8 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__PKAccountService_sharedAccountCloudStoreWithAccountIdentifier_completion___block_invoke;
  v12[3] = &unk_1E2ADC990;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "sharedAccountCloudStoreWithAccountIdentifier:completion:", v8, v12);

}

void __76__PKAccountService_sharedAccountCloudStoreWithAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__PKAccountService_sharedAccountCloudStoreWithAccountIdentifier_completion___block_invoke_2;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __76__PKAccountService_sharedAccountCloudStoreWithAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)updateSharedAccountCloudStoreWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v7 = a4;
  v8 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__PKAccountService_updateSharedAccountCloudStoreWithAccountIdentifier_completion___block_invoke;
  v12[3] = &unk_1E2ADC9B8;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "updateSharedAccountCloudStoreWithAccountIdentifier:completion:", v8, v12);

}

void __82__PKAccountService_updateSharedAccountCloudStoreWithAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__PKAccountService_updateSharedAccountCloudStoreWithAccountIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __82__PKAccountService_updateSharedAccountCloudStoreWithAccountIdentifier_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)didAddAccountPendingFamilyMembers:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "didAddAccountPendingFamilyMembers:", v5);
}

- (void)accountPendingFamilyMembersForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v7 = a4;
  v8 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__PKAccountService_accountPendingFamilyMembersForAccountIdentifier_completion___block_invoke;
  v12[3] = &unk_1E2ABE710;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "accountPendingFamilyMembersForAccountIdentifier:completion:", v8, v12);

}

void __79__PKAccountService_accountPendingFamilyMembersForAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__PKAccountService_accountPendingFamilyMembersForAccountIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __79__PKAccountService_accountPendingFamilyMembersForAccountIdentifier_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (id)accountBalancesForAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__83;
  v21 = __Block_byref_object_dispose__83;
  v22 = 0;
  -[PKAccountService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_48_0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__PKAccountService_accountBalancesForAccountIdentifier_startDate_endDate_type___block_invoke_49;
  v16[3] = &unk_1E2ACFF20;
  v16[4] = self;
  v16[5] = &v17;
  objc_msgSend(v13, "accountBalancesForAccountIdentifier:startDate:endDate:type:completion:", v10, v11, v12, a6, v16);
  v14 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v14;
}

void __79__PKAccountService_accountBalancesForAccountIdentifier_startDate_endDate_type___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "XPC Error fetching balances %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

void __79__PKAccountService_accountBalancesForAccountIdentifier_startDate_endDate_type___block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Error fetching balances %@", (uint8_t *)&v10, 0xCu);
    }

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

- (void)updateAccountBalancesForAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;

  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __96__PKAccountService_updateAccountBalancesForAccountIdentifier_startDate_endDate_type_completion___block_invoke;
  v20[3] = &unk_1E2ABE710;
  v20[4] = self;
  v21 = v13;
  v19 = v13;
  objc_msgSend(v18, "updateAccountBalancesForAccountIdentifier:startDate:endDate:type:completion:", v16, v15, v14, a6, v20);

}

void __96__PKAccountService_updateAccountBalancesForAccountIdentifier_startDate_endDate_type_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __96__PKAccountService_updateAccountBalancesForAccountIdentifier_startDate_endDate_type_completion___block_invoke_2;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __96__PKAccountService_updateAccountBalancesForAccountIdentifier_startDate_endDate_type_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)resetAccountBalancesForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v7 = a4;
  v8 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__PKAccountService_resetAccountBalancesForAccountIdentifier_completion___block_invoke;
  v12[3] = &unk_1E2ABEB88;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "resetAccountBalancesForAccountIdentifier:completion:", v8, v12);

}

void __72__PKAccountService_resetAccountBalancesForAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__PKAccountService_resetAccountBalancesForAccountIdentifier_completion___block_invoke_2;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __72__PKAccountService_resetAccountBalancesForAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)attemptAppleBalanceSetupWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__PKAccountService_attemptAppleBalanceSetupWithCompletion___block_invoke;
  v13[3] = &unk_1E2ABD9C8;
  v7 = v5;
  v14 = v7;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __59__PKAccountService_attemptAppleBalanceSetupWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABEB88;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "attemptAppleBalanceSetupWithCompletion:", v11);

}

uint64_t __59__PKAccountService_attemptAppleBalanceSetupWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __59__PKAccountService_attemptAppleBalanceSetupWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__PKAccountService_attemptAppleBalanceSetupWithCompletion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __59__PKAccountService_attemptAppleBalanceSetupWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)attemptAppleStoredValueSetupWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__PKAccountService_attemptAppleStoredValueSetupWithCompletion___block_invoke;
  v13[3] = &unk_1E2ABD9C8;
  v7 = v5;
  v14 = v7;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __63__PKAccountService_attemptAppleStoredValueSetupWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABEB88;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "attemptAppleBalanceSetupWithCompletion:", v11);

}

uint64_t __63__PKAccountService_attemptAppleStoredValueSetupWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __63__PKAccountService_attemptAppleStoredValueSetupWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__PKAccountService_attemptAppleStoredValueSetupWithCompletion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __63__PKAccountService_attemptAppleStoredValueSetupWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)validateAppleBalanceSecurityRequirementsWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__PKAccountService_validateAppleBalanceSecurityRequirementsWithCompletion___block_invoke;
  v13[3] = &unk_1E2ABD9C8;
  v7 = v5;
  v14 = v7;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __75__PKAccountService_validateAppleBalanceSecurityRequirementsWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABDAE0;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "validateAppleBalanceSecurityRequirementsWithCompletion:", v11);

}

uint64_t __75__PKAccountService_validateAppleBalanceSecurityRequirementsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __75__PKAccountService_validateAppleBalanceSecurityRequirementsWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  char v17;
  _QWORD block[4];
  id v19;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__PKAccountService_validateAppleBalanceSecurityRequirementsWithCompletion___block_invoke_3;
  v13[3] = &unk_1E2ABDC70;
  v9 = v6;
  v17 = a2;
  v10 = *(_QWORD *)(a1 + 32);
  v14 = v5;
  v15 = v10;
  v16 = v9;
  v11 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v19 = v11;
  v12 = v5;
  dispatch_async(v7, block);

}

uint64_t __75__PKAccountService_validateAppleBalanceSecurityRequirementsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__PKAccountService_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __75__PKAccountService_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke_2;
  v14[3] = &unk_1E2ABDCE8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "triggerCloudStoreZoneCreationForAccount:withCompletion:", v10, v14);

}

uint64_t __75__PKAccountService_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __75__PKAccountService_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke_2(uint64_t a1, char a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;
  char v11;
  _QWORD block[4];
  id v13;

  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__PKAccountService_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke_3;
  v9[3] = &unk_1E2ABDAB8;
  v7 = v4;
  v11 = a2;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v8 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v13 = v8;
  dispatch_async(v5, block);

}

uint64_t __75__PKAccountService_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)backgroundProvisionInProgressForFeature:(unint64_t)a3 withCompletion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__PKAccountService_backgroundProvisionInProgressForFeature_withCompletion___block_invoke;
  v15[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v16 = v9;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __75__PKAccountService_backgroundProvisionInProgressForFeature_withCompletion___block_invoke_2;
  v13[3] = &unk_1E2ABDCE8;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "backgroundProvisionInProgressForFeature:withCompletion:", a3, v13);

}

uint64_t __75__PKAccountService_backgroundProvisionInProgressForFeature_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __75__PKAccountService_backgroundProvisionInProgressForFeature_withCompletion___block_invoke_2(uint64_t a1, char a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;
  char v11;
  _QWORD block[4];
  id v13;

  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__PKAccountService_backgroundProvisionInProgressForFeature_withCompletion___block_invoke_3;
  v9[3] = &unk_1E2ABDAB8;
  v7 = v4;
  v11 = a2;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v8 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v13 = v8;
  dispatch_async(v5, block);

}

uint64_t __75__PKAccountService_backgroundProvisionInProgressForFeature_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)invalidateTopUpTokenWithIdentifier:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __91__PKAccountService_invalidateTopUpTokenWithIdentifier_forAccountWithIdentifier_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __91__PKAccountService_invalidateTopUpTokenWithIdentifier_forAccountWithIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ABEB88;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "invalidateTopUpTokenWithIdentifier:forAccountWithIdentifier:completion:", v13, v12, v17);

}

uint64_t __91__PKAccountService_invalidateTopUpTokenWithIdentifier_forAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __91__PKAccountService_invalidateTopUpTokenWithIdentifier_forAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91__PKAccountService_invalidateTopUpTokenWithIdentifier_forAccountWithIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __91__PKAccountService_invalidateTopUpTokenWithIdentifier_forAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)appleBalancePromotionForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__PKAccountService_appleBalancePromotionForAccountWithIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __77__PKAccountService_appleBalancePromotionForAccountWithIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ADC9E0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "appleBalancePromotionForAccountWithIdentifier:completion:", v10, v14);

}

uint64_t __77__PKAccountService_appleBalancePromotionForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __77__PKAccountService_appleBalancePromotionForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__PKAccountService_appleBalancePromotionForAccountWithIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __77__PKAccountService_appleBalancePromotionForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)deleteAppleBalancePromotionForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__PKAccountService_deleteAppleBalancePromotionForAccountWithIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __83__PKAccountService_deleteAppleBalancePromotionForAccountWithIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABEB88;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "deleteAppleBalancePromotionForAccountWithIdentifier:completion:", v10, v14);

}

uint64_t __83__PKAccountService_deleteAppleBalancePromotionForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __83__PKAccountService_deleteAppleBalancePromotionForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__PKAccountService_deleteAppleBalancePromotionForAccountWithIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __83__PKAccountService_deleteAppleBalancePromotionForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)inStoreTopUpTokenForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__PKAccountService_inStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __73__PKAccountService_inStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ADCA08;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "inStoreTopUpTokenForAccountWithIdentifier:completion:", v10, v14);

}

uint64_t __73__PKAccountService_inStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __73__PKAccountService_inStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PKAccountService_inStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __73__PKAccountService_inStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)insertOrUpdateInStoreTopUpToken:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81__PKAccountService_insertOrUpdateInStoreTopUpToken_accountIdentifier_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __81__PKAccountService_insertOrUpdateInStoreTopUpToken_accountIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ABEB88;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "insertOrUpdateInStoreTopUpToken:accountIdentifier:completion:", v13, v12, v17);

}

uint64_t __81__PKAccountService_insertOrUpdateInStoreTopUpToken_accountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __81__PKAccountService_insertOrUpdateInStoreTopUpToken_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__PKAccountService_insertOrUpdateInStoreTopUpToken_accountIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __81__PKAccountService_insertOrUpdateInStoreTopUpToken_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)deleteInStoreTopUpTokenForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__PKAccountService_deleteInStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __79__PKAccountService_deleteInStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABEB88;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "deleteInStoreTopUpTokenForAccountWithIdentifier:completion:", v10, v14);

}

uint64_t __79__PKAccountService_deleteInStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __79__PKAccountService_deleteInStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__PKAccountService_deleteInStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __79__PKAccountService_deleteInStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)dailyCashEligibleDestinationsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__PKAccountService_dailyCashEligibleDestinationsForAccountWithIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __85__PKAccountService_dailyCashEligibleDestinationsForAccountWithIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ADCA30;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "dailyCashEligibleDestinationsForAccountWithIdentifier:completion:", v10, v14);

}

uint64_t __85__PKAccountService_dailyCashEligibleDestinationsForAccountWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __85__PKAccountService_dailyCashEligibleDestinationsForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__PKAccountService_dailyCashEligibleDestinationsForAccountWithIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __85__PKAccountService_dailyCashEligibleDestinationsForAccountWithIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)accountHoldsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__PKAccountService_accountHoldsForAccountIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __64__PKAccountService_accountHoldsForAccountIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABE710;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "accountHoldsForAccountIdentifier:completion:", v10, v14);

}

uint64_t __64__PKAccountService_accountHoldsForAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __64__PKAccountService_accountHoldsForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__PKAccountService_accountHoldsForAccountIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __64__PKAccountService_accountHoldsForAccountIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)rewardsTierSummaryForTransactionSourceIdentifiers:(id)a3 currencyCode:(id)a4 startDate:(id)a5 endDate:(id)a6 completion:(id)a7
{
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;

  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __112__PKAccountService_rewardsTierSummaryForTransactionSourceIdentifiers_currencyCode_startDate_endDate_completion___block_invoke;
  v25[3] = &unk_1E2ABD9C8;
  v15 = v13;
  v26 = v15;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __112__PKAccountService_rewardsTierSummaryForTransactionSourceIdentifiers_currencyCode_startDate_endDate_completion___block_invoke_2;
  v23[3] = &unk_1E2ADCA58;
  v23[4] = self;
  v24 = v15;
  v22 = v15;
  objc_msgSend(v21, "rewardsTierSummaryForTransactionSourceIdentifiers:currencyCode:startDate:endDate:completion:", v19, v18, v17, v16, v23);

}

uint64_t __112__PKAccountService_rewardsTierSummaryForTransactionSourceIdentifiers_currencyCode_startDate_endDate_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __112__PKAccountService_rewardsTierSummaryForTransactionSourceIdentifiers_currencyCode_startDate_endDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __112__PKAccountService_rewardsTierSummaryForTransactionSourceIdentifiers_currencyCode_startDate_endDate_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __112__PKAccountService_rewardsTierSummaryForTransactionSourceIdentifiers_currencyCode_startDate_endDate_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 observeCooldownPeriod:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __101__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_observeCooldownPeriod_completion___block_invoke;
  v18[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v19 = v11;
  v12 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __101__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_observeCooldownPeriod_completion___block_invoke_2;
  v16[3] = &unk_1E2ABE710;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "updateAccountPromotionsForAccountWithIdentifier:observeCooldownPeriod:completion:", v12, v5, v16);

}

uint64_t __101__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_observeCooldownPeriod_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __101__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_observeCooldownPeriod_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __101__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_observeCooldownPeriod_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __101__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_observeCooldownPeriod_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  -[PKAccountService updateAccountPromotionsForAccountWithIdentifier:observeCooldownPeriod:completion:](self, "updateAccountPromotionsForAccountWithIdentifier:observeCooldownPeriod:completion:", a3, 0, a4);
}

- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 observeCooldownPeriod:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;

  v6 = a5;
  v7 = a4;
  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __120__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_ignoreErrorBackoff_observeCooldownPeriod_completion___block_invoke;
  v20[3] = &unk_1E2ABD9C8;
  v13 = v11;
  v21 = v13;
  v14 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __120__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_ignoreErrorBackoff_observeCooldownPeriod_completion___block_invoke_2;
  v18[3] = &unk_1E2ABE710;
  v18[4] = self;
  v19 = v13;
  v17 = v13;
  objc_msgSend(v16, "updateAccountPromotionsForAccountWithIdentifier:ignoreErrorBackoff:observeCooldownPeriod:completion:", v14, v7, v6, v18);

}

uint64_t __120__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_ignoreErrorBackoff_observeCooldownPeriod_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __120__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_ignoreErrorBackoff_observeCooldownPeriod_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __120__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_ignoreErrorBackoff_observeCooldownPeriod_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __120__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_ignoreErrorBackoff_observeCooldownPeriod_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)insertOrUpdateAccountPromotions:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81__PKAccountService_insertOrUpdateAccountPromotions_accountIdentifier_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __81__PKAccountService_insertOrUpdateAccountPromotions_accountIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ABEB88;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "insertOrUpdateAccountPromotions:accountIdentifier:completion:", v13, v12, v17);

}

uint64_t __81__PKAccountService_insertOrUpdateAccountPromotions_accountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __81__PKAccountService_insertOrUpdateAccountPromotions_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__PKAccountService_insertOrUpdateAccountPromotions_accountIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __81__PKAccountService_insertOrUpdateAccountPromotions_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)accountPromotionsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__PKAccountService_accountPromotionsForAccountWithIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __73__PKAccountService_accountPromotionsForAccountWithIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABDE50;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "accountPromotionsForAccountWithIdentifier:completion:", v10, v14);

}

uint64_t __73__PKAccountService_accountPromotionsForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __73__PKAccountService_accountPromotionsForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PKAccountService_accountPromotionsForAccountWithIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __73__PKAccountService_accountPromotionsForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)deleteAccountPromotion:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __79__PKAccountService_deleteAccountPromotion_forAccountWithIdentifier_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __79__PKAccountService_deleteAccountPromotion_forAccountWithIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ABEB88;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "deleteAccountPromotion:forAccountWithIdentifier:completion:", v13, v12, v17);

}

uint64_t __79__PKAccountService_deleteAccountPromotion_forAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __79__PKAccountService_deleteAccountPromotion_forAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__PKAccountService_deleteAccountPromotion_forAccountWithIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __79__PKAccountService_deleteAccountPromotion_forAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)updateImpressionCountsForPromotions:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __85__PKAccountService_updateImpressionCountsForPromotions_accountIdentifier_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __85__PKAccountService_updateImpressionCountsForPromotions_accountIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ABEB88;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "updateImpressionCountsForPromotions:accountIdentifier:completion:", v13, v12, v17);

}

uint64_t __85__PKAccountService_updateImpressionCountsForPromotions_accountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __85__PKAccountService_updateImpressionCountsForPromotions_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__PKAccountService_updateImpressionCountsForPromotions_accountIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __85__PKAccountService_updateImpressionCountsForPromotions_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)updateImpressionCount:(int64_t)a3 promotionProgramIdentifier:(id)a4 accountIdentifier:(id)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __98__PKAccountService_updateImpressionCount_promotionProgramIdentifier_accountIdentifier_completion___block_invoke;
  v21[3] = &unk_1E2ABD9C8;
  v13 = v11;
  v22 = v13;
  v14 = a5;
  v15 = a4;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __98__PKAccountService_updateImpressionCount_promotionProgramIdentifier_accountIdentifier_completion___block_invoke_2;
  v19[3] = &unk_1E2ABEB88;
  v19[4] = self;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "updateImpressionCount:promotionProgramIdentifier:accountIdentifier:completion:", a3, v15, v14, v19);

}

uint64_t __98__PKAccountService_updateImpressionCount_promotionProgramIdentifier_accountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __98__PKAccountService_updateImpressionCount_promotionProgramIdentifier_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __98__PKAccountService_updateImpressionCount_promotionProgramIdentifier_accountIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __98__PKAccountService_updateImpressionCount_promotionProgramIdentifier_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)accountPromotionBehaviorForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__PKAccountService_accountPromotionBehaviorForAccountWithIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __80__PKAccountService_accountPromotionBehaviorForAccountWithIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ADCA80;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "accountPromotionBehaviorForAccountWithIdentifier:completion:", v10, v14);

}

uint64_t __80__PKAccountService_accountPromotionBehaviorForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __80__PKAccountService_accountPromotionBehaviorForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__PKAccountService_accountPromotionBehaviorForAccountWithIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __80__PKAccountService_accountPromotionBehaviorForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 cooldownLevel:(unint64_t)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __100__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_cooldownLevel_completion___block_invoke;
  v18[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v19 = v11;
  v12 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __100__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_cooldownLevel_completion___block_invoke_2;
  v16[3] = &unk_1E2ABE710;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "updateAccountEnhancedMerchantsForAccountWithIdentifier:cooldownLevel:completion:", v12, a4, v16);

}

uint64_t __100__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_cooldownLevel_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __100__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_cooldownLevel_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __100__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_cooldownLevel_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __100__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_cooldownLevel_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  -[PKAccountService updateAccountEnhancedMerchantsForAccountWithIdentifier:cooldownLevel:completion:](self, "updateAccountEnhancedMerchantsForAccountWithIdentifier:cooldownLevel:completion:", a3, 0, a4);
}

- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 cooldownLevel:(unint64_t)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;

  v7 = a4;
  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __119__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_ignoreErrorBackoff_cooldownLevel_completion___block_invoke;
  v20[3] = &unk_1E2ABD9C8;
  v13 = v11;
  v21 = v13;
  v14 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __119__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_ignoreErrorBackoff_cooldownLevel_completion___block_invoke_2;
  v18[3] = &unk_1E2ADCAA8;
  v18[4] = self;
  v19 = v13;
  v17 = v13;
  objc_msgSend(v16, "updateAccountEnhancedMerchantsForAccountWithIdentifier:ignoreErrorBackoff:cooldownLevel:completion:", v14, v7, a5, v18);

}

uint64_t __119__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_ignoreErrorBackoff_cooldownLevel_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, _QWORD))(result + 16))(result, 0, a2, 0);
  return result;
}

void __119__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_ignoreErrorBackoff_cooldownLevel_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  _QWORD block[4];
  id v26;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __119__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_ignoreErrorBackoff_cooldownLevel_completion___block_invoke_3;
  v19[3] = &unk_1E2ACA258;
  v13 = v10;
  v20 = v7;
  v21 = v8;
  v14 = *(_QWORD *)(a1 + 32);
  v22 = v9;
  v23 = v14;
  v24 = v13;
  v15 = v19;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v26 = v15;
  v16 = v9;
  v17 = v8;
  v18 = v7;
  dispatch_async(v11, block);

}

uint64_t __119__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_ignoreErrorBackoff_cooldownLevel_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[8];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5], a1[6]);
  return result;
}

- (void)insertOrUpdateAccountEnhancedMerchants:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __88__PKAccountService_insertOrUpdateAccountEnhancedMerchants_accountIdentifier_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __88__PKAccountService_insertOrUpdateAccountEnhancedMerchants_accountIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ABEB88;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "insertOrUpdateAccountEnhancedMerchants:accountIdentifier:completion:", v13, v12, v17);

}

uint64_t __88__PKAccountService_insertOrUpdateAccountEnhancedMerchants_accountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __88__PKAccountService_insertOrUpdateAccountEnhancedMerchants_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__PKAccountService_insertOrUpdateAccountEnhancedMerchants_accountIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __88__PKAccountService_insertOrUpdateAccountEnhancedMerchants_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)accountEnhancedMerchantsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__PKAccountService_accountEnhancedMerchantsForAccountWithIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __80__PKAccountService_accountEnhancedMerchantsForAccountWithIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABDE50;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "accountEnhancedMerchantsForAccountWithIdentifier:completion:", v10, v14);

}

uint64_t __80__PKAccountService_accountEnhancedMerchantsForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __80__PKAccountService_accountEnhancedMerchantsForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__PKAccountService_accountEnhancedMerchantsForAccountWithIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __80__PKAccountService_accountEnhancedMerchantsForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)deleteAccountEnhancedMerchant:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __86__PKAccountService_deleteAccountEnhancedMerchant_forAccountWithIdentifier_completion___block_invoke;
  v19[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __86__PKAccountService_deleteAccountEnhancedMerchant_forAccountWithIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ABEB88;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "deleteAccountEnhancedMerchant:forAccountWithIdentifier:completion:", v13, v12, v17);

}

uint64_t __86__PKAccountService_deleteAccountEnhancedMerchant_forAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __86__PKAccountService_deleteAccountEnhancedMerchant_forAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__PKAccountService_deleteAccountEnhancedMerchant_forAccountWithIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __86__PKAccountService_deleteAccountEnhancedMerchant_forAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)accountEnhancedMerchantBehaviorForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __87__PKAccountService_accountEnhancedMerchantBehaviorForAccountWithIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __87__PKAccountService_accountEnhancedMerchantBehaviorForAccountWithIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ADCAD0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "accountEnhancedMerchantBehaviorForAccountWithIdentifier:completion:", v10, v14);

}

uint64_t __87__PKAccountService_accountEnhancedMerchantBehaviorForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __87__PKAccountService_accountEnhancedMerchantBehaviorForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__PKAccountService_accountEnhancedMerchantBehaviorForAccountWithIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __87__PKAccountService_accountEnhancedMerchantBehaviorForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)updateCreditRecoveryPaymentPlansForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__PKAccountService_updateCreditRecoveryPaymentPlansForAccountIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2ABD9C8;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __84__PKAccountService_updateCreditRecoveryPaymentPlansForAccountIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABE710;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "updateCreditRecoveryPaymentPlansForAccountIdentifier:completion:", v10, v14);

}

uint64_t __84__PKAccountService_updateCreditRecoveryPaymentPlansForAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __84__PKAccountService_updateCreditRecoveryPaymentPlansForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__PKAccountService_updateCreditRecoveryPaymentPlansForAccountIdentifier_completion___block_invoke_3;
  v14[3] = &unk_1E2ABDB58;
  v10 = v7;
  v15 = v5;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v11 = v14;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v20 = v11;
  v12 = v6;
  v13 = v5;
  dispatch_async(v8, block);

}

uint64_t __84__PKAccountService_updateCreditRecoveryPaymentPlansForAccountIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)creditRecoveryPaymentPlansForAccountIdentifier:(id)a3 allowFetchFromServer:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __99__PKAccountService_creditRecoveryPaymentPlansForAccountIdentifier_allowFetchFromServer_completion___block_invoke;
  v18[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v19 = v11;
  v12 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __99__PKAccountService_creditRecoveryPaymentPlansForAccountIdentifier_allowFetchFromServer_completion___block_invoke_2;
  v16[3] = &unk_1E2ABDE50;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "creditRecoveryPaymentPlansForAccountIdentifier:allowFetchFromServer:completion:", v12, v5, v16);

}

uint64_t __99__PKAccountService_creditRecoveryPaymentPlansForAccountIdentifier_allowFetchFromServer_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __99__PKAccountService_creditRecoveryPaymentPlansForAccountIdentifier_allowFetchFromServer_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __99__PKAccountService_creditRecoveryPaymentPlansForAccountIdentifier_allowFetchFromServer_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __99__PKAccountService_creditRecoveryPaymentPlansForAccountIdentifier_allowFetchFromServer_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)creditRecoveryPaymentPlanInformationForAccountIdentifier:(id)a3 allowFetchFromServer:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __109__PKAccountService_creditRecoveryPaymentPlanInformationForAccountIdentifier_allowFetchFromServer_completion___block_invoke;
  v18[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v19 = v11;
  v12 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __109__PKAccountService_creditRecoveryPaymentPlanInformationForAccountIdentifier_allowFetchFromServer_completion___block_invoke_2;
  v16[3] = &unk_1E2ADCB20;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "creditRecoveryPaymentPlanInformationForAccountIdentifier:allowFetchFromServer:completion:", v12, v5, v16);

}

uint64_t __109__PKAccountService_creditRecoveryPaymentPlanInformationForAccountIdentifier_allowFetchFromServer_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __109__PKAccountService_creditRecoveryPaymentPlanInformationForAccountIdentifier_allowFetchFromServer_completion___block_invoke_2(uint64_t a1, char a2, char a3)
{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;
  char v13;
  char v14;
  _QWORD block[4];
  id v16;

  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v11[2] = __109__PKAccountService_creditRecoveryPaymentPlanInformationForAccountIdentifier_allowFetchFromServer_completion___block_invoke_3;
  v11[3] = &unk_1E2ADCAF8;
  v8 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v9 = v6;
  v13 = a2;
  v14 = a3;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v9;
  v10 = v11;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v10;
  dispatch_async(v7, block);

}

uint64_t __109__PKAccountService_creditRecoveryPaymentPlanInformationForAccountIdentifier_allowFetchFromServer_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
  return result;
}

- (void)accountEntityOrderingsForAccountWithIdentifier:(id)a3 entityType:(unint64_t)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __89__PKAccountService_accountEntityOrderingsForAccountWithIdentifier_entityType_completion___block_invoke;
  v18[3] = &unk_1E2ABD9C8;
  v11 = v9;
  v19 = v11;
  v12 = a3;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __89__PKAccountService_accountEntityOrderingsForAccountWithIdentifier_entityType_completion___block_invoke_2;
  v16[3] = &unk_1E2ABDE50;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "accountEntityOrderingsForAccountWithIdentifier:entityType:completion:", v12, a4, v16);

}

uint64_t __89__PKAccountService_accountEntityOrderingsForAccountWithIdentifier_entityType_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __89__PKAccountService_accountEntityOrderingsForAccountWithIdentifier_entityType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__PKAccountService_accountEntityOrderingsForAccountWithIdentifier_entityType_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDA68;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v8;
  v14 = v7;
  v9 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v16 = v9;
  v10 = v3;
  dispatch_async(v5, block);

}

uint64_t __89__PKAccountService_accountEntityOrderingsForAccountWithIdentifier_entityType_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)updateWalletBadgeCountWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__PKAccountService_updateWalletBadgeCountWithCompletion___block_invoke;
  v13[3] = &unk_1E2ABD9C8;
  v7 = v5;
  v14 = v7;
  -[PKAccountService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __57__PKAccountService_updateWalletBadgeCountWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABDCE8;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "updateWalletBadgeCountWithCompletion:", v11);

}

uint64_t __57__PKAccountService_updateWalletBadgeCountWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __57__PKAccountService_updateWalletBadgeCountWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;
  char v11;
  _QWORD block[4];
  id v13;

  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__PKAccountService_updateWalletBadgeCountWithCompletion___block_invoke_3;
  v9[3] = &unk_1E2ABDAB8;
  v7 = v4;
  v11 = a2;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v8 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E2ABD9A0;
  v13 = v8;
  dispatch_async(v5, block);

}

uint64_t __57__PKAccountService_updateWalletBadgeCountWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)registerObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }

}

- (void)unregisterObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }

}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *replyQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__PKAccountService__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E2ABE058;
    v9 = v5;
    v10 = v4;
    v7 = v5;
    dispatch_async(replyQueue, v8);

  }
}

void __48__PKAccountService__accessObserversWithHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)accountAdded:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__PKAccountService_accountAdded___block_invoke;
  v6[3] = &unk_1E2ADCB48;
  v7 = v4;
  v5 = v4;
  -[PKAccountService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v6);

}

void __33__PKAccountService_accountAdded___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accountAdded:", *(_QWORD *)(a1 + 32));

}

- (void)accountChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__PKAccountService_accountChanged___block_invoke;
  v6[3] = &unk_1E2ADCB48;
  v7 = v4;
  v5 = v4;
  -[PKAccountService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v6);

}

void __35__PKAccountService_accountChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accountChanged:", *(_QWORD *)(a1 + 32));

}

- (void)accountRemoved:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__PKAccountService_accountRemoved___block_invoke;
  v6[3] = &unk_1E2ADCB48;
  v7 = v4;
  v5 = v4;
  -[PKAccountService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v6);

}

void __35__PKAccountService_accountRemoved___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accountRemoved:", *(_QWORD *)(a1 + 32));

}

- (void)statementsChangedForAccountIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__PKAccountService_statementsChangedForAccountIdentifier___block_invoke;
  v6[3] = &unk_1E2ADCB48;
  v7 = v4;
  v5 = v4;
  -[PKAccountService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v6);

}

void __58__PKAccountService_statementsChangedForAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "statementsChangedForAccountIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)scheduledPaymentsChangedForAccountIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PKAccountService_scheduledPaymentsChangedForAccountIdentifier___block_invoke;
  v6[3] = &unk_1E2ADCB48;
  v7 = v4;
  v5 = v4;
  -[PKAccountService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v6);

}

void __65__PKAccountService_scheduledPaymentsChangedForAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "scheduledPaymentsChangedForAccountIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)didUpdatePaymentFundingSources:(id)a3 accountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__PKAccountService_didUpdatePaymentFundingSources_accountIdentifier___block_invoke;
  v10[3] = &unk_1E2ADCB70;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKAccountService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v10);

}

void __69__PKAccountService_didUpdatePaymentFundingSources_accountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didUpdatePaymentFundingSources:accountIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)accountUsersChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__PKAccountService_accountUsersChanged_forAccountIdentifier___block_invoke;
  v10[3] = &unk_1E2ADCB70;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKAccountService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v10);

}

void __61__PKAccountService_accountUsersChanged_forAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accountUsersChanged:forAccountIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__PKAccountService_physicalCardsChanged_forAccountIdentifier___block_invoke;
  v10[3] = &unk_1E2ADCB70;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKAccountService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v10);

}

void __62__PKAccountService_physicalCardsChanged_forAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "physicalCardsChanged:forAccountIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)accountFinancingPlanAdded:(id)a3 accountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__PKAccountService_accountFinancingPlanAdded_accountIdentifier___block_invoke;
  v10[3] = &unk_1E2ADCB70;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKAccountService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v10);

}

void __64__PKAccountService_accountFinancingPlanAdded_accountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accountFinancingPlanAdded:accountIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)accountFinancingPlanUpdated:(id)a3 oldFinancingPlan:(id)a4 accountIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__PKAccountService_accountFinancingPlanUpdated_oldFinancingPlan_accountIdentifier___block_invoke;
  v14[3] = &unk_1E2ADCB98;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[PKAccountService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v14);

}

void __83__PKAccountService_accountFinancingPlanUpdated_oldFinancingPlan_accountIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accountFinancingPlanUpdated:oldFinancingPlan:accountIdentifier:", a1[4], a1[5], a1[6]);

}

- (void)accountFinancingPlanRemoved:(id)a3 accountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__PKAccountService_accountFinancingPlanRemoved_accountIdentifier___block_invoke;
  v10[3] = &unk_1E2ADCB70;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKAccountService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v10);

}

void __66__PKAccountService_accountFinancingPlanRemoved_accountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accountFinancingPlanRemoved:accountIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)payLaterCardMagnitudesChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__PKAccountService_payLaterCardMagnitudesChanged_forAccountIdentifier___block_invoke;
  v10[3] = &unk_1E2ADCB70;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKAccountService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v10);

}

void __71__PKAccountService_payLaterCardMagnitudesChanged_forAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "payLaterCardMagnitudesChanged:forAccountIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didUpdateAccountPromotions:(id)a3 accountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__PKAccountService_didUpdateAccountPromotions_accountIdentifier___block_invoke;
  v10[3] = &unk_1E2ADCB70;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKAccountService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v10);

}

void __65__PKAccountService_didUpdateAccountPromotions_accountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didUpdateAccountPromotions:accountIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didUpdateAccountEnhancedMerchants:(id)a3 accountIdentifier:(id)a4 lastUpdate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__PKAccountService_didUpdateAccountEnhancedMerchants_accountIdentifier_lastUpdate___block_invoke;
  v14[3] = &unk_1E2ADCB98;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[PKAccountService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v14);

}

void __83__PKAccountService_didUpdateAccountEnhancedMerchants_accountIdentifier_lastUpdate___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didUpdateAccountEnhancedMerchants:accountIdentifier:lastUpdate:", a1[4], a1[5], a1[6]);

}

- (void)creditRecoveryPaymentPlansChangedForAccountIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__PKAccountService_creditRecoveryPaymentPlansChangedForAccountIdentifier___block_invoke;
  v6[3] = &unk_1E2ADCB48;
  v7 = v4;
  v5 = v4;
  -[PKAccountService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v6);

}

void __74__PKAccountService_creditRecoveryPaymentPlansChangedForAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "creditRecoveryPaymentPlansChangedForAccountIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)didUpdateAppleBalancePromotion:(id)a3 forAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__PKAccountService_didUpdateAppleBalancePromotion_forAccountIdentifier___block_invoke;
  v10[3] = &unk_1E2ADCB70;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKAccountService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v10);

}

void __72__PKAccountService_didUpdateAppleBalancePromotion_forAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didUpdateAppleBalancePromotion:forAccountIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didRemoveAppleBalancePromotionWithUniqueIdentifier:(id)a3 forAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__PKAccountService_didRemoveAppleBalancePromotionWithUniqueIdentifier_forAccountIdentifier___block_invoke;
  v10[3] = &unk_1E2ADCB70;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKAccountService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v10);

}

void __92__PKAccountService_didRemoveAppleBalancePromotionWithUniqueIdentifier_forAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didRemoveAppleBalancePromotionWithUniqueIdentifier:forAccountIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didUpdateInStoreTopUpToken:(id)a3 forAccountIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__PKAccountService_didUpdateInStoreTopUpToken_forAccountIdentifier___block_invoke;
  v10[3] = &unk_1E2ADCB70;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKAccountService _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v10);

}

void __68__PKAccountService_didUpdateInStoreTopUpToken_forAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didUpdateInStoreTopUpToken:forAccountIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (void)setReplyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_replyQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end
