@implementation TUIKTAppIntentsData

- (TUIKTAppIntentsData)init
{
  TUIKTAppIntentsData *v3;
  uint64_t v4;
  TUIKTStateManager *stateManager;
  id v6;
  uint64_t v7;
  KTStatus *ktStatus;
  objc_super v10;

  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18, &__block_literal_global_19);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18, OS_LOG_TYPE_DEBUG))
    -[TUIKTAppIntentsData init].cold.1();
  v10.receiver = self;
  v10.super_class = (Class)TUIKTAppIntentsData;
  v3 = -[TUIKTAppIntentsData init](&v10, sel_init);
  if (v3)
  {
    v4 = objc_opt_new();
    stateManager = v3->_stateManager;
    v3->_stateManager = (TUIKTStateManager *)v4;

    v6 = objc_alloc(MEMORY[0x24BEBA820]);
    v7 = objc_msgSend(v6, "initWithApplication:", *MEMORY[0x24BEBA860]);
    ktStatus = v3->_ktStatus;
    v3->_ktStatus = (KTStatus *)v7;

  }
  return v3;
}

void __27__TUIKTAppIntentsData_init__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18 = (uint64_t)v0;

}

- (void)statusWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _BYTE buf[12];
  __int16 v12;
  TUIKTAppIntentsData *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18, &__block_literal_global_4_1);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18, OS_LOG_TYPE_DEBUG))
    -[TUIKTAppIntentsData statusWithCompletion:].cold.1();
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18, &__block_literal_global_6_0);
  v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[TUIKTAppIntentsData statusWithCompletion:]";
    v12 = 2114;
    v13 = self;
    _os_log_impl(&dword_2493EE000, v5, OS_LOG_TYPE_DEFAULT, "%s getting CKV status on %{public}@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  dispatch_get_global_queue(33, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__TUIKTAppIntentsData_statusWithCompletion___block_invoke_7;
  v8[3] = &unk_251A5C450;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __44__TUIKTAppIntentsData_statusWithCompletion___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18 = (uint64_t)v0;

}

void __44__TUIKTAppIntentsData_statusWithCompletion___block_invoke_5()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18 = (uint64_t)v0;

}

void __44__TUIKTAppIntentsData_statusWithCompletion___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "ktStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v4, "status:", &v23);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v23;

    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18, &__block_literal_global_14_0);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v25 = "-[TUIKTAppIntentsData statusWithCompletion:]_block_invoke_2";
      v26 = 2114;
      v27 = v5;
      v28 = 2114;
      v29 = v6;
      v30 = 2114;
      v31 = v3;
      _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEFAULT, "%s got CKV status = %{public}@, error = %{public}@ on %{public}@", buf, 0x2Au);
    }
    objc_msgSend(v3, "stateManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateStateWithKTStatusResult:", v5);

    objc_msgSend(v3, "stateManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stateLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v10, "length"))
    {
      objc_msgSend(v3, "stateManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ktStatusResult");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "optIn") == 1)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CKV_STATUS_ENABLED"), &stru_251A5E438, CFSTR("Localizable"));
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v3, "stateManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ktStatusResult");
        v22 = v11;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "optIn");
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v18)
          v21 = CFSTR("CKV_STATUS_PENDING");
        else
          v21 = CFSTR("CKV_STATUS_DISABLED");
        objc_msgSend(v19, "localizedStringForKey:value:table:", v21, &stru_251A5E438, CFSTR("Localizable"));
        v14 = objc_claimAutoreleasedReturnValue();

        v10 = v17;
        v11 = v22;
      }

      v10 = (void *)v14;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18, &__block_literal_global_8);
    v15 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[TUIKTAppIntentsData statusWithCompletion:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v15, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", buf, 0xCu);
    }
    v16 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BEBA850], "errorWithDomain:code:description:", *MEMORY[0x24BEBA8A0], -120, CFSTR("object deallocated"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, const __CFString *, id))(v16 + 16))(v16, &stru_251A5E438, v6);
  }

}

void __44__TUIKTAppIntentsData_statusWithCompletion___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18 = (uint64_t)v0;

}

void __44__TUIKTAppIntentsData_statusWithCompletion___block_invoke_13()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18 = (uint64_t)v0;

}

- (void)publicVerificationCodeWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18, &__block_literal_global_24_0);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18, OS_LOG_TYPE_DEBUG))
    -[TUIKTAppIntentsData publicVerificationCodeWithCompletion:].cold.1();
  location = 0;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(33, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__TUIKTAppIntentsData_publicVerificationCodeWithCompletion___block_invoke_25;
  block[3] = &unk_251A5C450;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __60__TUIKTAppIntentsData_publicVerificationCodeWithCompletion___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18 = (uint64_t)v0;

}

void __60__TUIKTAppIntentsData_publicVerificationCodeWithCompletion___block_invoke_25(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "ktStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v4, "status:", &v20);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v20;

    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18, &__block_literal_global_28_2);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v22 = "-[TUIKTAppIntentsData publicVerificationCodeWithCompletion:]_block_invoke_2";
      v23 = 2114;
      v24 = v5;
      v25 = 2114;
      v26 = v6;
      v27 = 2114;
      v28 = v3;
      _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEFAULT, "%s got CKV status = %{public}@, error = %{public}@ on %{public}@", buf, 0x2Au);
    }
    objc_msgSend(v3, "stateManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateStateWithKTStatusResult:", v5);

    objc_msgSend(MEMORY[0x24BEBA7F0], "accountPublicID:", *MEMORY[0x24BEBA860]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("VERIFICATION_CODE_NOT_AVAILABLE"), &stru_251A5E438, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "stateManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ktStatusResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "optIn") == 1)
    {
      objc_msgSend(v9, "publicAccountIdentity");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v14)
        v16 = (void *)v14;
      else
        v16 = v11;
      v17 = v16;

    }
    else
    {
      v17 = v11;
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_18, &__block_literal_global_26_0);
    v18 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[TUIKTAppIntentsData publicVerificationCodeWithCompletion:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v18, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", buf, 0xCu);
    }
    v19 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BEBA850], "errorWithDomain:code:description:", *MEMORY[0x24BEBA8A0], -120, CFSTR("object deallocated"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, const __CFString *, id))(v19 + 16))(v19, &stru_251A5E438, v6);
  }

}

void __60__TUIKTAppIntentsData_publicVerificationCodeWithCompletion___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18 = (uint64_t)v0;

}

void __60__TUIKTAppIntentsData_publicVerificationCodeWithCompletion___block_invoke_27()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_18 = (uint64_t)v0;

}

- (TUIKTStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_stateManager, a3);
}

- (KTStatus)ktStatus
{
  return self->_ktStatus;
}

- (void)setKtStatus:(id)a3
{
  objc_storeStrong((id *)&self->_ktStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ktStatus, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)statusWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)publicVerificationCodeWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
