@implementation SBKeyboardServiceConnectionListener

void __61___SBKeyboardServiceConnectionListener_initWithServiceQueue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAAEE0], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

void __82___SBKeyboardServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DAAEE0], "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(MEMORY[0x1E0DAAEE0], "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82___SBKeyboardServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2;
  v9[3] = &unk_1E8EA18D8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __82___SBKeyboardServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_38;
  v7[3] = &unk_1E8EA18D8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __82___SBKeyboardServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    SBLogKeyboardFocus();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __82___SBKeyboardServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2_cold_1(v3);

    objc_msgSend(WeakRetained, "_handleDisconnectForServiceConnection:", v3);
  }

}

void __82___SBKeyboardServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    SBLogKeyboardFocus();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __82___SBKeyboardServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_38_cold_1(v3);

    objc_msgSend(WeakRetained, "_handleDisconnectForServiceConnection:", v3);
  }

}

void __82___SBKeyboardServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "remoteProcess");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pid");
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_8(&dword_1D0540000, v2, v3, "SBKeyboardFocusService: connection <%p> pid: %i was interrupted", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

void __82___SBKeyboardServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_38_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "remoteProcess");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pid");
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_8(&dword_1D0540000, v2, v3, "SBKeyboardFocusService: connection <%p> pid: %i was invalidated", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

@end
