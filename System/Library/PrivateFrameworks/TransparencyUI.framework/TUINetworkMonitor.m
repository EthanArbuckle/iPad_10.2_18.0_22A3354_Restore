@implementation TUINetworkMonitor

- (TUINetworkMonitor)init
{
  TUINetworkMonitor *v3;
  nw_path_monitor_t v4;
  OS_nw_path_monitor *networkPathMonitor;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *networkMonitorQueue;
  objc_super v10;

  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23, &__block_literal_global_24);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23, OS_LOG_TYPE_DEBUG))
    -[TUINetworkMonitor init].cold.1();
  v10.receiver = self;
  v10.super_class = (Class)TUINetworkMonitor;
  v3 = -[TUINetworkMonitor init](&v10, sel_init);
  if (v3)
  {
    v4 = nw_path_monitor_create();
    networkPathMonitor = v3->_networkPathMonitor;
    v3->_networkPathMonitor = (OS_nw_path_monitor *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.TransparencyUI.network.monitor", v6);
    networkMonitorQueue = v3->_networkMonitorQueue;
    v3->_networkMonitorQueue = (OS_dispatch_queue *)v7;

  }
  return v3;
}

void __25__TUINetworkMonitor_init__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23 = (uint64_t)v0;

}

- (void)dealloc
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

void __28__TUINetworkMonitor_dealloc__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23 = (uint64_t)v0;

}

- (void)setUpNetworkPathMonitor
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

void __44__TUINetworkMonitor_setUpNetworkPathMonitor__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23 = (uint64_t)v0;

}

void __44__TUINetworkMonitor_setUpNetworkPathMonitor__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  _BYTE location[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *(_QWORD *)location = 0;
    objc_initWeak((id *)location, WeakRetained);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __44__TUINetworkMonitor_setUpNetworkPathMonitor__block_invoke_10;
    v6[3] = &unk_251A5AF70;
    objc_copyWeak(&v7, (id *)location);
    objc_msgSend(WeakRetained, "_setNetworkMonitorUpdateHandlerWithPath:completion:", v3, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)location);
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23, &__block_literal_global_9);
    v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315138;
      *(_QWORD *)&location[4] = "-[TUINetworkMonitor setUpNetworkPathMonitor]_block_invoke";
      _os_log_impl(&dword_2493EE000, v5, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", location, 0xCu);
    }
  }

}

void __44__TUINetworkMonitor_setUpNetworkPathMonitor__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23 = (uint64_t)v0;

}

void __44__TUINetworkMonitor_setUpNetworkPathMonitor__block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activeConnectionChanged");

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23, &__block_literal_global_12_1);
    v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[TUINetworkMonitor setUpNetworkPathMonitor]_block_invoke";
      _os_log_impl(&dword_2493EE000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }

}

void __44__TUINetworkMonitor_setUpNetworkPathMonitor__block_invoke_2_11()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23 = (uint64_t)v0;

}

- (void)_setNetworkMonitorUpdateHandlerWithPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23, &__block_literal_global_14_2);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23, OS_LOG_TYPE_DEBUG))
    -[TUINetworkMonitor _setNetworkMonitorUpdateHandlerWithPath:completion:].cold.1();
  location = 0;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__TUINetworkMonitor__setNetworkMonitorUpdateHandlerWithPath_completion___block_invoke_15;
  v10[3] = &unk_251A5E3B8;
  objc_copyWeak(&v13, &location);
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __72__TUINetworkMonitor__setNetworkMonitorUpdateHandlerWithPath_completion___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23 = (uint64_t)v0;

}

void __72__TUINetworkMonitor__setNetworkMonitorUpdateHandlerWithPath_completion___block_invoke_15(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    WeakRetained[8] = nw_path_get_status(*(nw_path_t *)(a1 + 32)) == nw_path_status_satisfied;
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23, &__block_literal_global_18_1);
    v3 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23, OS_LOG_TYPE_DEBUG))
      __72__TUINetworkMonitor__setNetworkMonitorUpdateHandlerWithPath_completion___block_invoke_15_cold_1(v3, WeakRetained, (uint64_t)WeakRetained);
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23, &__block_literal_global_16_2);
    v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "-[TUINetworkMonitor _setNetworkMonitorUpdateHandlerWithPath:completion:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v4, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", (uint8_t *)&v7, 0xCu);
    }
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_23, &__block_literal_global_20_1);
    v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "-[TUINetworkMonitor _setNetworkMonitorUpdateHandlerWithPath:completion:]_block_invoke_2";
      _os_log_impl(&dword_2493EE000, v5, OS_LOG_TYPE_ERROR, "%s, block self is nil", (uint8_t *)&v7, 0xCu);
    }
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

void __72__TUINetworkMonitor__setNetworkMonitorUpdateHandlerWithPath_completion___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23 = (uint64_t)v0;

}

void __72__TUINetworkMonitor__setNetworkMonitorUpdateHandlerWithPath_completion___block_invoke_17()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23 = (uint64_t)v0;

}

void __72__TUINetworkMonitor__setNetworkMonitorUpdateHandlerWithPath_completion___block_invoke_19()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_23 = (uint64_t)v0;

}

- (TUINetworkMonitorDelegate)delegate
{
  return (TUINetworkMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasActiveConnection
{
  return self->_hasActiveConnection;
}

- (OS_nw_path_monitor)networkPathMonitor
{
  return self->_networkPathMonitor;
}

- (OS_dispatch_queue)networkMonitorQueue
{
  return self->_networkMonitorQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMonitorQueue, 0);
  objc_storeStrong((id *)&self->_networkPathMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
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

- (void)_setNetworkMonitorUpdateHandlerWithPath:completion:.cold.1()
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

void __72__TUINetworkMonitor__setNetworkMonitorUpdateHandlerWithPath_completion___block_invoke_15_cold_1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = 138543618;
  v7 = a3;
  v8 = 1024;
  v9 = objc_msgSend(a2, "hasActiveConnection");
  _os_log_debug_impl(&dword_2493EE000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ hasActiveConnection = %d", (uint8_t *)&v6, 0x12u);

}

@end
