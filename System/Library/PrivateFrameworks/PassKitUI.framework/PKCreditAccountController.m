@implementation PKCreditAccountController

+ (void)resolutionToReceiveCashbackForAccount:(id)a3 accountUser:(id)a4 withPeerPaymentAccount:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  _QWORD *v41;
  uint64_t v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD *v47;
  _QWORD v48[5];
  id v49;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    objc_msgSend(v9, "creditDetails");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v9 && v13)
    {
      v26 = v11;
      v27 = v10;
      v15 = objc_msgSend(v13, "rewardsDestination");
      objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_opt_new();
      v48[0] = 0;
      v48[1] = v48;
      v48[2] = 0x3032000000;
      v48[3] = __Block_byref_object_copy__4;
      v48[4] = __Block_byref_object_dispose__4;
      v49 = 0;
      v18 = MEMORY[0x1E0C809B0];
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __113__PKCreditAccountController_resolutionToReceiveCashbackForAccount_accountUser_withPeerPaymentAccount_completion___block_invoke;
      v45[3] = &unk_1E3E64F70;
      v19 = v16;
      v46 = v19;
      v47 = v48;
      objc_msgSend(v17, "addOperation:", v45);
      v43[0] = 0;
      v43[1] = v43;
      v43[2] = 0x3032000000;
      v43[3] = __Block_byref_object_copy__4;
      v43[4] = __Block_byref_object_dispose__4;
      v44 = 0;
      v37[0] = v18;
      v37[1] = 3221225472;
      v37[2] = __113__PKCreditAccountController_resolutionToReceiveCashbackForAccount_accountUser_withPeerPaymentAccount_completion___block_invoke_3;
      v37[3] = &unk_1E3E64FC0;
      v24 = v19;
      v25 = v15;
      v38 = v24;
      v42 = v15;
      v20 = v9;
      v39 = v20;
      v10 = v27;
      v21 = v27;
      v40 = v21;
      v41 = v43;
      objc_msgSend(v17, "addOperation:", v37);
      v11 = v26;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __113__PKCreditAccountController_resolutionToReceiveCashbackForAccount_accountUser_withPeerPaymentAccount_completion___block_invoke_5;
      v28[3] = &unk_1E3E64FE8;
      v29 = v14;
      v30 = v21;
      v31 = v20;
      v34 = v43;
      v35 = v48;
      v32 = v26;
      v36 = v25;
      v33 = v12;
      v23 = (id)objc_msgSend(v17, "evaluateWithInput:completion:", v22, v28);

      _Block_object_dispose(v43, 8);
      _Block_object_dispose(v48, 8);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v12 + 2))(v12, 0, 0, 0, 0);
    }

  }
}

void __113__PKCreditAccountController_resolutionToReceiveCashbackForAccount_accountUser_withPeerPaymentAccount_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __113__PKCreditAccountController_resolutionToReceiveCashbackForAccount_accountUser_withPeerPaymentAccount_completion___block_invoke_2;
  v12[3] = &unk_1E3E635E8;
  v9 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v14 = v7;
  v15 = v8;
  v13 = v6;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "defaultAccountForFeature:completion:", 5, v12);

}

void __113__PKCreditAccountController_resolutionToReceiveCashbackForAccount_accountUser_withPeerPaymentAccount_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __113__PKCreditAccountController_resolutionToReceiveCashbackForAccount_accountUser_withPeerPaymentAccount_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "accountIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __113__PKCreditAccountController_resolutionToReceiveCashbackForAccount_accountUser_withPeerPaymentAccount_completion___block_invoke_4;
  v15[3] = &unk_1E3E64F98;
  v12 = *(_QWORD *)(a1 + 56);
  v17 = v7;
  v18 = v12;
  v16 = v6;
  v13 = v6;
  v14 = v7;
  objc_msgSend(v9, "lastRedemptionEventToDestination:forAccountIdentifier:altDSID:completion:", v8, v10, v11, v15);

}

void __113__PKCreditAccountController_resolutionToReceiveCashbackForAccount_accountUser_withPeerPaymentAccount_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __113__PKCreditAccountController_resolutionToReceiveCashbackForAccount_accountUser_withPeerPaymentAccount_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "accountSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  if (!v3)
    goto LABEL_3;
  objc_msgSend(v3, "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountUserActivityForAccountUserAltDSID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rewardsBalance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_3:
    objc_msgSend(v2, "rewardsBalance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_msgSend(v6, "pk_isPositiveNumber");
  if (objc_msgSend(*(id *)(a1 + 48), "accessLevel") != 1)
  {
    v14 = 0;
    goto LABEL_32;
  }
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (!v8)
  {
    v14 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v8, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v29 = 138412290;
      v30 = v16;
      v17 = "Redemption allowed, malformed last event %@";
LABEL_15:
      _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v29, 0xCu);
    }
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(v10, "status");
  v11 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 != CFSTR("success"))
  {
    if (v11)
    {
      v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("success"));

      if (v13)
        goto LABEL_11;

      if (!v7)
      {
LABEL_17:
        v14 = 2;
        goto LABEL_18;
      }
    }
    else if ((v7 & 1) == 0)
    {
      goto LABEL_17;
    }
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v29 = 138412290;
      v30 = v28;
      v17 = "Redemption allowed, user has pending rewards and last redemption was not successful %@";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
LABEL_11:

  v14 = 1;
LABEL_18:

LABEL_20:
  v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  if (v18)
    v19 = objc_msgSend(v18, "state") == 1;
  else
    v19 = 0;
  v20 = *(void **)(a1 + 56);
  if (v20)
  {
    if (objc_msgSend(v20, "stage") != 1)
      goto LABEL_32;
    v21 = objc_msgSend(*(id *)(a1 + 56), "state") != 1;
  }
  else
  {
    v21 = 0;
  }
  if (((v7 ^ 1 | v19) & 1) == 0 && !v21)
  {
    PKLogFacilityTypeGetObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_19D178000, v22, OS_LOG_TYPE_DEFAULT, "Redemption allowed, user has pending rewards and Cash and Savings accounts not set up or ineligible", (uint8_t *)&v29, 2u);
    }

  }
LABEL_32:
  if (*(_QWORD *)(a1 + 88) != 3 && *(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "associatedPassUniqueID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "passWithUniqueID:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "paymentPass");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = PKPeerPaymentAccountResolutionForAccountAndPeerPaymentPass();
    if ((unint64_t)(v27 - 1) >= 4 && !v27 && v14 == 2)
      objc_msgSend(*(id *)(a1 + 56), "stage");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

+ (BOOL)shouldDisplayAccountInformationForTransactionSourceCollection:(id)a3 withAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "paymentPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "devicePrimaryPaymentApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "feature") == 2 && objc_msgSend(v7, "isClosedAndChargedOff") && !v9)
  {
    v10 = objc_msgSend(a1, "_shouldDisplayBalanceForAccount:", v7);
  }
  else
  {
    if (!objc_msgSend(a1, "_shouldDisplayBalanceForAccount:", v7))
    {
      v11 = 0;
      goto LABEL_9;
    }
    v10 = objc_msgSend(a1, "_shouldDisplayBalanceAndTransactionsForTransactionSourceCollection:", v6);
  }
  v11 = v10;
LABEL_9:

  return v11;
}

+ (BOOL)shouldDisplayTransactionsForTransactionSourceCollection:(id)a3 withAccount:(id)a4
{
  id v6;
  char v7;

  v6 = a3;
  if (objc_msgSend(a1, "_shouldDisplayTransactionsForAccount:", a4))
    v7 = objc_msgSend(a1, "_shouldDisplayBalanceAndTransactionsForTransactionSourceCollection:", v6);
  else
    v7 = 0;

  return v7;
}

+ (BOOL)_shouldDisplayBalanceAndTransactionsForTransactionSourceCollection:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;
  unsigned int v6;

  objc_msgSend(a3, "paymentPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "devicePrimaryPaymentApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "state");
    if (v5 <= 0xF)
      v6 = (0x867Eu >> v5) & 1;
    else
      LOBYTE(v6) = 0;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)_shouldDisplayBalanceForAccount:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  unint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  if ((objc_msgSend(v3, "blockAllAccountAccess") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "creditDetails");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (v6 = objc_msgSend(v3, "state"), v6 <= 5) && ((1 << v6) & 0x29) == 0)
    {
      if (((1 << v6) & 6) != 0)
      {
        v4 = 1;
      }
      else
      {
        objc_msgSend(v3, "creditDetails");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "accountSummary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "currentBalance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = 0;
        if (objc_msgSend(v3, "supportsSchedulePayment") && v10)
        {
          objc_msgSend(MEMORY[0x1E0CB3598], "zero");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = objc_msgSend(v10, "compare:", v11) != 0;

        }
      }
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

+ (BOOL)_shouldDisplayTransactionsForAccount:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  unint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  if ((objc_msgSend(v3, "blockAllAccountAccess") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "creditDetails");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (v6 = objc_msgSend(v3, "state"), v6 <= 5) && ((1 << v6) & 0x29) == 0)
    {
      if (((1 << v6) & 6) != 0)
      {
        v4 = 1;
      }
      else
      {
        objc_msgSend(v3, "creditDetails");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "accountSummary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "currentBalance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0CB3598], "zero");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = objc_msgSend(v10, "compare:", v11) != 0;

        }
        else
        {
          v4 = 0;
        }

      }
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

+ (id)relevantScheduledPaymentFromScheduledPayments:(id)a3 account:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v32;
  void *v33;
  void *v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99D48];
  v7 = a3;
  v8 = [v6 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v5, "creditDetails");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "productTimeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeZone:", v11);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "components:fromDate:", 28, v12);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v9;
  objc_msgSend(v9, "dateFromComponents:", v33);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __83__PKCreditAccountController_relevantScheduledPaymentFromScheduledPayments_account___block_invoke;
  v40[3] = &unk_1E3E65010;
  v32 = v5;
  v41 = v32;
  objc_msgSend(v7, "pk_objectsPassingTest:", v40);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v14;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = 0;
    v19 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v37 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v21, "scheduleDetails");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "frequency");

        objc_msgSend(v21, "scheduleDetails");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "scheduledDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23 >= 2
          && (objc_msgSend(v25, "compare:", v13) == 1 || !objc_msgSend(v25, "compare:", v13))
          && (!v18 || v17 && objc_msgSend(v25, "compare:", v17) == -1))
        {
          v26 = v21;

          objc_msgSend(v26, "scheduleDetails");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "scheduledDate");
          v28 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v28;
          v18 = v26;
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }

  v29 = v41;
  v30 = v18;

  return v30;
}

uint64_t __83__PKCreditAccountController_relevantScheduledPaymentFromScheduledPayments_account___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isOnHoldForAccount:", *(_QWORD *)(a1 + 32)) ^ 1;
}

+ (unint64_t)paymentEducationStateForAccount:(id)a3 mostRecentTransactions:(id)a4 pendingPayments:(id)a5 upcomingScheduledPayments:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  char v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  void *v57;
  void *v58;
  int v59;
  BOOL v60;
  BOOL v62;
  uint64_t v63;
  _BOOL4 v64;
  _BOOL4 v65;
  _BOOL4 v66;
  char v67;
  uint64_t v68;
  _BOOL4 v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[4];
  id v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "creditDetails");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accountSummary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "remainingStatementBalance");
  v75 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "remainingMinimumPayment");
  v76 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "adjustedBalance");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pastDueAmount");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v15, "cyclesPastDue");
  objc_msgSend(v15, "paymentDueDate");
  v70 = objc_claimAutoreleasedReturnValue();
  v71 = v14;
  objc_msgSend(v14, "createdDate");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "transactionDate");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0C99D48]);
  v86 = (void *)objc_msgSend(v16, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v72 = v13;
  objc_msgSend(a1, "relevantScheduledPaymentFromScheduledPayments:account:", v13, v10);
  v74 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = MEMORY[0x1E0C809B0];
  v91[1] = 3221225472;
  v91[2] = __126__PKCreditAccountController_paymentEducationStateForAccount_mostRecentTransactions_pendingPayments_upcomingScheduledPayments___block_invoke;
  v91[3] = &unk_1E3E65038;
  v81 = v15;
  v92 = v81;
  v73 = v11;
  objc_msgSend(v11, "pk_objectsPassingTest:", v91);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v18 = v12;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v88;
    do
    {
      v22 = 0;
      v23 = v17;
      do
      {
        if (*(_QWORD *)v88 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * v22), "currencyAmount");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "amount");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "decimalNumberByAdding:", v25);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        ++v22;
        v23 = v17;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
    }
    while (v20);
  }
  v78 = v10;

  if (v82)
  {
    v26 = v86;
    v27 = v80;
    objc_msgSend(v86, "components:fromDate:toDate:options:", 128, v82, v80, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "second");

    v30 = (void *)v75;
    v32 = v83;
    v31 = v84;
    if (v83)
      goto LABEL_10;
LABEL_16:
    v65 = 0;
    v34 = (void *)v76;
    if (!v31)
      goto LABEL_23;
    goto LABEL_21;
  }
  v29 = 0;
  v30 = (void *)v75;
  v32 = v83;
  v31 = v84;
  v26 = v86;
  v27 = v80;
  if (!v83)
    goto LABEL_16;
LABEL_10:
  objc_msgSend(v32, "transactionDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "compare:", v33) == 1)
  {
    v34 = (void *)v76;
    v65 = objc_msgSend(v32, "transactionType") == 10
       && (objc_msgSend(v32, "transactionStatus") == 1 || !objc_msgSend(v32, "transactionStatus"))
       && v29 < 61;
  }
  else
  {
    v65 = 0;
    v34 = (void *)v76;
  }

  v26 = v86;
  if (!v31)
    goto LABEL_23;
LABEL_21:
  if (objc_msgSend(v26, "isDate:equalToDate:toUnitGranularity:", v31, v27, 8))
  {
    v35 = objc_msgSend(v26, "isDate:equalToDate:toUnitGranularity:", v31, v27, 4) ^ 1;
    goto LABEL_24;
  }
LABEL_23:
  LOBYTE(v35) = 1;
LABEL_24:
  v67 = v35;
  v36 = v30;
  if (v30)
  {
    objc_msgSend(v30, "decimalNumberBySubtracting:", v17);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v37, "compare:", v38) != 1;

  }
  else
  {
    v64 = 1;
  }
  if (v85)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v85, "compare:", v39) == 1;

    if (v34)
    {
LABEL_29:
      objc_msgSend(v34, "decimalNumberBySubtracting:", v17);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v40, "compare:", v41) == 1;

      goto LABEL_32;
    }
  }
  else
  {
    v66 = 0;
    if (v34)
      goto LABEL_29;
  }
  v62 = 0;
LABEL_32:
  v42 = v77;
  if (v68 <= 0)
  {
    if (v77)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v77, "compare:", v43) == 1;

      v42 = v77;
    }
    else
    {
      v69 = 0;
    }
  }
  else
  {
    v69 = 1;
  }
  if (objc_msgSend(v78, "state") == 4)
    v44 = objc_msgSend(v78, "stateReason") == 1 || objc_msgSend(v78, "stateReason") == 8;
  else
    v44 = 0;
  v63 = objc_msgSend(v79, "count");
  v45 = objc_msgSend(v78, "state");
  objc_msgSend(v81, "currentStatement");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v46)
  {
    objc_msgSend(v46, "openingDate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      objc_msgSend(v47, "closingDate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v49)
      {
        objc_msgSend(v47, "statementBalance");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (v50)
        {
          objc_msgSend(v47, "paymentDueDate");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v51 != 0;

        }
        else
        {
          v52 = 0;
        }

        v36 = (void *)v75;
      }
      else
      {
        v52 = 0;
      }

      v42 = v77;
    }
    else
    {
      v52 = 0;
    }

    v34 = (void *)v76;
  }
  else
  {
    v52 = 0;
  }
  v53 = v67;
  if (v45 != 1)
    v53 = 1;
  if ((v53 & 1) == 0)
  {
    v54 = v36;
    if (v74)
      v56 = 9;
    else
      v56 = v66;
    goto LABEL_78;
  }
  if (!v66)
  {
    v54 = v36;
    v56 = 2;
LABEL_78:
    v57 = (void *)v70;
    v58 = (void *)v74;
    goto LABEL_79;
  }
  v54 = v36;
  v55 = 9;
  if (v65)
    v55 = 7;
  if (v69 || v44)
    v56 = 6;
  else
    v56 = v55;
  if (v69 || v44 || v65)
    goto LABEL_78;
  v57 = (void *)v70;
  v58 = (void *)v74;
  if (!v74)
  {
    v59 = !v52;
    if (v63)
      v59 = 1;
    if (!v70)
      v59 = 1;
    if ((v59 | v64) == 1)
    {
      v60 = v62;
      if (!v70)
        v60 = 0;
      if (v60)
      {
        v56 = 4;
      }
      else if (!v52 || v64)
      {
        v56 = 8;
      }
      else
      {
        v56 = 5;
      }
    }
    else
    {
      v56 = 3;
    }
    v58 = 0;
  }
LABEL_79:

  return v56;
}

BOOL __126__PKCreditAccountController_paymentEducationStateForAccount_mostRecentTransactions_pendingPayments_upcomingScheduledPayments___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v10;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "balanceSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openingDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "transactionDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "compare:", v5);

  v8 = objc_msgSend(v3, "transactionType");
  v10 = v8 == 10 && v7 == 1;

  return v10;
}

+ (BOOL)shouldDisplayScheduledPaymentsWithAccount:(id)a3 andPass:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67730]), "initWithPaymentPass:", v6);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67738]), "initWithTransactionSource:", v7);
  if (v5)
  {
    objc_msgSend(v5, "creditDetails");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "associatedAccountServiceAccountIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length")
         && objc_msgSend(v5, "supportsShowAccountSummary")
         && +[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:](PKCreditAccountController, "shouldDisplayAccountInformationForTransactionSourceCollection:withAccount:", v8, v5);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)shouldShowCardNumbersWithAccount:(id)a3 andPass:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "creditDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (unint64_t)(objc_msgSend(v5, "state") - 1) <= 1)
  {
    if ((objc_msgSend(v5, "supportsShowVirtualCard") & 1) != 0
      || (objc_msgSend(v5, "supportsRequestPhysicalCard") & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v6, "deviceAccountNumberSuffix");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "length") != 0;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
