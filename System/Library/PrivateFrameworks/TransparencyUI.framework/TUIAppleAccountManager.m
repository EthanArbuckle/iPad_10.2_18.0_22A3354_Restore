@implementation TUIAppleAccountManager

- (TUIAppleAccountManager)initWithAccountStore:(id)a3
{
  id v5;
  TUIAppleAccountManager *v6;
  TUIAppleAccountManager *v7;
  objc_super v9;

  v5 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_2 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_2, &__block_literal_global_2);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2, OS_LOG_TYPE_DEBUG))
    -[TUIAppleAccountManager initWithAccountStore:].cold.1();
  v9.receiver = self;
  v9.super_class = (Class)TUIAppleAccountManager;
  v6 = -[TUIAppleAccountManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountStore, a3);

  return v7;
}

void __47__TUIAppleAccountManager_initWithAccountStore___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2 = (uint64_t)v0;

}

- (void)silentRenewAppleAccountWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  ACAccountStore *accountStore;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_2 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_2, &__block_literal_global_3);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2, OS_LOG_TYPE_DEBUG))
    -[TUIAppleAccountManager silentRenewAppleAccountWithCompletionHandler:].cold.1();
  -[ACAccountStore aida_accountForPrimaryiCloudAccount](self->_accountStore, "aida_accountForPrimaryiCloudAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDB4530];
  v14[0] = *MEMORY[0x24BDB4528];
  v14[1] = v6;
  v15[0] = MEMORY[0x24BDBD1C8];
  v15[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  objc_initWeak(&location, self);
  accountStore = self->_accountStore;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__TUIAppleAccountManager_silentRenewAppleAccountWithCompletionHandler___block_invoke_4;
  v10[3] = &unk_251A5BBA0;
  objc_copyWeak(&v12, &location);
  v9 = v4;
  v11 = v9;
  -[ACAccountStore renewCredentialsForAccount:options:completion:](accountStore, "renewCredentialsForAccount:options:completion:", v5, v7, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __71__TUIAppleAccountManager_silentRenewAppleAccountWithCompletionHandler___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2 = (uint64_t)v0;

}

void __71__TUIAppleAccountManager_silentRenewAppleAccountWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_2 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_2, &__block_literal_global_5);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[TUIAppleAccountManager silentRenewAppleAccountWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", (uint8_t *)&v9, 0xCu);
    }
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_2 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_2, &__block_literal_global_7);
  v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315906;
    v10 = "-[TUIAppleAccountManager silentRenewAppleAccountWithCompletionHandler:]_block_invoke_2";
    v11 = 2048;
    v12 = a2;
    v13 = 2114;
    v14 = v5;
    v15 = 2114;
    v16 = WeakRetained;
    _os_log_debug_impl(&dword_2493EE000, v8, OS_LOG_TYPE_DEBUG, "%s renewResult = %ld, error = %{public}@ on %{public}@", (uint8_t *)&v9, 0x2Au);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __71__TUIAppleAccountManager_silentRenewAppleAccountWithCompletionHandler___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2 = (uint64_t)v0;

}

void __71__TUIAppleAccountManager_silentRenewAppleAccountWithCompletionHandler___block_invoke_6()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_2 = (uint64_t)v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)initWithAccountStore:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0();
  v4 = v0;
  v5 = v1;
  _os_log_debug_impl(&dword_2493EE000, v2, OS_LOG_TYPE_DEBUG, "%s accountStore = %{public}@ on %{public}@", (uint8_t *)v3, 0x20u);
}

- (void)silentRenewAppleAccountWithCompletionHandler:.cold.1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_2493EE000, v0, OS_LOG_TYPE_DEBUG, "%s  on %{public}@", (uint8_t *)v1, 0x16u);
}

@end
