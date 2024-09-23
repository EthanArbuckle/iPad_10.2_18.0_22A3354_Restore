@implementation ACAccount

void __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[16];
  _QWORD block[4];
  id v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_cold_2(v6, v7);

    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_cold_1();

  }
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_447;
    block[3] = &unk_1E98CF308;
    v20 = *(id *)(a1 + 40);
    v19 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v9 = v20;
  }
  else
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4F89000, v10, OS_LOG_TYPE_DEFAULT, "Nil credential token for FBK IDMS Service. Will renew", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "accountStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v21[0] = CFSTR("com.apple.gs.beta.auth");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_448;
    v15[3] = &unk_1E98CFDD8;
    v14 = *(void **)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v14;
    objc_msgSend(v11, "aida_renewCredentialsForAccount:services:completion:", v12, v13, v15);

    v9 = v16;
  }

}

uint64_t __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_447(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_448(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v5 = a3;
  switch(a2)
  {
    case 2:
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v7 = "renewal result: failed";
      goto LABEL_10;
    case 1:
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v7 = "renewal result: rejected";
      goto LABEL_10;
    case 0:
      +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v7 = "renewal result: renewed";
LABEL_10:
      _os_log_impl(&dword_1D4F89000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      goto LABEL_13;
  }
  +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_448_cold_2();
LABEL_13:

  if (v5)
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_448_cold_1();

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_449;
  v10[3] = &unk_1E98CF8E0;
  v9 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v9, "aida_tokenForService:completionHandler:", CFSTR("com.apple.gs.beta.auth"), v10);

}

void __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_449(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_449_cold_3(v6, v7);

    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_cold_1();

  }
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_2;
    block[3] = &unk_1E98CF308;
    v9 = &v13;
    v13 = *(id *)(a1 + 32);
    v12 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    +[SDSeedingLogging betaHandle](SDSeedingLogging, "betaHandle");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_449_cold_1();

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_450;
    v14[3] = &unk_1E98CF240;
    v9 = &v15;
    v15 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v14);
  }

}

uint64_t __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_450(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_1D4F89000, v0, v1, "Error details: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a2, v4, "Failed to get token for FBK IDMS Service: %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

void __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_448_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, v0, v1, "Credential renewal failed with [%{public}@]", v2);
  OUTLINED_FUNCTION_5();
}

void __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_448_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1D4F89000, v0, v1, "renewal result: unhandled case", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_449_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1D4F89000, v0, v1, "Credential token for FBK IDMS is nil after renewing credential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke_449_cold_3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_1D4F89000, a2, v4, "Failed to get token after renewal: %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

@end
