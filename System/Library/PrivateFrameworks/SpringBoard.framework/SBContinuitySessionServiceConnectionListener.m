@implementation SBContinuitySessionServiceConnectionListener

void __70___SBContinuitySessionServiceConnectionListener_initWithServiceQueue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAC5C8], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

void __104___SBContinuitySessionServiceConnectionListener_updatedAppearanceSettings_transitionContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void *v5;
  id v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = a3;
    objc_msgSend(v5, "numberWithBool:", a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v7, v6);

  }
}

void __91___SBContinuitySessionServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DAC5C8], "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(MEMORY[0x1E0DAC5C8], "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  objc_initWeak(&location, *(id *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __91___SBContinuitySessionServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2;
  v6[3] = &unk_1E8EA18D8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __91___SBContinuitySessionServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  id location;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    SBLogContinuitySessionService();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __91___SBContinuitySessionServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2_cold_1(v3, v5);

    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
    objc_msgSend(*((id *)WeakRetained + 2), "objectForKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)WeakRetained + 2), "removeObjectForKey:", v3);
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
    objc_msgSend(v6, "_connectionQueue_didInvalidate");
    objc_initWeak(&location, WeakRetained);
    objc_copyWeak(&v8, &location);
    v7 = v6;
    BSDispatchMain();

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);

  }
}

void __91___SBContinuitySessionServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_21(uint64_t a1)
{
  id v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained(WeakRetained + 6);
  objc_msgSend(v2, "clientDidDisconnect:", *(_QWORD *)(a1 + 32));

}

void __91___SBContinuitySessionServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2_25(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "clientDidConnect:", *(_QWORD *)(a1 + 40));

}

void __91___SBContinuitySessionServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v2;
  void *v5;
  const char *v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "remoteProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218240;
  v8 = a1;
  v9 = 1024;
  v10 = OUTLINED_FUNCTION_4_12(v5, v6);
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "SBContinuitySessionService: connection <%p> pid: %i was invalidated", (uint8_t *)&v7, 0x12u);

  OUTLINED_FUNCTION_20();
}

@end
