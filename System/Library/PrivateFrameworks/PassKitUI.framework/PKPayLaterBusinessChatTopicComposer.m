@implementation PKPayLaterBusinessChatTopicComposer

- (PKPayLaterBusinessChatTopicComposer)initWithPayLaterAccount:(id)a3 payLaterPass:(id)a4 financingPlan:(id)a5 installment:(id)a6 payment:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKPayLaterBusinessChatTopicComposer *v17;
  PKPayLaterBusinessChatTopicComposer *v18;
  PKAccountService *v19;
  PKAccountService *accountService;
  uint64_t v21;
  PKPaymentWebService *paymentWebService;
  id v24;
  objc_super v25;

  v24 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)PKPayLaterBusinessChatTopicComposer;
  v17 = -[PKPayLaterBusinessChatTopicComposer init](&v25, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_financingPlan, a5);
    objc_storeStrong((id *)&v18->_payLaterAccount, a3);
    objc_storeStrong((id *)&v18->_payLaterPass, a4);
    objc_storeStrong((id *)&v18->_installment, a6);
    objc_storeStrong((id *)&v18->_payment, a7);
    v19 = (PKAccountService *)objc_alloc_init(MEMORY[0x1E0D668E8]);
    accountService = v18->_accountService;
    v18->_accountService = v19;

    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v21 = objc_claimAutoreleasedReturnValue();
    paymentWebService = v18->_paymentWebService;
    v18->_paymentWebService = (PKPaymentWebService *)v21;

  }
  return v18;
}

- (void)releventTopicsForContext:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    if (a3 - 2 < 2)
    {
      v8 = v6;
      -[PKPayLaterBusinessChatTopicComposer _allBusinessChatTopicsForContext:completion:](self, "_allBusinessChatTopicsForContext:completion:", a3);
      goto LABEL_8;
    }
    if (!a3)
    {
      v8 = v6;
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
      goto LABEL_8;
    }
    if (a3 == 1)
    {
      v8 = v6;
      -[PKPayLaterBusinessChatTopicComposer _releventTopicsForPassContextWithCompletion:](self, "_releventTopicsForPassContextWithCompletion:", v6);
LABEL_8:
      v7 = v8;
    }
  }

}

- (void)_releventTopicsForPassContextWithCompletion:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke;
    v5[3] = &unk_1E3E6BB20;
    objc_copyWeak(&v7, &location);
    v5[4] = self;
    v6 = v4;
    -[PKPayLaterBusinessChatTopicComposer _allBusinessChatTopicsForContext:completion:](self, "_allBusinessChatTopicsForContext:completion:", 1, v5);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

void __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke_2;
  v6[3] = &unk_1E3E689E0;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v9);
}

void __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id obj;
  uint64_t v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v25 = WeakRetained;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "accountIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v27 = a1;
    obj = *(id *)(a1 + 40);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v48 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          objc_msgSend(v8, "relevantFinancingPlanStates");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v44;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v44 != v12)
                  objc_enumerationMutation(v9);
                objc_msgSend(v3, "setObject:forKey:", &unk_1E3FAD348, *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j));
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
            }
            while (v11);
          }

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v5);
    }

    v41 = 0u;
    v42 = 0u;
    v40 = 0u;
    v39 = 0u;
    v14 = v3;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    v16 = MEMORY[0x1E0C809B0];
    if (v15)
    {
      v17 = v15;
      v18 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v17; ++k)
        {
          if (*(_QWORD *)v40 != v18)
            objc_enumerationMutation(v14);
          v20 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k);
          v34[0] = v16;
          v34[1] = 3221225472;
          v34[2] = __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke_11;
          v34[3] = &unk_1E3E66A08;
          v35 = v29;
          v36 = v20;
          v37 = *(_QWORD *)(v27 + 32);
          v21 = v14;
          v38 = v21;
          objc_msgSend(v28, "addOperation:", v34);

        }
        v17 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
      }
      while (v17);
    }

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v16;
    v30[1] = 3221225472;
    v30[2] = __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke_4;
    v30[3] = &unk_1E3E6BAF8;
    v31 = *(id *)(v27 + 40);
    v32 = v14;
    v33 = *(id *)(v27 + 48);
    v23 = v14;
    v24 = (id)objc_msgSend(v28, "evaluateWithInput:completion:", v22, v30);

    WeakRetained = v25;
  }

}

void __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke_11(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D668F8]), "initWithAccountIdentifier:queryItems:", a1[4], 64);
  v21[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCountFinancingPlanStates:", v9);

  v10 = (void *)a1[7];
  v11 = *(void **)(a1[6] + 8);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke_2_14;
  v16[3] = &unk_1E3E6BAD0;
  v12 = v10;
  v13 = a1[5];
  v17 = v12;
  v18 = v13;
  v19 = v6;
  v20 = v7;
  v14 = v6;
  v15 = v7;
  objc_msgSend(v11, "financingPlansWithQuery:completion:", v8, v16);

}

void __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke_2_14(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke_3;
  block[3] = &unk_1E3E64098;
  v8 = v3;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v12 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "financingPlanCount");
  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, *(_QWORD *)(a1 + 48));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __83__PKPayLaterBusinessChatTopicComposer__releventTopicsForPassContextWithCompletion___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (!v3)
    goto LABEL_19;
  v4 = v3;
  v5 = *(_QWORD *)v28;
  v19 = *(_QWORD *)v28;
  v20 = v2;
  do
  {
    v6 = 0;
    v21 = v4;
    do
    {
      if (*(_QWORD *)v28 != v5)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v6);
      objc_msgSend(v7, "relevantFinancingPlanStates", v19, v20);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "count"))
      {
LABEL_15:
        objc_msgSend(v2, "addObject:", v7);
        goto LABEL_17;
      }
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v10)
      {
        v11 = v10;
        v12 = 0;
        v13 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v24 != v13)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v12 += objc_msgSend(v15, "integerValue");

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v11);

        v16 = v12 < 1;
        v5 = v19;
        v2 = v20;
        v4 = v21;
        if (!v16)
          goto LABEL_15;
      }
      else
      {

      }
LABEL_17:

      ++v6;
    }
    while (v6 != v4);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  }
  while (v4);
LABEL_19:

  v17 = *(_QWORD *)(a1 + 48);
  if (objc_msgSend(v2, "count"))
  {
    v18 = (void *)objc_msgSend(v2, "copy");
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v17 + 16))(v17, 0);
  }

}

- (void)_allBusinessChatTopicsForContext:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void (**v8)(id, void *);

  v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    v8 = v6;
    if (-[PKAccount supportsDynamicReportIssueTopics](self->_payLaterAccount, "supportsDynamicReportIssueTopics"))
    {
      -[PKPayLaterBusinessChatTopicComposer _dynamicBusinessChatTopicsForContext:completion:](self, "_dynamicBusinessChatTopicsForContext:completion:", a3, v8);
    }
    else
    {
      -[PKPayLaterBusinessChatTopicComposer _staticBusinessChatTopicsForContext:](self, "_staticBusinessChatTopicsForContext:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v7);

    }
    v6 = v8;
  }

}

- (void)_dynamicBusinessChatTopicsForContext:(unint64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  PKPaymentWebService *paymentWebService;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v6 = a4;
  v7 = 12;
  if (a3 == 2)
    v7 = 13;
  if (a3 == 3)
    v8 = 14;
  else
    v8 = v7;
  -[PKAccount accountIdentifier](self->_payLaterAccount, "accountIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0D669B8]);
  objc_msgSend(v10, "setAccountIdentifier:", v9);
  -[PKAccount accountBaseURL](self->_payLaterAccount, "accountBaseURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBaseURL:", v11);

  objc_msgSend(v10, "setType:", v8);
  objc_initWeak(&location, self);
  paymentWebService = self->_paymentWebService;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__PKPayLaterBusinessChatTopicComposer__dynamicBusinessChatTopicsForContext_completion___block_invoke;
  v14[3] = &unk_1E3E6BB48;
  objc_copyWeak(&v16, &location);
  v13 = v6;
  v15 = v13;
  -[PKPaymentWebService accountPayLaterContentWithRequest:completion:](paymentWebService, "accountPayLaterContentWithRequest:completion:", v10, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __87__PKPayLaterBusinessChatTopicComposer__dynamicBusinessChatTopicsForContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__PKPayLaterBusinessChatTopicComposer__dynamicBusinessChatTopicsForContext_completion___block_invoke_2;
  v10[3] = &unk_1E3E67750;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v11 = v6;
  v7 = *(id *)(a1 + 32);
  v12 = v5;
  v13 = v7;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v14);
}

void __87__PKPayLaterBusinessChatTopicComposer__dynamicBusinessChatTopicsForContext_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 32))
    {
      (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 48), 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "reportIssueTopics");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    }
    WeakRetained = v5;
  }

}

- (id)_staticBusinessChatTopicsForContext:(unint64_t)a3
{
  void *v3;

  switch(a3)
  {
    case 3uLL:
      -[PKPayLaterBusinessChatTopicComposer _staticFinancingPlanPaymentContextBusinessChatTopics](self, "_staticFinancingPlanPaymentContextBusinessChatTopics");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      -[PKPayLaterBusinessChatTopicComposer _staticFinancingPlanContextBusinessChatTopics](self, "_staticFinancingPlanContextBusinessChatTopics");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      -[PKPayLaterBusinessChatTopicComposer _staticPassContextBusinessChatTopics](self, "_staticPassContextBusinessChatTopics");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (id)_staticPassContextBusinessChatTopics
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66FD8]), "initWithContext:topicType:", 1, 1);
  objc_msgSend(v2, "safelyAddObject:", v3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66FD8]), "initWithContext:topicType:", 1, 4);

  objc_msgSend(v2, "safelyAddObject:", v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66FD8]), "initWithContext:topicType:", 1, 6);

  objc_msgSend(v2, "safelyAddObject:", v5);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66FD8]), "initWithContext:topicType:", 1, 5);

  objc_msgSend(v2, "safelyAddObject:", v6);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66FD8]), "initWithContext:topicType:", 1, 9);

  objc_msgSend(v2, "safelyAddObject:", v7);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66FD8]), "initWithContext:topicType:", 1, 8);

  objc_msgSend(v2, "safelyAddObject:", v8);
  v9 = (void *)objc_msgSend(v2, "copy");

  return v9;
}

- (id)_staticFinancingPlanContextBusinessChatTopics
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66FD8]), "initWithContext:topicType:", 2, 1);
  objc_msgSend(v2, "safelyAddObject:", v3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66FD8]), "initWithContext:topicType:", 2, 4);

  objc_msgSend(v2, "safelyAddObject:", v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66FD8]), "initWithContext:topicType:", 2, 6);

  objc_msgSend(v2, "safelyAddObject:", v5);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66FD8]), "initWithContext:topicType:", 2, 5);

  objc_msgSend(v2, "safelyAddObject:", v6);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66FD8]), "initWithContext:topicType:", 2, 9);

  objc_msgSend(v2, "safelyAddObject:", v7);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66FD8]), "initWithContext:topicType:", 2, 8);

  objc_msgSend(v2, "safelyAddObject:", v8);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66FD8]), "initWithContext:topicType:", 2, 7);

  objc_msgSend(v2, "safelyAddObject:", v9);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66FD8]), "initWithContext:topicType:", 2, 17);

  objc_msgSend(v2, "safelyAddObject:", v10);
  v11 = (void *)objc_msgSend(v2, "copy");

  return v11;
}

- (id)_staticFinancingPlanPaymentContextBusinessChatTopics
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66FD8]), "initWithContext:topicType:", 3, 10);
  objc_msgSend(v2, "safelyAddObject:", v3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66FD8]), "initWithContext:topicType:", 3, 17);

  objc_msgSend(v2, "safelyAddObject:", v4);
  v5 = (void *)objc_msgSend(v2, "copy");

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_installment, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
}

@end
