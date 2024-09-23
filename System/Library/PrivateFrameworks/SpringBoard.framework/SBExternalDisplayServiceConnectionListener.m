@implementation SBExternalDisplayServiceConnectionListener

void __68___SBExternalDisplayServiceConnectionListener_initWithServiceQueue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAAE50], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

void __114___SBExternalDisplayServiceConnectionListener_notifyObserversExternalDisplayDidUpdateProperties_requestingClient___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1[4] + 8));
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1[4] + 16), "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        if (v7 != (void *)a1[5])
        {
          objc_msgSend(v7, "connection");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "remoteTarget");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "externalDisplayDidUpdateProperties:", a1[6]);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
}

void __88___SBExternalDisplayServiceConnectionListener_notifyObserversExternalDisplayDidConnect___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 8));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "connection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "remoteTarget");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "externalDisplayDidConnect:", *(_QWORD *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

void __92___SBExternalDisplayServiceConnectionListener_notifyObserversExternalDisplayWillDisconnect___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 8));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "connection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "remoteTarget");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "externalDisplayWillDisconnect:", *(_QWORD *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

void __89___SBExternalDisplayServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(MEMORY[0x1E0DAAE50], "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(MEMORY[0x1E0DAAE50], "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89___SBExternalDisplayServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2;
  v9[3] = &unk_1E8EA18D8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __89___SBExternalDisplayServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_54;
  v7[3] = &unk_1E8EA18D8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __89___SBExternalDisplayServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    SBLogDisplayControlling();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __89___SBExternalDisplayServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2_cold_1(v3);

    objc_msgSend(WeakRetained, "_handleDisconnectForServiceConnection:", v3);
  }

}

void __89___SBExternalDisplayServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    SBLogDisplayControlling();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __89___SBExternalDisplayServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_54_cold_1(v3);

    objc_msgSend(WeakRetained, "_handleDisconnectForServiceConnection:", v3);
  }

}

void __89___SBExternalDisplayServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_2_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0_8(&dword_1D0540000, v2, v3, "SBExternalDisplayService: connection <%p> pid: %i was interrupted", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

void __89___SBExternalDisplayServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke_54_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0_8(&dword_1D0540000, v2, v3, "SBExternalDisplayService: connection <%p> pid: %i was invalidated", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

@end
