@implementation TRAnisetteDataHandler

- (void)registerForAnisetteDataRequestsFromSession:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setRequestHandler:forRequestClass:", &__block_literal_global_3, objc_opt_class());
  objc_msgSend(v3, "setRequestHandler:forRequestClass:", &__block_literal_global_6, objc_opt_class());
  objc_msgSend(v3, "setRequestHandler:forRequestClass:", &__block_literal_global_11, objc_opt_class());
  objc_msgSend(v3, "setRequestHandler:forRequestClass:", &__block_literal_global_16, objc_opt_class());
  objc_msgSend(v3, "setRequestHandler:forRequestClass:", &__block_literal_global_22, objc_opt_class());

}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_20A2BF000, v6, OS_LOG_TYPE_DEFAULT, "Received provision request: %@", buf, 0xCu);
    }

  }
  v7 = objc_alloc_init(MEMORY[0x24BE0ACB0]);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_1;
  v9[3] = &unk_24C2E51D8;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "provisionWithCompletion:", v9);

}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_1(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  TRProvisionAnisetteDataResponse *v7;

  v5 = a3;
  if (v5)
  {
    TRLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_1_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v7 = objc_alloc_init(TRProvisionAnisetteDataResponse);
    -[TRProvisionAnisetteDataResponse setDidSucceed:](v7, "setDidSucceed:", a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_20A2BF000, v6, OS_LOG_TYPE_DEFAULT, "Received sync request: %@", buf, 0xCu);
    }

  }
  v7 = (objc_class *)MEMORY[0x24BE0ACB0];
  v8 = v4;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v8, "simData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_7;
  v12[3] = &unk_24C2E51D8;
  v13 = v5;
  v11 = v5;
  objc_msgSend(v9, "syncWithSIMData:completion:", v10, v12);

}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  TRSyncAnisetteDataResponse *v7;

  v5 = a3;
  if (v5)
  {
    TRLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_7_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v7 = objc_alloc_init(TRSyncAnisetteDataResponse);
    -[TRSyncAnisetteDataResponse setDidSucceed:](v7, "setDidSucceed:", a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_20A2BF000, v6, OS_LOG_TYPE_DEFAULT, "Received erase request: %@", buf, 0xCu);
    }

  }
  v7 = objc_alloc_init(MEMORY[0x24BE0ACB0]);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_12;
  v9[3] = &unk_24C2E51D8;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "eraseWithCompletion:", v9);

}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  TREraseAnisetteDataResponse *v7;

  v5 = a3;
  if (v5)
  {
    TRLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_12_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v7 = objc_alloc_init(TREraseAnisetteDataResponse);
    -[TREraseAnisetteDataResponse setDidSucceed:](v7, "setDidSucceed:", a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_20A2BF000, v6, OS_LOG_TYPE_DEFAULT, "Received fetch request: %@", buf, 0xCu);
    }

  }
  v7 = objc_alloc_init(MEMORY[0x24BE0ACB0]);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_17;
  v9[3] = &unk_24C2E5AD8;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "anisetteDataWithCompletion:", v9);

}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  TRFetchAnisetteDataResponse *v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    TRLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_17_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v8 = objc_alloc_init(TRFetchAnisetteDataResponse);
    -[TRFetchAnisetteDataResponse setAnisetteData:](v8, "setAnisetteData:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_20A2BF000, v6, OS_LOG_TYPE_DEFAULT, "Received legacy request: %@", buf, 0xCu);
    }

  }
  v7 = (objc_class *)MEMORY[0x24BE0ACB0];
  v8 = v4;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v8, "dsid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_23;
  v12[3] = &unk_24C2E5AD8;
  v13 = v5;
  v11 = v5;
  objc_msgSend(v9, "legacyAnisetteDataForDSID:withCompletion:", v10, v12);

}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  TRLegacyAnisetteDataResponse *v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    TRLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_23_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v8 = objc_alloc_init(TRLegacyAnisetteDataResponse);
    -[TRLegacyAnisetteDataResponse setAnisetteData:](v8, "setAnisetteData:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_1_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20A2BF000, v0, v1, "TRProvisionAnisetteDataRequest error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_7_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20A2BF000, v0, v1, "TRSyncAnisetteDataRequest error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_12_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20A2BF000, v0, v1, "TREraseAnisetteDataResponse error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_17_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20A2BF000, v0, v1, "TRFetchAnisetteDataResponse error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_23_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20A2BF000, v0, v1, "TRLegacyAnisetteDataResponse error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
