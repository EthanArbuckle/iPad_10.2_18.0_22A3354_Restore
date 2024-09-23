@implementation TUIKTStateManager

- (TUIKTStateManager)init
{
  TUIKTStateManager *result;
  objc_super v4;

  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12, &__block_literal_global_12);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_DEBUG))
    -[TUIKTStateManager init].cold.1();
  v4.receiver = self;
  v4.super_class = (Class)TUIKTStateManager;
  result = -[TUIKTStateManager init](&v4, sel_init);
  if (result)
    result->_state = -1;
  return result;
}

void __25__TUIKTStateManager_init__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12 = (uint64_t)v0;

}

- (int64_t)state
{
  TUIKTStateManager *v2;
  int64_t state;

  v2 = self;
  objc_sync_enter(v2);
  state = v2->_state;
  objc_sync_exit(v2);

  return state;
}

- (void)updateStateWithKTStatusResult:(id)a3
{
  TUIKTStateManager *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  TUIKTStateManager *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  TUIKTStateManager *v23;
  __int16 v24;
  TUIKTStateManager *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = (TUIKTStateManager *)a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12, &__block_literal_global_14);
  v6 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[TUIKTStateManager stateDescription](self, "stateDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136315906;
    v19 = "-[TUIKTStateManager updateStateWithKTStatusResult:]";
    v20 = 2114;
    v21 = v8;
    v22 = 2114;
    v23 = v5;
    v24 = 2114;
    v25 = self;
    _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEFAULT, "%s current %{public}@, %{public}@ on %{public}@", (uint8_t *)&v18, 0x2Au);

  }
  v9 = self;
  objc_sync_enter(v9);
  objc_storeStrong((id *)&v9->_ktStatusResult, a3);
  if (-[TUIKTStateManager accountStatus](v5, "accountStatus") == 5)
  {
    v10 = 10;
    goto LABEL_37;
  }
  if (-[TUIKTStateManager optIn](v5, "optIn") == 1)
  {
    if (-[TUIKTStateManager accountStatus](v5, "accountStatus") == 2)
    {
LABEL_9:
      v10 = 5;
      goto LABEL_37;
    }
    if (-[TUIKTStateManager idsAccountStatus](v5, "idsAccountStatus") != 3)
    {
      v10 = 3;
      goto LABEL_37;
    }
    if (-[TUIKTStateManager accountStatus](v5, "accountStatus") == 3)
    {
      v10 = 6;
      goto LABEL_37;
    }
    if (-[TUIKTStateManager accountStatus](v5, "accountStatus") == 4
      && -[TUIKTStateManager selfStatus](v5, "selfStatus") == 1)
    {
      v10 = 4;
      goto LABEL_37;
    }
    if (-[TUIKTStateManager accountStatus](v5, "accountStatus") == 4
      && (-[TUIKTStateManager selfStatus](v5, "selfStatus") == 3
       || -[TUIKTStateManager selfStatus](v5, "selfStatus") == 4))
    {
      v11 = -[TUIKTStateManager systemStatus](v5, "systemStatus") == 3;
      v10 = 7;
      v12 = 9;
LABEL_35:
      if (v11)
        v10 = v12;
      goto LABEL_37;
    }
    if (-[TUIKTStateManager accountStatus](v5, "accountStatus") == 4
      && (-[TUIKTStateManager selfStatus](v5, "selfStatus") == 2
       || -[TUIKTStateManager systemStatus](v5, "systemStatus") == 2
       || -[TUIKTStateManager systemStatus](v5, "systemStatus") == 4))
    {
      v16 = -[TUIKTStateManager systemStatus](v5, "systemStatus");
      v10 = 8;
      if (v16 == 3)
        v10 = 9;
    }
    else
    {
      v17 = -[TUIKTStateManager systemStatus](v5, "systemStatus");
      v10 = 12;
      if (v17 != 5)
        v10 = 1;
    }
  }
  else
  {
    if (-[TUIKTStateManager optIn](v5, "optIn") == 2)
    {
      if (-[TUIKTStateManager serverOptIn](v5, "serverOptIn") == 1)
      {
        if (-[TUIKTStateManager accountStatus](v5, "accountStatus") == 2)
          goto LABEL_9;
        v11 = -[TUIKTStateManager accountStatus](v5, "accountStatus") == 3;
        v10 = 2;
        v12 = 6;
      }
      else
      {
        if (-[TUIKTStateManager serverOptIn](v5, "serverOptIn") != 2)
        {
          v10 = 2;
          goto LABEL_37;
        }
        if (-[TUIKTStateManager accountStatus](v5, "accountStatus") == 3)
        {
          v10 = 11;
          goto LABEL_37;
        }
        v11 = -[TUIKTStateManager accountStatus](v5, "accountStatus") == 2;
        v10 = 2;
        v12 = 10;
      }
      goto LABEL_35;
    }
    if (-[TUIKTStateManager optIn](v5, "optIn"))
    {
      v10 = -1;
    }
    else
    {
      v13 = -[TUIKTStateManager systemStatus](v5, "systemStatus");
      v10 = 12;
      if (v13 != 5)
        v10 = 0;
    }
  }
LABEL_37:
  v9->_state = v10;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12, &__block_literal_global_16);
  v14 = (id)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[TUIKTStateManager stateDescription](v9, "stateDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136315650;
    v19 = "-[TUIKTStateManager updateStateWithKTStatusResult:]";
    v20 = 2114;
    v21 = v15;
    v22 = 2114;
    v23 = v9;
    _os_log_impl(&dword_2493EE000, v14, OS_LOG_TYPE_DEFAULT, "%s new %{public}@ on %{public}@", (uint8_t *)&v18, 0x20u);

  }
  objc_sync_exit(v9);

}

void __51__TUIKTStateManager_updateStateWithKTStatusResult___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12 = (uint64_t)v0;

}

void __51__TUIKTStateManager_updateStateWithKTStatusResult___block_invoke_15()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12 = (uint64_t)v0;

}

- (void)isManateeAvailableWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12, &__block_literal_global_17);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_DEBUG))
    -[TUIKTStateManager isManateeAvailableWithCompletion:].cold.1();
  location = 0;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__TUIKTStateManager_isManateeAvailableWithCompletion___block_invoke_18;
  block[3] = &unk_251A5C450;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__TUIKTStateManager_isManateeAvailableWithCompletion___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12 = (uint64_t)v0;

}

void __54__TUIKTStateManager_isManateeAvailableWithCompletion___block_invoke_18(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12, &__block_literal_global_19_0);
    v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[TUIKTStateManager isManateeAvailableWithCompletion:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v3, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", buf, 0xCu);
    }
  }
  v4 = objc_alloc(MEMORY[0x24BE1A490]);
  objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithContext:", v5);

  v8 = 0;
  LOBYTE(v5) = objc_msgSend(v6, "isManateeAvailable:", &v8);
  v7 = v8;
  if ((v5 & 1) == 0)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12, &__block_literal_global_22_0);
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_ERROR))
      __54__TUIKTStateManager_isManateeAvailableWithCompletion___block_invoke_18_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __54__TUIKTStateManager_isManateeAvailableWithCompletion___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12 = (uint64_t)v0;

}

void __54__TUIKTStateManager_isManateeAvailableWithCompletion___block_invoke_21()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12 = (uint64_t)v0;

}

- (BOOL)isErrorState
{
  return (unint64_t)(-[TUIKTStateManager state](self, "state") - 3) < 0xA;
}

- (BOOL)isCDPErrorState
{
  unint64_t v2;

  v2 = -[TUIKTStateManager state](self, "state");
  return (v2 < 0xC) & (0xC60u >> v2);
}

- (id)stateLabel
{
  unint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  __CFString *v7;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = -[TUIKTStateManager state](self, "state");
  if (v3 > 0xC)
  {
LABEL_10:
    -[KTStatusResult recentFailedEventIds](self->_ktStatusResult, "recentFailedEventIds");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (!v10)
    {
      v7 = &stru_251A5E438;
      return v7;
    }
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12, &__block_literal_global_34);
    v11 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_DEBUG))
      -[TUIKTStateManager stateLabel].cold.1((void **)&self->_ktStatusResult, v11, (uint64_t)self);
    goto LABEL_4;
  }
  if (((1 << v3) & 0x1708) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("UNAVAILABLE");
    goto LABEL_8;
  }
  if (((1 << v3) & 0xB0) == 0)
  {
    if (((1 << v3) & 0x840) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("WAITING");
      goto LABEL_8;
    }
    goto LABEL_10;
  }
LABEL_4:
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = CFSTR("ERROR");
LABEL_8:
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_251A5E438, CFSTR("Localizable"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __31__TUIKTStateManager_stateLabel__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12 = (uint64_t)v0;

}

- (void)setExpectedResolutionDays:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:toDate:options:", 16, v6, v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    self->_expectedResolutionDays = objc_msgSend(v7, "day") + 1;
  }
  else
  {
    self->_expectedResolutionDays = 0;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_12, &__block_literal_global_37_0);
  v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_DEBUG))
    -[TUIKTStateManager setExpectedResolutionDays:].cold.1((uint64_t)self, v8, v9);

}

void __47__TUIKTStateManager_setExpectedResolutionDays___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_12 = (uint64_t)v0;

}

- (id)stateDescription
{
  unint64_t v3;
  __CFString *v4;
  void *v5;

  v3 = -[TUIKTStateManager state](self, "state") + 1;
  if (v3 >= 0xD)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unexpected UI state (%ld)"), self->_state);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_251A5C4B0[v3];
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UI state = %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (KTStatusResult)ktStatusResult
{
  return self->_ktStatusResult;
}

- (int64_t)expectedResolutionDays
{
  return self->_expectedResolutionDays;
}

- (BOOL)isVerifyCDPRunning
{
  return self->_isVerifyCDPRunning;
}

- (void)setIsVerifyCDPRunning:(BOOL)a3
{
  self->_isVerifyCDPRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ktStatusResult, 0);
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
}

- (void)isManateeAvailableWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

void __54__TUIKTStateManager_isManateeAvailableWithCompletion___block_invoke_18_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2[6];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_1_0();
  v3 = v0;
  _os_log_error_impl(&dword_2493EE000, v1, OS_LOG_TYPE_ERROR, "%s error = %{public}@ on %{public}@", (uint8_t *)v2, 0x20u);
}

- (void)stateLabel
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8[6];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v5 = a2;
  objc_msgSend(v4, "recentFailedEventIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 136315650;
  OUTLINED_FUNCTION_1_0();
  v9 = a3;
  OUTLINED_FUNCTION_2_0(&dword_2493EE000, v5, v7, "%s recentFailedEventIds: %{public}@ on %{public}@", (uint8_t *)v8);

}

- (void)setExpectedResolutionDays:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 136315650;
  v5 = "-[TUIKTStateManager setExpectedResolutionDays:]";
  v6 = 2048;
  v7 = v3;
  v8 = 2114;
  v9 = a1;
  OUTLINED_FUNCTION_2_0(&dword_2493EE000, a2, a3, "%s expectedResolutionDays = %ld on %{public}@", (uint8_t *)&v4);
}

@end
