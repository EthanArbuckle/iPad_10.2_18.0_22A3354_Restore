@implementation RegisterOnBootUAFActivity

void ___RegisterOnBootUAFActivity_block_invoke(uint64_t a1, void *a2)
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
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC6D8], 1);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC598], 1);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC6D0], 1);
    xpc_activity_set_criteria(activity, v3);

  }
}

void ___RegisterOnBootUAFActivity_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  +[UAFSubscriptionStoreManager writeManager](UAFSubscriptionStoreManager, "writeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFAssetSetManager configureAssetDelivery:configurationManager:lockIfUnchanged:](UAFAssetSetManager, "configureAssetDelivery:configurationManager:lockIfUnchanged:", v3, v4, 0);

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }

}

@end
