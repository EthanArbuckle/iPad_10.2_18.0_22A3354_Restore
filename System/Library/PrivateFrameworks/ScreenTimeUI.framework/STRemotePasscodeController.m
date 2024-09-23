@implementation STRemotePasscodeController

+ (id)_xpcConnection
{
  if (_xpcConnection_onceToken != -1)
    dispatch_once(&_xpcConnection_onceToken, &__block_literal_global_5);
  return (id)_xpcConnection_connection;
}

uint64_t __44__STRemotePasscodeController__xpcConnection__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(MEMORY[0x24BE84618], "newContactsServiceConnection");
  v1 = (void *)_xpcConnection_connection;
  _xpcConnection_connection = v0;

  return objc_msgSend((id)_xpcConnection_connection, "resume");
}

+ (BOOL)isRestrictionsPasscodeSet
{
  id v3;
  char v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (_os_feature_enabled_impl())
  {
    v3 = objc_alloc_init(MEMORY[0x24BE84548]);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke;
    v7[3] = &unk_24CED4830;
    v7[4] = &v8;
    objc_msgSend(v3, "isRestrictionsPasscodeSetWithCompletionHandler:", v7);
  }
  else
  {
    objc_msgSend(a1, "_xpcConnection");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke_21;
    v6[3] = &unk_24CED4858;
    v6[4] = &v8;
    objc_msgSend(MEMORY[0x24BE84698], "synchronousProxyFromConnection:proxyHandler:", v3, v6);
  }

  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;

  v5 = a3;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke_cold_1();
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  }

}

void __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke_2;
    v7[3] = &unk_24CED4830;
    v7[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "isRestrictionsPasscodeSetWithCompletionHandler:", v7);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke_21_cold_1();
  }

}

void __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;

  v5 = a3;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke_cold_1();
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  }

}

+ (void)activateRemotePINUI
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(33, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__STRemotePasscodeController_activateRemotePINUI__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);

}

void __49__STRemotePasscodeController_activateRemotePINUI__block_invoke(uint64_t a1)
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_2;
  activity_block[3] = &__block_descriptor_40_e5_v8__0l;
  activity_block[4] = *(_QWORD *)(a1 + 32);
  _os_activity_initiate(&dword_212E1A000, "STRestrictionsPINController activateRemotePINUI", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_2(uint64_t a1)
{
  id v2;

  if (_os_feature_enabled_impl())
  {
    v2 = objc_alloc_init(MEMORY[0x24BE84548]);
    objc_msgSend(v2, "presentRemotePINControllerWithCompletionHandler:", &__block_literal_global_24);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_xpcConnection");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE84698], "proxyFromConnection:proxyHandler:");
  }

}

void __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a2;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_3_cold_2();
  }
  else
  {
    v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v3)
      __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_3_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }

}

void __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a2;
  v5 = a3;
  if (v4)
  {
    objc_msgSend(v4, "presentRemotePINControllerWithCompletionHandler:", &__block_literal_global_28);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_25_cold_1();
  }

}

void __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_2_27(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a2;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_3_cold_2();
  }
  else
  {
    v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v3)
      __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_3_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }

}

void __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_212E1A000, MEMORY[0x24BDACB70], v0, "Failed to fetch isRestrictionsPasscodeSet: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __55__STRemotePasscodeController_isRestrictionsPasscodeSet__block_invoke_21_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_212E1A000, MEMORY[0x24BDACB70], v0, "Failed to create synchronous proxy to fetch isRestrictionsPasscodeSet: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_3_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_212E1A000, MEMORY[0x24BDACB70], a3, "Successfully activated remote PIN UI.", a5, a6, a7, a8, 0);
}

void __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_3_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_212E1A000, MEMORY[0x24BDACB70], v0, "Failed to activate remote PIN UI: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __49__STRemotePasscodeController_activateRemotePINUI__block_invoke_25_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_212E1A000, MEMORY[0x24BDACB70], v0, "Failed to create proxy to activate remote PIN UI: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

@end
