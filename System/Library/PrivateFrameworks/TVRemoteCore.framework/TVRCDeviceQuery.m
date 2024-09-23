@implementation TVRCDeviceQuery

+ (id)_allDiscoveredDevices
{
  if (__lastKnownDeviceSet)
    return (id)__lastKnownDeviceSet;
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)_allDiscoveredDevicesDidUpdate:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)__lastKnownDeviceSet;
  __lastKnownDeviceSet = v3;

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)objc_msgSend((id)__activeQueries, "copy");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "delegate", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "deviceQueryDidUpdateDevices:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

+ (void)_updateSuggestedDevices:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)objc_msgSend((id)__activeQueries, "copy");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "delegate", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "didUpdateSuggestedDevices:", v3);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

+ (void)getConnectionStatusToDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getConnectionStatusToDeviceWithIdentifier:response:", v6, v5);

}

- (void)dealloc
{
  objc_super v3;

  -[TVRCDeviceQuery stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)TVRCDeviceQuery;
  -[TVRCDeviceQuery dealloc](&v3, sel_dealloc);
}

- (NSSet)devices
{
  return (NSSet *)(id)__lastKnownDeviceSet;
}

- (void)start
{
  -[TVRCDeviceQuery startWithCompletionHandler:](self, "startWithCompletionHandler:", 0);
}

- (void)startWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id WeakRetained;
  char v11;

  v4 = (void (**)(id, uint64_t))a3;
  _TVRCGeneralLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[TVRCDeviceQuery startWithCompletionHandler:].cold.1();

  v6 = (void *)__activeQueries;
  if (!__activeQueries)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)__activeQueries;
    __activeQueries = v7;

    v6 = (void *)__activeQueries;
  }
  objc_msgSend(v6, "addObject:", self);
  if (objc_msgSend((id)__activeQueries, "count") == 1)
  {
    +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "beginDeviceQueryWithResponse:", v4);
LABEL_11:

    goto LABEL_12;
  }
  if (v4)
    v4[2](v4, 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "deviceQueryDidUpdateDevices:", self);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)stop
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_21A51B000, v0, v1, "STOP: Active queries: %@ - before removing: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fetchSuggestedDevicesWithResponse:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__TVRCDeviceQuery_fetchSuggestedDevicesWithResponse___block_invoke;
  v7[3] = &unk_24DCD8058;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getSuggestedDevicesWithResponse:", v7);

}

void __53__TVRCDeviceQuery_fetchSuggestedDevicesWithResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_opt_class(), "deviceForDeviceState:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = *(_QWORD *)(a1 + 40);
  v12 = (void *)objc_msgSend(v4, "copy");
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

}

+ (void)fetchActiveEndpointUIDWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[TVRCXPCClient sharedInstance](TVRCXPCClient, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__TVRCDeviceQuery_fetchActiveEndpointUIDWithCompletion___block_invoke;
  v6[3] = &unk_24DCD8080;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "fetchActiveMREndpointUIDWithCompletion:", v6);

}

uint64_t __56__TVRCDeviceQuery_fetchActiveEndpointUIDWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)deviceForDeviceState:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  +[TVRCDeviceQuery _allDiscoveredDevices](TVRCDeviceQuery, "_allDiscoveredDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _TVRCGeneralLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[TVRCDeviceQuery deviceForDeviceState:].cold.1((uint64_t)v4, v5);

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __40__TVRCDeviceQuery_deviceForDeviceState___block_invoke;
  v9[3] = &unk_24DCD80A8;
  v6 = v3;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __40__TVRCDeviceQuery_deviceForDeviceState___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (TVRCDeviceQueryDelegate)delegate
{
  return (TVRCDeviceQueryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)startWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_21A51B000, v0, v1, "START: Active queries: %@ - before adding: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)deviceForDeviceState:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_21A51B000, a2, OS_LOG_TYPE_DEBUG, "Discovered devices: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
