@implementation ICSPrivateEmailUpdateCacheHook

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v8;
  id v9;

  v8 = a6;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("privateEmailKey"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[ICSPrivateEmailUpdateCacheHook _removePrivateEmailKey:withCompletion:](self, "_removePrivateEmailKey:withCompletion:", v9, v8);

}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "clientInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("privateEmailKey"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[ICSPrivateEmailUpdateCacheHook _removePrivateEmailKey:withCompletion:](self, "_removePrivateEmailKey:withCompletion:", v8, v6);
}

- (void)_removePrivateEmailKey:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BE0ADC8]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__ICSPrivateEmailUpdateCacheHook__removePrivateEmailKey_withCompletion___block_invoke;
  v10[3] = &unk_251C61190;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "removePrivateEmailKey:completion:", v9, v10);

}

void __72__ICSPrivateEmailUpdateCacheHook__removePrivateEmailKey_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void (*v7)(void);
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __72__ICSPrivateEmailUpdateCacheHook__removePrivateEmailKey_withCompletion___block_invoke_cold_1(a1, (uint64_t)v3, v5);

    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      v7 = *(void (**)(void))(v6 + 16);
LABEL_10:
      v7();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_24B4C1000, v5, OS_LOG_TYPE_DEFAULT, "private email remove for key %@ is success", (uint8_t *)&v10, 0xCu);
    }

    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      v7 = *(void (**)(void))(v9 + 16);
      goto LABEL_10;
    }
  }

}

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(CFSTR("action:hideMyEmailUpdateCache"), "isEqualToString:", v3);

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE04C48]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(CFSTR("action:hideMyEmailUpdateCache"), "isEqualToString:", v4);

  return v5;
}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
}

void __72__ICSPrivateEmailUpdateCacheHook__removePrivateEmailKey_withCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_24B4C1000, log, OS_LOG_TYPE_ERROR, "private email remove for key %@ failed with error %@", (uint8_t *)&v4, 0x16u);
}

@end
