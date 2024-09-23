@implementation PKRewardsSummaryFetcher

- (PKRewardsSummaryFetcher)initWithTransactionSourceCollection:(id)a3 account:(id)a4
{
  id v7;
  id v8;
  PKRewardsSummaryFetcher *v9;
  PKRewardsSummaryFetcher *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKRewardsSummaryFetcher;
  v9 = -[PKRewardsSummaryFetcher init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a4);
    objc_storeStrong((id *)&v10->_transactionSourceCollection, a3);
  }

  return v10;
}

- (BOOL)isTransactionSourceIdentifierRelevant:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PKRewardsSummaryFetcher _relevantTransactionSourceIdentifiers](self, "_relevantTransactionSourceIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)isPaymentPassRelevant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;

  v4 = a3;
  -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v8 = v6;
  v9 = v8;
  if (v8 == v7)
  {
    v10 = 1;
  }
  else
  {
    v10 = 0;
    if (v7 && v8)
      v10 = objc_msgSend(v7, "isEqualToString:", v8);
  }

  return v10;
}

- (void)rewardsTierSummariesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  _QWORD block[4];
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[4];
  NSObject *v24;
  _QWORD *v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD *v28;
  _QWORD v29[4];
  NSObject *v30;
  _QWORD *v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;

  v4 = a3;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__79;
  v36[4] = __Block_byref_object_dispose__79;
  v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__79;
  v34[4] = __Block_byref_object_dispose__79;
  v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__79;
  v32[4] = __Block_byref_object_dispose__79;
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKStartOfMonth(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKStartOfYear(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_group_create();
  +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRewardsSummaryFetcher _relevantTransactionSourceIdentifiers](self, "_relevantTransactionSourceIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currencyCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_group_enter(v8);
  v13 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __62__PKRewardsSummaryFetcher_rewardsTierSummariesWithCompletion___block_invoke;
  v29[3] = &unk_1E2ADAF38;
  v31 = v36;
  v14 = v8;
  v30 = v14;
  objc_msgSend(v9, "rewardsTierSummaryForTransactionSourceIdentifiers:currencyCode:startDate:endDate:completion:", v10, v12, v6, 0, v29);
  dispatch_group_enter(v14);
  v26[0] = v13;
  v26[1] = 3221225472;
  v26[2] = __62__PKRewardsSummaryFetcher_rewardsTierSummariesWithCompletion___block_invoke_2;
  v26[3] = &unk_1E2ADAF38;
  v28 = v34;
  v15 = v14;
  v27 = v15;
  objc_msgSend(v9, "rewardsTierSummaryForTransactionSourceIdentifiers:currencyCode:startDate:endDate:completion:", v10, v12, v7, 0, v26);
  dispatch_group_enter(v15);
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __62__PKRewardsSummaryFetcher_rewardsTierSummariesWithCompletion___block_invoke_3;
  v23[3] = &unk_1E2ADAF38;
  v25 = v32;
  v16 = v15;
  v24 = v16;
  objc_msgSend(v9, "rewardsTierSummaryForTransactionSourceIdentifiers:currencyCode:startDate:endDate:completion:", v10, v12, 0, 0, v23);
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __62__PKRewardsSummaryFetcher_rewardsTierSummariesWithCompletion___block_invoke_4;
  block[3] = &unk_1E2AD0418;
  v19 = v4;
  v20 = v36;
  v21 = v34;
  v22 = v32;
  v17 = v4;
  dispatch_group_notify(v16, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(v36, 8);
}

void __62__PKRewardsSummaryFetcher_rewardsTierSummariesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __62__PKRewardsSummaryFetcher_rewardsTierSummariesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __62__PKRewardsSummaryFetcher_rewardsTierSummariesWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __62__PKRewardsSummaryFetcher_rewardsTierSummariesWithCompletion___block_invoke_4(_QWORD *a1)
{
  uint64_t result;

  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  return result;
}

- (id)_relevantTransactionSourceIdentifiers
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PKTransactionSourceCollection transactionSources](self->_transactionSourceCollection, "transactionSources", 0);
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
        v10 = objc_msgSend(v9, "type");
        if (v10)
        {
          if (v10 != 2)
            continue;
          objc_msgSend(v9, "accountUser");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isCurrentUser");

          if (!v12)
            continue;
        }
        objc_msgSend(v9, "transactionSourceIdentifiers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v13);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v14 = (void *)objc_msgSend(v3, "copy");
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
