@implementation SPNVRAM

+ (void)clear
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD v6[4];
  NSObject *v7;

  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __16__SPNVRAM_clear__block_invoke;
  v6[3] = &unk_1E5E164B8;
  v7 = v2;
  v4 = v2;
  objc_msgSend(v3, "clearOfflineFindingInfoWithCompletion:", v6);

  v5 = dispatch_time(0, 30000000000);
  dispatch_group_wait(v4, v5);

}

void __16__SPNVRAM_clear__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  LogCategory_NVRAM();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __16__SPNVRAM_clear__block_invoke_cold_1();

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "NVRAM cleared.", v6, 2u);
    }

  }
}

+ (id)read
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  LogCategory_NVRAM();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "Beginning read of keys from NVRAM.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __15__SPNVRAM_read__block_invoke;
  v16 = &unk_1E5E164E0;
  v5 = v2;
  v17 = v5;
  v18 = &v19;
  objc_msgSend(v4, "fetchOfflineFindingInfoWithCompletion:", &v13);

  v6 = dispatch_time(0, 30000000000);
  dispatch_group_wait(v5, v6);
  LogCategory_NVRAM();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)v20[5];
    v9 = objc_msgSend(v8, "length", v13, v14, v15, v16);
    v10 = CFSTR("(not-nil)");
    if (!v8)
      v10 = CFSTR("(nil)");
    *(_DWORD *)buf = 138543618;
    v26 = v10;
    v27 = 2048;
    v28 = v9;
    _os_log_impl(&dword_1AEA79000, v7, OS_LOG_TYPE_DEFAULT, "Done waiting to read keys from NVRAM returnValue %{public}@ %lu", buf, 0x16u);
  }

  v11 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v11;
}

void __15__SPNVRAM_read__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    LogCategory_NVRAM();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __15__SPNVRAM_read__block_invoke_cold_2();
  }
  else if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    LogCategory_NVRAM();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = objc_msgSend(v6, "length");
      _os_log_impl(&dword_1AEA79000, v9, OS_LOG_TYPE_DEFAULT, "Read %lu bytes from NVRAM.", (uint8_t *)&v10, 0xCu);
    }

    LogCategory_NVRAM();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __15__SPNVRAM_read__block_invoke_cold_1(v6, v8);
  }
  else
  {
    LogCategory_NVRAM();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "No key data received from NVRAM", (uint8_t *)&v10, 2u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (BOOL)write:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  LogCategory_NVRAM();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v3, "length");
    *(_DWORD *)buf = 134217984;
    v21 = v6;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "Writing %lu bytes to NVRAM.", buf, 0xCu);
  }

  LogCategory_NVRAM();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "fm_hexString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPNVRAM write:].cold.1(v8, (uint64_t)buf, v7);
  }

  objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __17__SPNVRAM_write___block_invoke;
  v13[3] = &unk_1E5E16508;
  v15 = &v16;
  v10 = v4;
  v14 = v10;
  objc_msgSend(v9, "storeOfflineFindingInfo:completion:", v3, v13);

  v11 = dispatch_time(0, 30000000000);
  dispatch_group_wait(v10, v11);
  LOBYTE(v9) = *((_BYTE *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return (char)v9;
}

void __17__SPNVRAM_write___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v3)
  {
    *(_BYTE *)(v4 + 24) = 0;
    LogCategory_NVRAM();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __17__SPNVRAM_write___block_invoke_cold_1();

  }
  else
  {
    *(_BYTE *)(v4 + 24) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __16__SPNVRAM_clear__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA79000, v0, v1, "clearOfflineFindingInfoWithCompletion error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __15__SPNVRAM_read__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fm_hexString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1AEA79000, a2, v4, "Read NVRAM data: %@", v5);

}

void __15__SPNVRAM_read__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA79000, v0, v1, "fetchOfflineFindingInfoWithCompletion error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)write:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2(&dword_1AEA79000, a3, (uint64_t)a3, "Writing NVRAM data: %@", (uint8_t *)a2);

}

void __17__SPNVRAM_write___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AEA79000, v0, v1, "storeOfflineFindingInfo error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
