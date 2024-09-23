@implementation RegisterPostUpgradeUAFActivity

void ___RegisterPostUpgradeUAFActivity_block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t v2;
  xpc_object_t v3;
  _xpc_activity_s *activity;

  activity = a2;
  v2 = xpc_activity_copy_criteria(activity);
  if (!v2)
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC6B8], 0);
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x24BDAC5B8], 0);
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x24BDAC5D8], *MEMORY[0x24BDAC628]);
    xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC6D8], 0);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC598], 1);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC680], 1);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC6D0], 1);
    xpc_activity_set_criteria(activity, v3);

  }
}

void ___RegisterPostUpgradeUAFActivity_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v3)(_QWORD);
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  UAFGetLogCategory((id *)&UAFLogContextXPCActivity);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "_RegisterPostUpgradeUAFActivity_block_invoke_2";
    _os_log_impl(&dword_229282000, v4, OS_LOG_TYPE_DEFAULT, "%s Post-Upgrade registering for startup complete notification", (uint8_t *)&v7, 0xCu);
  }

  UAFGetLogCategory((id *)&UAFLogContextXPCActivity);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "_RegisterPostUpgradeUAFActivity_block_invoke";
    _os_log_impl(&dword_229282000, v5, OS_LOG_TYPE_DEFAULT, "%s Disallowing removal of assets post-upgrade", (uint8_t *)&v7, 0xCu);
  }

  +[UAFSubscriptionStoreManager writeManager](UAFSubscriptionStoreManager, "writeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSystemConfigurationForKey:withValue:", CFSTR("NoRemove"), CFSTR("1"));

  if (v3)
    v3[2](v3);

}

@end
