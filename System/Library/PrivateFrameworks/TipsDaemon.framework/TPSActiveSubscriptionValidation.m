@implementation TPSActiveSubscriptionValidation

- (void)validateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v5 = (void *)getASDIAPHistoryClass_softClass;
  v16 = getASDIAPHistoryClass_softClass;
  v6 = MEMORY[0x1E0C809B0];
  if (!getASDIAPHistoryClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getASDIAPHistoryClass_block_invoke;
    v12[3] = &unk_1EA1DF510;
    v12[4] = &v13;
    __getASDIAPHistoryClass_block_invoke((uint64_t)v12);
    v5 = (void *)v14[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v13, 8);
  objc_msgSend(v7, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __58__TPSActiveSubscriptionValidation_validateWithCompletion___block_invoke;
  v10[3] = &unk_1EA1E10D8;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "getAllIAPsForActiveAccountWithResultHandler:", v10);

}

void __58__TPSActiveSubscriptionValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id *v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  int v17;
  NSObject *v18;
  _QWORD v19[4];
  void *v20;
  _QWORD v21[4];
  void *v22;
  _QWORD aBlock[4];
  id v24;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__TPSActiveSubscriptionValidation_validateWithCompletion___block_invoke_2;
      aBlock[3] = &unk_1EA1E1088;
      v10 = v8;
      v24 = v10;
      v11 = _Block_copy(aBlock);
      if (objc_msgSend(MEMORY[0x1E0DBF3A0], "debugActiveIAPs"))
      {
        v21[0] = v9;
        v21[1] = 3221225472;
        v21[2] = __58__TPSActiveSubscriptionValidation_validateWithCompletion___block_invoke_3;
        v21[3] = &unk_1EA1E10B0;
        v12 = &v22;
        v22 = v11;
        v13 = v11;
        objc_msgSend(v5, "na_filter:", v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count") != 0;

      }
      else
      {
        v19[0] = v9;
        v19[1] = 3221225472;
        v19[2] = __58__TPSActiveSubscriptionValidation_validateWithCompletion___block_invoke_3;
        v19[3] = &unk_1EA1E10B0;
        v12 = &v20;
        v20 = v11;
        v16 = v11;
        v15 = objc_msgSend(v5, "na_any:", v19);
      }

    }
    else
    {
      v15 = 0;
    }
    v17 = v15 ^ objc_msgSend(*(id *)(a1 + 32), "BOOLValue") ^ 1;
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      __61__TPSTravelESimEligibilityValidation_validateWithCompletion___block_invoke_cold_1((id *)(a1 + 32), v17, v18);

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();

}

BOOL __58__TPSActiveSubscriptionValidation_validateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 3)
  {
    objc_msgSend(v3, "expirationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "expirationDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "compare:", *(_QWORD *)(a1 + 32)) != -1;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __58__TPSActiveSubscriptionValidation_validateWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;

  v3 = a2;
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __58__TPSActiveSubscriptionValidation_validateWithCompletion___block_invoke_3_cold_1((uint64_t)v3, v5);

  }
  return v4;
}

uint64_t __58__TPSActiveSubscriptionValidation_validateWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__TPSActiveSubscriptionValidation_validateWithCompletion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_DEBUG, "Found subscription: %@", (uint8_t *)&v2, 0xCu);
}

@end
