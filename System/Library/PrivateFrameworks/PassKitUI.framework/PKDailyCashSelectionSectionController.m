@implementation PKDailyCashSelectionSectionController

- (PKDailyCashSelectionSectionController)initWithSectionIdentifier:(id)a3 account:(id)a4 accountService:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKDailyCashSelectionSectionController *v15;
  PKDailyCashSelectionSectionController *v16;
  PKPaymentService *v17;
  PKPaymentService *applyService;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKDailyCashSelectionSectionController;
  v15 = -[PKDailyCashSelectionSectionController init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeWeak((id *)&v16->_delegate, v14);
    objc_storeStrong((id *)&v16->_account, a4);
    objc_storeStrong((id *)&v16->_accountService, a5);
    v17 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E0D672B0]);
    applyService = v16->_applyService;
    v16->_applyService = v17;

  }
  return v16;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKPeerPaymentAccount *v7;
  PKPeerPaymentAccount *peerPaymentAccount;
  PKPeerPaymentAccountResolutionController *v9;
  PKPeerPaymentAccount *v10;
  void *v11;
  id v12;
  PKPeerPaymentAccountResolutionController *v13;
  PKPeerPaymentAccountResolutionController *peerPaymentAccountResolutionController;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];

  v4 = a3;
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_currentDestination = objc_msgSend(v5, "rewardsDestination");

  objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v7 = (PKPeerPaymentAccount *)objc_claimAutoreleasedReturnValue();
  peerPaymentAccount = self->_peerPaymentAccount;
  self->_peerPaymentAccount = v7;

  v9 = [PKPeerPaymentAccountResolutionController alloc];
  v10 = self->_peerPaymentAccount;
  objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0D66F18]);
  v13 = -[PKPeerPaymentAccountResolutionController initWithAccount:webService:context:delegate:passLibraryDataProvider:](v9, "initWithAccount:webService:context:delegate:passLibraryDataProvider:", v10, v11, 0, self, v12);
  peerPaymentAccountResolutionController = self->_peerPaymentAccountResolutionController;
  self->_peerPaymentAccountResolutionController = v13;

  -[PKPeerPaymentAccountResolutionController setSetupDelegate:](self->_peerPaymentAccountResolutionController, "setSetupDelegate:", self);
  -[PKAccountService registerObserver:](self->_accountService, "registerObserver:", self);
  -[PKPaymentService setDelegate:](self->_applyService, "setDelegate:", self);
  v15 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  v16 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke;
  v25[3] = &unk_1E3E67120;
  v25[4] = self;
  objc_msgSend(v15, "addOperation:", v25);
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_4;
  v24[3] = &unk_1E3E67120;
  v24[4] = self;
  objc_msgSend(v15, "addOperation:", v24);
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_8;
  v23[3] = &unk_1E3E67120;
  v23[4] = self;
  objc_msgSend(v15, "addOperation:", v23);
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_11;
  v22[3] = &unk_1E3E67120;
  v22[4] = self;
  objc_msgSend(v15, "addOperation:", v22);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_14;
  v20[3] = &unk_1E3E68B70;
  v21 = v4;
  v18 = v4;
  v19 = (id)objc_msgSend(v15, "evaluateWithInput:completion:", v17, v20);

}

void __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 88);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_2;
  v12[3] = &unk_1E3E65890;
  v13 = v6;
  v14 = v7;
  v12[4] = v8;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "accountsWithCompletion:", v12);

}

void __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_3;
  v5[3] = &unk_1E3E65E08;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v8 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 104);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_5;
  v12[3] = &unk_1E3E65FE0;
  v13 = v6;
  v14 = v7;
  v12[4] = v8;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "featureApplicationsWithCompletion:", v12);

}

void __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_6;
  v5[3] = &unk_1E3E65E08;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v8 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "pk_firstObjectPassingTest:", &__block_literal_global_190);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 112);
  *(_QWORD *)(v3 + 112) = v2;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

BOOL __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "feature") == 5 && objc_msgSend(v2, "applicationState") == 5;

  return v3;
}

void __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 88);
  objc_msgSend(*(id *)(v8 + 24), "accountIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_9;
  v14[3] = &unk_1E3E66008;
  v11 = *(_QWORD *)(a1 + 32);
  v15 = v6;
  v16 = v7;
  v14[4] = v11;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v9, "accountUsersForAccountWithIdentifier:completion:", v10, v14);

}

void __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_10;
  v5[3] = &unk_1E3E65E08;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v8 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_10(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66940]), "initWithAccountUsers:", a1[5]);
  v3 = a1[4];
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

void __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_11(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(v10 + 24);
  objc_msgSend(*(id *)(v10 + 32), "currentAccountUser");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_12;
  v16[3] = &unk_1E3E75FE8;
  objc_copyWeak(&v19, &location);
  v14 = v9;
  v18 = v14;
  v15 = v8;
  v17 = v15;
  +[PKCreditAccountController resolutionToReceiveCashbackForAccount:accountUser:withPeerPaymentAccount:completion:](PKCreditAccountController, "resolutionToReceiveCashbackForAccount:accountUser:withPeerPaymentAccount:completion:", v11, v12, v13, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_12(id *a1, uint64_t a2, char a3)
{
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  char v9;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_13;
  v5[3] = &unk_1E3E6C5E8;
  objc_copyWeak(&v8, a1 + 6);
  v9 = a3;
  v7 = a1[5];
  v6 = a1[4];
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v8);
}

void __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_13(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    WeakRetained[81] = *(_BYTE *)(a1 + 56);
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v3;
  }

}

uint64_t __65__PKDailyCashSelectionSectionController_preflightWithCompletion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)dailyCashSelectionItems
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _UNKNOWN **v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  _BOOL8 v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKAccount redeemRewardsFeatureDescriptor](self->_account, "redeemRewardsFeatureDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedDestinations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || !objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D20]);
    PKAccountRewardRedemptionTypeToString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithObjects:", v7, 0);

    v5 = (void *)v8;
  }
  PKAccountRewardRedemptionTypeToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v9) & 1) == 0)
  {
    objc_msgSend(v5, "arrayByAddingObject:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (!v12)
  {

    goto LABEL_40;
  }
  v13 = v12;
  v40 = v9;
  v41 = v3;
  v14 = 0;
  v15 = *(_QWORD *)v44;
  v16 = &off_1E3E1A000;
  v42 = v11;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v44 != v15)
        objc_enumerationMutation(v11);
      v18 = PKAccountRewardRedemptionTypeFromString();
      v19 = objc_alloc_init((Class)v16[465]);
      objc_msgSend(v19, "setRedemptionType:", v18);
      objc_msgSend(v19, "setLoading:", v18 == self->_loadingDestination);
      objc_msgSend(v19, "setSelected:", v18 == self->_currentDestination);
      if (v18 == 1)
      {
        v32 = -[PKPeerPaymentAccountResolutionController currentPeerPaymentAccountResolution](self->_peerPaymentAccountResolutionController, "currentPeerPaymentAccountResolution");
        if (!v32)
        {
          -[PKPeerPaymentAccount currentBalance](self->_peerPaymentAccount, "currentBalance");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setBalance:", v33);

          v16 = &off_1E3E1A000;
        }
        ++v14;
        v35 = v32 != 1 && self->_peerPaymentAccount != 0;
        objc_msgSend(v19, "setHasAccount:", v35);
        v36 = -[PKPeerPaymentAccount state](self->_peerPaymentAccount, "state");
        if ((unint64_t)(v36 - 1) >= 4)
          v37 = 0;
        else
          v37 = v36;
        objc_msgSend(v19, "setState:", v37);
        objc_msgSend(v3, "addObject:", v19);
      }
      else
      {
        if (v18 == 3)
        {
          -[PKDailyCashSelectionSectionController _eligibleAccountOfType:](self, "_eligibleAccountOfType:", 4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setHasAccount:", v22 != 0);
          objc_msgSend(v19, "setHasPendingApplication:", self->_pendingSavingsApplication != 0);
          objc_msgSend(v22, "savingsDetails");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "accountSummary");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "currentBalance");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "savingsDetails");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "currencyCode");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28 && v30)
          {
            PKCurrencyAmountMake();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setBalance:", v31);

          }
          ++v14;
          objc_msgSend(v19, "setState:", objc_msgSend(v22, "state"));
          v3 = v41;
          objc_msgSend(v41, "addObject:", v19);

          goto LABEL_22;
        }
        if (v18 == 2 && self->_allowStatementCreditRedemption)
        {
          -[PKAccount creditDetails](self->_account, "creditDetails");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "accountSummary");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "rewardsBalance");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            -[PKAccount creditDetails](self->_account, "creditDetails");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "currencyCode");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            PKCurrencyAmountMake();
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "setBalance:", v25);
            v3 = v41;
          }
          objc_msgSend(v19, "setHasRedeemed:", self->_hasRedeemed);
          objc_msgSend(v19, "setHasAccount:", 1);
          objc_msgSend(v3, "addObject:", v19);
LABEL_22:

          v11 = v42;
          v16 = &off_1E3E1A000;
        }
      }

    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  }
  while (v13);

  v9 = v40;
  if (v14 > 1)
  {
LABEL_41:
    objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_126_2);
    v38 = (void *)objc_msgSend(v3, "copy");
    goto LABEL_43;
  }
LABEL_40:
  if (self->_allowStatementCreditRedemption)
    goto LABEL_41;
  v38 = 0;
LABEL_43:

  return v38;
}

uint64_t __64__PKDailyCashSelectionSectionController_dailyCashSelectionItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  _BOOL8 v10;

  v4 = a3;
  v5 = objc_msgSend(a2, "redemptionType") - 1;
  if (v5 > 2)
    v6 = 0;
  else
    v6 = qword_19DF177A8[v5];
  v7 = objc_msgSend(v4, "redemptionType");

  if ((unint64_t)(v7 - 1) > 2)
    v8 = 0;
  else
    v8 = qword_19DF177A8[v7 - 1];
  v9 = v6 >= v8;
  v10 = v6 > v8;
  if (v9)
    return v10;
  else
    return -1;
}

- (id)analyticsEventReportWithPreSelect:(BOOL)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _BOOL4 v21;
  id v22;
  uint64_t v23;
  NSArray *obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v21 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = (id)*MEMORY[0x1E0D68990];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_currentDailyCashSelectionItems;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v6)
  {
    v12 = v5;
    goto LABEL_25;
  }
  v7 = v6;
  v8 = *(_QWORD *)v26;
  v23 = *MEMORY[0x1E0D689A8];
  v9 = (id)*MEMORY[0x1E0D68980];
  v10 = (void *)*MEMORY[0x1E0D68988];
  v11 = (void *)*MEMORY[0x1E0D689A0];
  v12 = v5;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v26 != v8)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      v15 = objc_msgSend(v14, "redemptionType");
      switch(v15)
      {
        case 3:
          if (objc_msgSend(v14, "hasAccount"))
            v18 = v9;
          else
            v18 = v5;
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v11);
          if (objc_msgSend(v14, "selected"))
          {
            v17 = v11;
            goto LABEL_20;
          }
          break;
        case 2:
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v23);
          continue;
        case 1:
          v16 = objc_msgSend(v14, "hasAccount") ? v9 : v5;
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v10);
          if (objc_msgSend(v14, "selected"))
          {
            v17 = v10;
LABEL_20:
            v19 = v17;

            v12 = v19;
            continue;
          }
          break;
      }
    }
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v7);
LABEL_25:

  objc_msgSend(v22, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D68978]);
  if (v21)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D68998]);

  return v22;
}

- (NSArray)identifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_identifier;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldHighlightItem:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  char v8;
  char v9;

  v4 = a3;
  if ((PKStoreDemoModeEnabled() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = v4;
    v7 = objc_msgSend(v6, "redemptionType");
    if (v7 == self->_currentDestination)
      v8 = objc_msgSend(v6, "hasAccount");
    else
      v8 = 0;
    v9 = objc_msgSend(v6, "hasPendingApplication");
    v5 = 0;
    if (v7 != 2 && (v8 & 1) == 0)
    {
      if (self->_loadingDestination)
        v5 = 0;
      else
        v5 = v9 ^ 1;
    }

  }
  return v5;
}

- (void)didSelectItem:(id)a3
{
  id v4;
  dispatch_time_t v5;
  uint64_t v6;
  _QWORD block[5];

  v4 = a3;
  if ((PKStoreDemoModeEnabled() & 1) == 0)
  {
    v5 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__PKDailyCashSelectionSectionController_didSelectItem___block_invoke;
    block[3] = &unk_1E3E612E8;
    block[4] = self;
    dispatch_after(v5, MEMORY[0x1E0C80D38], block);
    v6 = objc_msgSend(v4, "redemptionType");
    -[PKDailyCashSelectionSectionController _changeRewardsDestinationAndOpenAccountIfNeeded:](self, "_changeRewardsDestinationAndOpenAccountIfNeeded:", v6);
    -[PKDailyCashSelectionSectionController _reportDestinationButtonTapWithRedemptionType:](self, "_reportDestinationButtonTapWithRedemptionType:", v6);
  }

}

void __55__PKDailyCashSelectionSectionController_didSelectItem___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "deselectCells");

}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  NSString *identifier;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  NSArray *v12;
  NSArray *currentDailyCashSelectionItems;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  identifier = self->_identifier;
  v8 = (NSString *)v5;
  v9 = identifier;
  if (v9 == v8)
  {

  }
  else
  {
    v10 = v9;
    if (!v8 || !v9)
    {

      goto LABEL_9;
    }
    v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

    if (!v11)
      goto LABEL_9;
  }
  -[PKDailyCashSelectionSectionController dailyCashSelectionItems](self, "dailyCashSelectionItems");
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  currentDailyCashSelectionItems = self->_currentDailyCashSelectionItems;
  self->_currentDailyCashSelectionItems = v12;

  objc_msgSend(v6, "appendItems:", self->_currentDailyCashSelectionItems);
LABEL_9:

  return v6;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  id location;

  v4 = a3;
  v5 = objc_opt_class();
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0DC35C8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__PKDailyCashSelectionSectionController_cellRegistrationForItem___block_invoke;
  v9[3] = &unk_1E3E76050;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  objc_msgSend(v6, "registrationWithCellClass:configurationHandler:", v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __65__PKDailyCashSelectionSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  NSString *v10;
  _BOOL4 IsAccessibilityCategory;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void **v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void **v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[2];
  void *v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    goto LABEL_48;
  objc_msgSend(v6, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  objc_msgSend(v12, "secondaryTextProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setColor:", v14);

  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v13;
  objc_msgSend(v13, "setFont:", v15);

  objc_msgSend(v12, "imageProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCornerRadius:", 6.0);

  v17 = objc_msgSend(v7, "redemptionType");
  objc_msgSend(v7, "balance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v7, "state"))
  {
    case 1:
      if (v53)
      {
        objc_msgSend(v53, "formattedStringValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedFeatureString();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setSecondaryText:", v19, v18);
        goto LABEL_7;
      }
      break;
    case 2:
    case 3:
      PKLocalizedFeatureString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSecondaryText:", v20);

      objc_msgSend(v12, "secondaryTextProperties");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setColor:", v19);
LABEL_7:

      goto LABEL_8;
    case 4:
    case 5:
      PKLocalizedFeatureString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSecondaryText:", v18);
LABEL_8:

      break;
    default:
      break;
  }
  if (objc_msgSend(v7, "hasPendingApplication"))
  {
    if (IsAccessibilityCategory)
    {
      PKLocalizedFeatureString();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSecondaryText:", v21);

LABEL_15:
      v25 = 0;
      goto LABEL_21;
    }
    objc_msgSend(WeakRetained, "_pendingApplicationAccessory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v22;
    v23 = (void *)MEMORY[0x1E0C99D20];
    v24 = (void **)v60;
  }
  else if ((objc_msgSend(v7, "hasAccount") & 1) != 0)
  {
    if (!objc_msgSend(v7, "selected"))
      goto LABEL_15;
    objc_msgSend(WeakRetained, "_checkmarkAccessory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v22;
    v23 = (void *)MEMORY[0x1E0C99D20];
    v24 = &v57;
  }
  else
  {
    if (!IsAccessibilityCategory)
    {
      objc_msgSend(WeakRetained, "_setupAccessory");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = v22;
      objc_msgSend(WeakRetained, "_disclosureAccessory");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v58[1] = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
    PKLocalizedFeatureString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSecondaryText:", v26);

    objc_msgSend(WeakRetained, "_disclosureAccessory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v22;
    v23 = (void *)MEMORY[0x1E0C99D20];
    v24 = &v59;
  }
  objc_msgSend(v23, "arrayWithObjects:count:", v24, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

LABEL_21:
  switch(v17)
  {
    case 1:
      PKLocalizedFeatureString();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setText:", v32);

      v28 = 0;
      v33 = CFSTR("AppleCashIcon");
      break;
    case 3:
      objc_msgSend(*(id *)(a1 + 32), "_eligibleAccountOfType:", 4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v34)
      {
        if ((objc_msgSend(v34, "supportsOneTimeDeposit") & 1) != 0)
          v36 = 1;
        else
          v36 = objc_msgSend(v35, "supportsOneTimeDepositWithAppleCash");
        objc_msgSend(v6, "setUserInteractionEnabled:", v36);
      }
      PKLocalizedFeatureString();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setText:", v38);

      v28 = 0;
      v33 = CFSTR("SAVINGS_Icon");
      break;
    case 2:
      PKLocalizedFeatureString();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setText:", v27);

      v28 = (char)v53;
      if (!v53)
      {
        objc_msgSend(v12, "setSecondaryText:", 0);
LABEL_42:
        v33 = CFSTR("AppleCardIcon");
        break;
      }
      objc_msgSend(v53, "formattedStringValue");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setSecondaryText:", v29, v50);
      if (objc_msgSend(v7, "hasRedeemed"))
      {
        objc_msgSend(WeakRetained, "_hasRedeemedAccessory");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v30;
        v31 = &v56;
      }
      else
      {
        v51 = v29;
        objc_msgSend(v53, "amount");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v39, "compare:", v40);

        if (v41 != 1)
        {
          v29 = v51;
          goto LABEL_41;
        }
        objc_msgSend(WeakRetained, "_applyAccessory");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v30;
        v31 = &v55;
        v29 = v51;
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
      v42 = objc_claimAutoreleasedReturnValue();

      v25 = (void *)v42;
LABEL_41:

      v28 = 0;
      goto LABEL_42;
    default:
      v33 = 0;
      v28 = 1;
      break;
  }
  if (objc_msgSend(v7, "loading"))
  {
    objc_msgSend(WeakRetained, "_spinnerAccessory");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
    v44 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v44;
  }
  if ((v28 & 1) == 0)
  {
    PKPassKitUIBundle();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "URLForResource:withExtension:", v33, CFSTR("pdf"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = PKUIScreenScale();
    PKUIImageFromPDF(v46, 29.0, 29.0, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", v48);

  }
  objc_msgSend(v6, "setAccessories:", v25);
  objc_msgSend(v6, "setContentConfiguration:", v12);
  v49 = **((id **)&unk_1E3E76140 + v17);
  objc_msgSend(v6, "setAccessibilityIdentifier:", v49);

LABEL_48:
}

- (id)_eligibleAccountOfType:(unint64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_accounts;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", (_QWORD)v12) == a3 && objc_msgSend(v9, "state") != 4)
        {
          v10 = v9;
          goto LABEL_12;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = (objc_class *)MEMORY[0x1E0DC35A8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithAppearance:", 2);
  -[PKDailyCashSelectionSectionController headerTitle](self, "headerTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length") != 0;

  -[PKDailyCashSelectionSectionController footerTitle](self, "footerTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  objc_msgSend(v7, "setHeaderMode:", v9);
  objc_msgSend(v7, "setFooterMode:", v11 != 0);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "contentInsets");
  objc_msgSend(v12, "setContentInsets:");

  return v12;
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  v7 = (void *)*MEMORY[0x1E0DC48A8];
  v8 = v5;
  v9 = v7;
  if (v9 == v8)
  {

    goto LABEL_15;
  }
  v10 = v9;
  if (v8 && v9)
  {
    v11 = objc_msgSend(v8, "isEqualToString:", v9);

    if ((v11 & 1) != 0)
      goto LABEL_15;
  }
  else
  {

  }
  v12 = (void *)*MEMORY[0x1E0DC48A0];
  v13 = v8;
  v14 = v12;
  if (v14 == v13)
  {

  }
  else
  {
    v15 = v14;
    if (v8 && v14)
    {
      objc_msgSend(v13, "isEqualToString:", v14);

    }
    else
    {

    }
  }
LABEL_15:
  objc_opt_class();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v16;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  id v20;

  v20 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)*MEMORY[0x1E0DC48A8];
  v11 = v8;
  v12 = v10;
  if (v12 == v11)
  {

    goto LABEL_7;
  }
  v13 = v12;
  if (v11 && v12)
  {
    v14 = objc_msgSend(v11, "isEqualToString:", v12);

    if (!v14)
      goto LABEL_9;
LABEL_7:
    v15 = v20;
    objc_msgSend(v15, "setUseLargeBottomInset:", 1);
    -[PKDailyCashSelectionSectionController headerTitle](self, "headerTitle");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitle:", v16);
    goto LABEL_16;
  }

LABEL_9:
  v17 = (void *)*MEMORY[0x1E0DC48A0];
  v16 = v11;
  v18 = v17;
  if (v18 == v16)
  {

  }
  else
  {
    v15 = v18;
    if (!v11 || !v18)
      goto LABEL_16;
    v19 = objc_msgSend(v16, "isEqualToString:", v18);

    if (!v19)
      goto LABEL_17;
  }
  v15 = v20;
  objc_msgSend(v15, "setBottomInsetType:", 2);
  objc_msgSend(v15, "setHorizontalAlignment:", 0);
  -[PKDailyCashSelectionSectionController footerTitle](self, "footerTitle");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFooterText:", v16);
LABEL_16:

LABEL_17:
}

- (id)headerTitle
{
  return (id)PKLocalizedFeatureString();
}

- (id)footerTitle
{
  id v3;
  unint64_t currentDestination;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  currentDestination = self->_currentDestination;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_currentDailyCashSelectionItems;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v27;
    v10 = currentDestination | 2;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "redemptionType", (_QWORD)v26);
        v14 = objc_msgSend(v12, "state");
        if (v13 == 3)
        {
          v8 = 1;
        }
        else if (v13 != 1)
        {
          continue;
        }
        if (v14 != 1 && (self->_currentDestination == v13 || v10 == 2))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v16);

        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (!v7)
        goto LABEL_21;
    }
  }
  v8 = 0;
LABEL_21:

  if (self->_allowStatementCreditRedemption
    && objc_msgSend(v3, "count") == 1
    && (objc_msgSend(v3, "anyObject"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "integerValue"),
        v17,
        v18 == 1))
  {
    PKLocalizedFeatureString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByAppendingString:", CFSTR("\n"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = &stru_1E3E7D690;
  }
  PKLocalizedFeatureString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingString:](v20, "stringByAppendingString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v22, "stringByAppendingString:", CFSTR("\n"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    PKLocalizedFeatureString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByAppendingString:", v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v22;
}

- (id)_presentingViewController
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "rewardsHubCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_viewControllerFromResponderChain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_setupAccessory
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0DC3578]);
  PKLocalizedFeatureString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithText:", v3);

  return v4;
}

- (id)_pendingApplicationAccessory
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0DC3578]);
  PKLocalizedFeatureString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithText:", v3);

  return v4;
}

- (id)_disclosureAccessory
{
  return objc_alloc_init(MEMORY[0x1E0DC3568]);
}

- (id)_checkmarkAccessory
{
  return objc_alloc_init(MEMORY[0x1E0DC3548]);
}

- (id)_hasRedeemedAccessory
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0DC3578]);
  PKLocalizedFeatureString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithText:", v3);

  return v4;
}

- (id)_applyAccessory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC3428];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __56__PKDailyCashSelectionSectionController__applyAccessory__block_invoke;
  v15 = &unk_1E3E62BD0;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v2, "actionWithHandler:", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3518];
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration", v12, v13, v14, v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonWithConfiguration:primaryAction:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  objc_msgSend(v6, "setConfiguration:", v7);
  objc_msgSend(v6, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLineBreakMode:", 4);

  PKLocalizedFeatureString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pkui_updateConfigurationWithTitle:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v6, 1);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return v10;
}

void __56__PKDailyCashSelectionSectionController__applyAccessory__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_applyRewardsAsStatementCredit");

}

- (id)_spinnerAccessory
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3438]);
  objc_msgSend(v2, "startAnimating");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v2, 1);

  return v3;
}

- (void)_reloadSection
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadDataForSectionIdentifier:animated:", self->_identifier, 1);

}

- (void)_applyRewardsAsStatementCredit
{
  NSObject *v2;
  void *v4;
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
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  NSObject *v19;
  PKDailyCashSelectionSectionController *v20;
  id v21;
  id buf[2];

  if (self->_loadingDestination)
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Already changing rewards destination", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountSummary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountUserCollection currentAccountUser](self->_accountUserCollection, "currentAccountUser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
      goto LABEL_6;
    objc_msgSend(v6, "altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountUserActivityForAccountUserAltDSID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rewardsBalance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
LABEL_6:
      objc_msgSend(v5, "rewardsBalance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_initWeak(buf, self);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __71__PKDailyCashSelectionSectionController__applyRewardsAsStatementCredit__block_invoke;
    v17 = &unk_1E3E73478;
    objc_copyWeak(&v21, buf);
    v11 = v10;
    v18 = v11;
    v2 = v4;
    v19 = v2;
    v20 = self;
    v12 = _Block_copy(&v14);
    PKLocalizedFeatureString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDailyCashSelectionSectionController presentConfirmationAlertWithTitle:redemptionType:confirmationHandler:](self, "presentConfirmationAlertWithTitle:redemptionType:confirmationHandler:", v13, 2, v12, v14, v15, v16, v17);

    objc_destroyWeak(&v21);
    objc_destroyWeak(buf);

  }
}

void __71__PKDailyCashSelectionSectionController__applyRewardsAsStatementCredit__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  uint64_t v18;
  id v19;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[9] = 2;
    objc_msgSend(WeakRetained, "_reloadSection");
    v6 = objc_alloc_init(MEMORY[0x1E0D66828]);
    objc_msgSend(v6, "setActionType:", 0);
    objc_msgSend(v6, "setAmount:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "currencyCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCurrencyCode:", v7);

    objc_msgSend(v6, "setRedemptionType:", 2);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIdentifier:", v9);

    v10 = (void *)v5[11];
    objc_msgSend((id)v5[3], "accountIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v5[4], "currentAccountUser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "altDSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __71__PKDailyCashSelectionSectionController__applyRewardsAsStatementCredit__block_invoke_2;
    v17 = &unk_1E3E696E8;
    objc_copyWeak(&v19, (id *)(a1 + 56));
    v18 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v10, "performAccountAction:withAccountIdentifier:accountUserAltDSID:completion:", v6, v11, v13, &v14);

    objc_msgSend(*(id *)(a1 + 48), "_reportDailyCashConfirmationEventWithRedemptionType:button:", 2, *MEMORY[0x1E0D68948], v14, v15, v16, v17);
    objc_destroyWeak(&v19);

  }
}

void __71__PKDailyCashSelectionSectionController__applyRewardsAsStatementCredit__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__PKDailyCashSelectionSectionController__applyRewardsAsStatementCredit__block_invoke_3;
  v10[3] = &unk_1E3E65CC0;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v14);
}

void __71__PKDailyCashSelectionSectionController__applyRewardsAsStatementCredit__block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v7 = WeakRetained;
      PKAccountDisplayableError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_presentingViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      objc_msgSend(v4, "presentViewController:animated:completion:", v5, 1, 0);

LABEL_6:
      WeakRetained = v7;
      goto LABEL_7;
    }
    v6 = *(void **)(a1 + 48);
    if (v6)
    {
      v7 = WeakRetained;
      objc_storeStrong(WeakRetained + 3, v6);
      v7[9] = 0;
      *((_BYTE *)v7 + 80) = 1;
      objc_msgSend(v7, "_reloadSection");
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)_changeRewardsDestinationAndOpenAccountIfNeeded:(unint64_t)a3
{
  NSObject *v3;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  PKPeerPaymentAccountResolutionController *peerPaymentAccountResolutionController;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  PKFeatureOnBoardingViewController *v15;
  void *v16;
  void *v17;
  PKFeatureOnBoardingViewController *v18;
  void *v19;
  PKNavigationController *v20;
  void *v21;
  NSObject *v22;
  _QWORD aBlock[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id buf[2];

  if (self->_loadingDestination)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Already changing rewards destination", (uint8_t *)buf, 2u);
    }

  }
  else if (a3 == 3)
  {
    -[PKDailyCashSelectionSectionController _eligibleAccountOfType:](self, "_eligibleAccountOfType:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[PKDailyCashSelectionSectionController _changeRewardsDestination:](self, "_changeRewardsDestination:", 3);
    }
    else
    {
      self->_loadingDestination = 3;
      -[PKDailyCashSelectionSectionController _reloadSection](self, "_reloadSection");
      -[PKAccount redeemRewardsFeatureDescriptor](self->_account, "redeemRewardsFeatureDescriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "productForFeature:", 5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = objc_alloc(MEMORY[0x1E0D67230]);
        objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithWebService:", v13);

        objc_msgSend(v14, "setReferrerIdentifier:", CFSTR("cid%3Dapy-930-10001"));
        v15 = [PKFeatureOnBoardingViewController alloc];
        objc_msgSend(v11, "onboardingItems");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[PKFeatureOnBoardingViewController initWithParentFlowController:setupDelegate:setupContext:onboardingContext:featureIdentifier:provisioningController:paymentSetupProduct:currentPage:](v15, "initWithParentFlowController:setupDelegate:setupContext:onboardingContext:featureIdentifier:provisioningController:paymentSetupProduct:currentPage:", 0, 0, 0, 0, 5, v14, v11, v17);

        objc_initWeak(buf, self);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __89__PKDailyCashSelectionSectionController__changeRewardsDestinationAndOpenAccountIfNeeded___block_invoke_206;
        aBlock[3] = &unk_1E3E61310;
        objc_copyWeak(&v24, buf);
        v19 = _Block_copy(aBlock);
        v20 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v18);
        -[PKNavigationController setModalInPresentation:](v20, "setModalInPresentation:", 1);
        -[PKDailyCashSelectionSectionController _presentingViewController](self, "_presentingViewController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "presentViewController:animated:completion:", v20, 1, v19);

        objc_destroyWeak(&v24);
        objc_destroyWeak(buf);

      }
      else
      {
        PKLogFacilityTypeGetObject();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_19D178000, v22, OS_LOG_TYPE_DEFAULT, "Cannot retrieve savings product to present apply flow", (uint8_t *)buf, 2u);
        }

        self->_loadingDestination = 0;
        -[PKDailyCashSelectionSectionController _reloadSection](self, "_reloadSection");
      }

    }
  }
  else if (a3 == 1)
  {
    if (PKUserHasDisabledPeerPayment())
    {
      -[PKDailyCashSelectionSectionController _presentPeerPaymentNotEnabledAlert](self, "_presentPeerPaymentNotEnabledAlert");
    }
    else
    {
      v6 = -[PKPeerPaymentAccountResolutionController currentPeerPaymentAccountResolution](self->_peerPaymentAccountResolutionController, "currentPeerPaymentAccountResolution");
      if (v6)
      {
        v7 = v6;
        objc_initWeak(buf, self);
        self->_loadingDestination = 1;
        -[PKDailyCashSelectionSectionController _reloadSection](self, "_reloadSection");
        v8 = objc_alloc_init(MEMORY[0x1E0D673D8]);
        objc_msgSend(v8, "setRegistrationFlowState:", 6);
        peerPaymentAccountResolutionController = self->_peerPaymentAccountResolutionController;
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __89__PKDailyCashSelectionSectionController__changeRewardsDestinationAndOpenAccountIfNeeded___block_invoke;
        v25[3] = &unk_1E3E61C58;
        objc_copyWeak(&v26, buf);
        -[PKPeerPaymentAccountResolutionController presentFlowForAccountResolution:configuration:completion:](peerPaymentAccountResolutionController, "presentFlowForAccountResolution:configuration:completion:", v7, v8, v25);
        objc_destroyWeak(&v26);

        objc_destroyWeak(buf);
      }
      else
      {
        -[PKDailyCashSelectionSectionController _changeRewardsDestination:](self, "_changeRewardsDestination:", 1);
      }
    }
  }
}

void __89__PKDailyCashSelectionSectionController__changeRewardsDestinationAndOpenAccountIfNeeded___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[9] = 0;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_reloadSection");
    WeakRetained = v2;
  }

}

void __89__PKDailyCashSelectionSectionController__changeRewardsDestinationAndOpenAccountIfNeeded___block_invoke_206(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[9] = 0;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_reloadSection");
    WeakRetained = v2;
  }

}

- (void)_changeRewardsDestination:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  PKDailyCashSelectionSectionController *v15;
  id v16[2];
  id buf[2];

  if (self->_loadingDestination)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Already changing rewards destination", (uint8_t *)buf, 2u);
    }

  }
  if (a3 != 3)
  {
    if (a3 != 1)
    {
      v6 = 0;
      v7 = 0;
      goto LABEL_12;
    }
    PKLocalizedFeatureString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (!v6)
      goto LABEL_12;
    goto LABEL_10;
  }
  PKLocalizedFeatureString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDailyCashSelectionSectionController _eligibleAccountOfType:](self, "_eligibleAccountOfType:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
LABEL_10:
    objc_initWeak(buf, self);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __67__PKDailyCashSelectionSectionController__changeRewardsDestination___block_invoke;
    v13 = &unk_1E3E760A0;
    objc_copyWeak(v16, buf);
    v16[1] = (id)a3;
    v7 = v7;
    v14 = v7;
    v15 = self;
    v9 = _Block_copy(&v10);
    -[PKDailyCashSelectionSectionController presentConfirmationAlertWithTitle:redemptionType:confirmationHandler:](self, "presentConfirmationAlertWithTitle:redemptionType:confirmationHandler:", v6, a3, v9, v10, v11, v12, v13);

    objc_destroyWeak(v16);
    objc_destroyWeak(buf);
  }
LABEL_12:

}

void __67__PKDailyCashSelectionSectionController__changeRewardsDestination___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12[2];
  id location;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[9] = *(_QWORD *)(a1 + 56);
    objc_msgSend(WeakRetained, "_reloadSection");
    v6 = objc_alloc_init(MEMORY[0x1E0D66828]);
    objc_msgSend(v6, "setActionType:", 2);
    objc_msgSend(v6, "setRedemptionType:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v6, "setIdentifier:", *(_QWORD *)(a1 + 32));
    objc_initWeak(&location, *(id *)(a1 + 40));
    v7 = (void *)v5[11];
    objc_msgSend((id)v5[3], "accountIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v5[4], "currentAccountUser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "altDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__PKDailyCashSelectionSectionController__changeRewardsDestination___block_invoke_2;
    v11[3] = &unk_1E3E76078;
    objc_copyWeak(v12, &location);
    v12[1] = *(id *)(a1 + 56);
    objc_msgSend(v7, "performAccountAction:withAccountIdentifier:accountUserAltDSID:completion:", v6, v8, v10, v11);

    objc_msgSend(*(id *)(a1 + 40), "_reportDailyCashConfirmationEventWithRedemptionType:button:", *(_QWORD *)(a1 + 56), *MEMORY[0x1E0D68948]);
    objc_destroyWeak(v12);
    objc_destroyWeak(&location);

  }
}

void __67__PKDailyCashSelectionSectionController__changeRewardsDestination___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12[2];

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__PKDailyCashSelectionSectionController__changeRewardsDestination___block_invoke_3;
  v9[3] = &unk_1E3E65C70;
  objc_copyWeak(v12, (id *)(a1 + 32));
  v10 = v6;
  v11 = v5;
  v12[1] = *(id *)(a1 + 40);
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(v12);
}

void __67__PKDailyCashSelectionSectionController__changeRewardsDestination___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
    {
      PKAccountDisplayableError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_presentingViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      objc_msgSend(v4, "presentViewController:animated:completion:", v5, 1, 0);

      WeakRetained = v7;
    }
    else
    {
      v6 = *(void **)(a1 + 40);
      if (v6)
      {
        objc_storeStrong((id *)WeakRetained + 3, v6);
        WeakRetained = v7;
        v7[8] = *(_QWORD *)(a1 + 56);
      }
    }
    *((_QWORD *)WeakRetained + 9) = 0;
    objc_msgSend(WeakRetained, "_reloadSection");
    WeakRetained = v7;
  }

}

- (void)_reportDailyCashConfirmationEventWithRedemptionType:(unint64_t)a3 button:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = a4;
  -[PKDailyCashSelectionSectionController analyticsEventReportWithPreSelect:](self, "analyticsEventReportWithPreSelect:", 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 - 1 > 2)
    v7 = CFSTR("unknown");
  else
    v7 = (__CFString *)**((id **)&unk_1E3E76178 + a3 - 1);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D68F50]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68B18], *MEMORY[0x1E0D68AA0]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D68858]);

  v8 = (void *)MEMORY[0x1E0D66A58];
  v9 = *MEMORY[0x1E0D698C0];
  v10 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v8, "subject:sendEvent:", v9, v10);

}

- (void)_reportDestinationButtonTapWithRedemptionType:(unint64_t)a3
{
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[PKDailyCashSelectionSectionController analyticsEventReportWithPreSelect:](self, "analyticsEventReportWithPreSelect:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D689B0], *MEMORY[0x1E0D68F50]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68B18], *MEMORY[0x1E0D68AA0]);
  if (a3 - 1 > 2)
    v4 = CFSTR("unknown");
  else
    v4 = (__CFString *)**((id **)&unk_1E3E76160 + a3 - 1);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D68858]);
  v5 = (void *)MEMORY[0x1E0D66A58];
  v6 = *MEMORY[0x1E0D698C0];
  v7 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v5, "subject:sendEvent:", v6, v7);

}

- (void)presentConfirmationAlertWithTitle:(id)a3 redemptionType:(unint64_t)a4 confirmationHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[6];
  _QWORD aBlock[4];
  id v22[2];
  id location;

  v8 = a3;
  v9 = a5;
  if (v9 && objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v8, 0, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedFeatureString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v13);

    objc_initWeak(&location, self);
    v14 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __110__PKDailyCashSelectionSectionController_presentConfirmationAlertWithTitle_redemptionType_confirmationHandler___block_invoke;
    aBlock[3] = &unk_1E3E706F0;
    objc_copyWeak(v22, &location);
    v22[1] = (id)a4;
    v15 = _Block_copy(aBlock);
    v16 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedFeatureString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v18);

    -[PKDailyCashSelectionSectionController _presentingViewController](self, "_presentingViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __110__PKDailyCashSelectionSectionController_presentConfirmationAlertWithTitle_redemptionType_confirmationHandler___block_invoke_2;
    v20[3] = &unk_1E3E62010;
    v20[4] = self;
    v20[5] = a4;
    objc_msgSend(v19, "presentViewController:animated:completion:", v10, 1, v20);

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);

  }
}

void __110__PKDailyCashSelectionSectionController_presentConfirmationAlertWithTitle_redemptionType_confirmationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_reportDailyCashConfirmationEventWithRedemptionType:button:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0D688E8]);
    WeakRetained = v3;
  }

}

void __110__PKDailyCashSelectionSectionController_presentConfirmationAlertWithTitle_redemptionType_confirmationHandler___block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  __CFString *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "analyticsEventReportWithPreSelect:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40) - 1;
  if (v2 > 2)
    v3 = CFSTR("unknown");
  else
    v3 = (__CFString *)**((id **)&unk_1E3E76178 + v2);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D68F50]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D68C50], *MEMORY[0x1E0D68AA0]);
  v4 = (void *)MEMORY[0x1E0D66A58];
  v5 = *MEMORY[0x1E0D698C0];
  v6 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "subject:sendEvent:", v5, v6);

}

- (void)_presentPeerPaymentNotEnabledAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ERROR_APPLE_CASH_REENABLE_TITLE"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ERROR_APPLE_CASH_REENABLE_MESSAGE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v12, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ERROR_OPEN_SETTINGS_BUTTON"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 0, &__block_literal_global_227);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addAction:", v7);
  v8 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("CANCEL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v10);

  -[PKDailyCashSelectionSectionController _presentingViewController](self, "_presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentViewController:animated:completion:", v4, 1, 0);

}

void __75__PKDailyCashSelectionSectionController__presentPeerPaymentNotEnabledAlert__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=PASSBOOK"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, 0);

}

- (void)accountAdded:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__PKDailyCashSelectionSectionController_accountAdded___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __54__PKDailyCashSelectionSectionController_accountAdded___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "arrayByAddingObject:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "_reloadSection");
}

- (void)accountChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PKDailyCashSelectionSectionController_accountChanged___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __56__PKDailyCashSelectionSectionController_accountChanged___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  char v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        objc_msgSend(*(id *)(a1 + 40), "accountIdentifier", (_QWORD)v28);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "accountIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        v10 = v8;
        if (v9 == v10)
        {

LABEL_18:
          v3 = v6;
          goto LABEL_19;
        }
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

          if ((v13 & 1) != 0)
            goto LABEL_18;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_19:

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "pk_arrayByRemovingObject:", v3);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 48);
  *(_QWORD *)(v15 + 48) = v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "arrayByAddingObject:", *(_QWORD *)(a1 + 40));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 48);
  *(_QWORD *)(v18 + 48) = v17;

  objc_msgSend(*(id *)(a1 + 40), "accountIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "accountIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20;
  v23 = v21;
  if (v22 == v23)
  {

  }
  else
  {
    v24 = v23;
    if (!v22 || !v23)
    {

      goto LABEL_27;
    }
    v25 = objc_msgSend(v22, "isEqualToString:", v23);

    if ((v25 & 1) == 0)
      goto LABEL_28;
  }
  v26 = *(_QWORD *)(a1 + 32);
  v27 = *(id *)(a1 + 40);
  v22 = *(id *)(v26 + 24);
  *(_QWORD *)(v26 + 24) = v27;
LABEL_27:

LABEL_28:
  objc_msgSend(*(id *)(a1 + 32), "_reloadSection", (_QWORD)v28);

}

- (void)accountRemoved:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PKDailyCashSelectionSectionController_accountRemoved___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __56__PKDailyCashSelectionSectionController_accountRemoved___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(*(id *)(a1 + 40), "accountIdentifier", (_QWORD)v17);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "accountIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        v10 = v8;
        if (v9 == v10)
        {

LABEL_18:
          v3 = v6;
          goto LABEL_19;
        }
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

          if ((v13 & 1) != 0)
            goto LABEL_18;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_19:

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "pk_arrayByRemovingObject:", v3);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 48);
  *(_QWORD *)(v15 + 48) = v14;

  objc_msgSend(*(id *)(a1 + 32), "_reloadSection");
}

- (void)featureApplicationAdded:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PKDailyCashSelectionSectionController_featureApplicationAdded___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __65__PKDailyCashSelectionSectionController_featureApplicationAdded___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "arrayByAddingObject:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "pk_firstObjectPassingTest:", &__block_literal_global_234);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v5;

  return objc_msgSend(*(id *)(a1 + 32), "_reloadSection");
}

BOOL __65__PKDailyCashSelectionSectionController_featureApplicationAdded___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "feature") == 5 && objc_msgSend(v2, "applicationState") == 5;

  return v3;
}

- (void)featureApplicationChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__PKDailyCashSelectionSectionController_featureApplicationChanged___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __67__PKDailyCashSelectionSectionController_featureApplicationChanged___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        objc_msgSend(*(id *)(a1 + 40), "applicationIdentifier", (_QWORD)v23);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "accountIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        v10 = v8;
        if (v9 == v10)
        {

LABEL_18:
          v3 = v6;
          goto LABEL_19;
        }
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

          if ((v13 & 1) != 0)
            goto LABEL_18;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_19:

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "pk_arrayByRemovingObject:", v3);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 56);
  *(_QWORD *)(v15 + 56) = v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "arrayByAddingObject:", *(_QWORD *)(a1 + 40));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 56);
  *(_QWORD *)(v18 + 56) = v17;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "pk_firstObjectPassingTest:", &__block_literal_global_235);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 112);
  *(_QWORD *)(v21 + 112) = v20;

  objc_msgSend(*(id *)(a1 + 32), "_reloadSection");
}

BOOL __67__PKDailyCashSelectionSectionController_featureApplicationChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "feature") == 5 && objc_msgSend(v2, "applicationState") == 5;

  return v3;
}

- (void)featureApplicationRemoved:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__PKDailyCashSelectionSectionController_featureApplicationRemoved___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __67__PKDailyCashSelectionSectionController_featureApplicationRemoved___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        objc_msgSend(*(id *)(a1 + 40), "accountIdentifier", (_QWORD)v20);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "accountIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        v10 = v8;
        if (v9 == v10)
        {

LABEL_18:
          v3 = v6;
          goto LABEL_19;
        }
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

          if ((v13 & 1) != 0)
            goto LABEL_18;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_19:

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "pk_arrayByRemovingObject:", v3);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 56);
  *(_QWORD *)(v15 + 56) = v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "pk_firstObjectPassingTest:", &__block_literal_global_236);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 112);
  *(_QWORD *)(v18 + 112) = v17;

  objc_msgSend(*(id *)(a1 + 32), "_reloadSection");
}

BOOL __67__PKDailyCashSelectionSectionController_featureApplicationRemoved___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "feature") == 5 && objc_msgSend(v2, "applicationState") == 5;

  return v3;
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  id v6;
  id v7;

  v6 = a4;
  -[PKDailyCashSelectionSectionController _presentingViewController](self, "_presentingViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  id v5;

  -[PKDailyCashSelectionSectionController _reloadSection](self, "_reloadSection", a3, a4);
  -[PKDailyCashSelectionSectionController _presentingViewController](self, "_presentingViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)paymentSetupDidFinish:(id)a3
{
  id v4;

  -[PKDailyCashSelectionSectionController _reloadSection](self, "_reloadSection", a3);
  -[PKDailyCashSelectionSectionController _presentingViewController](self, "_presentingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDailyCashSelectionItems, 0);
  objc_storeStrong((id *)&self->_pendingSavingsApplication, 0);
  objc_storeStrong((id *)&self->_applyService, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountResolutionController, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
