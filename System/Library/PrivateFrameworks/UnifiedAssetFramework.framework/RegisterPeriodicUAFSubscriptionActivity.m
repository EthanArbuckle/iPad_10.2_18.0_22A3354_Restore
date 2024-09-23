@implementation RegisterPeriodicUAFSubscriptionActivity

void ___RegisterPeriodicUAFSubscriptionActivity_block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t v2;
  xpc_object_t v3;
  _xpc_activity_s *activity;

  activity = a2;
  v2 = xpc_activity_copy_criteria(activity);
  if (!v2)
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x24BDAC5F0], *MEMORY[0x24BDAC600]);
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x24BDAC5D8], *MEMORY[0x24BDAC620]);
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x24BDAC6B0], *MEMORY[0x24BDAC608]);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC6B8], 1);
    xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A0]);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC598], 0);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC6D0], 1);
    xpc_activity_set_criteria(activity, v3);

  }
}

void ___RegisterPeriodicUAFSubscriptionActivity_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v3)(_QWORD);
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  UAFGetLogCategory((id *)&UAFLogContextXPCActivity);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "_RegisterPeriodicUAFSubscriptionActivity_block_invoke_2";
    _os_log_impl(&dword_229282000, v4, OS_LOG_TYPE_DEFAULT, "%s Allowing removal of assets", (uint8_t *)&v11, 0xCu);
  }

  +[UAFSubscriptionStoreManager writeManager](UAFSubscriptionStoreManager, "writeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSystemConfigurationForKey:withValue:", CFSTR("NoRemove"), CFSTR("0"));

  UAFGetLogCategory((id *)&UAFLogContextXPCActivity);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "_RegisterPeriodicUAFSubscriptionActivity_block_invoke";
    _os_log_impl(&dword_229282000, v6, OS_LOG_TYPE_DEFAULT, "%s Updating subscriptions", (uint8_t *)&v11, 0xCu);
  }

  +[UAFSubscriptionStoreManager writeManager](UAFSubscriptionStoreManager, "writeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "expireSubscriptions");

  +[UAFSubscriptionStoreManager writeManager](UAFSubscriptionStoreManager, "writeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFAssetSetManager configureAssetDelivery:configurationManager:](UAFAssetSetManager, "configureAssetDelivery:configurationManager:", v8, v9);

  UAFGetLogCategory((id *)&UAFLogContextXPCActivity);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "_RegisterPeriodicUAFSubscriptionActivity_block_invoke";
    _os_log_impl(&dword_229282000, v10, OS_LOG_TYPE_DEFAULT, "%s XPC: Done triggering UAF subscription maintenance", (uint8_t *)&v11, 0xCu);
  }

  +[UAFInstrumentationProvider logAvailableAssetDailyStatus](UAFInstrumentationProvider, "logAvailableAssetDailyStatus");
  if (v3)
    v3[2](v3);

}

@end
