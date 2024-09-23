@implementation SpotlightReceiverRegister

void __SpotlightReceiverRegister_block_invoke(uint64_t a1)
{
  CSReceiverConnection *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = [CSReceiverConnection alloc];
  v4 = *(_QWORD *)(a1 + 40);
  v3 = (uint64_t *)(a1 + 40);
  v5 = -[CSReceiverConnection initWithReceiver:forServiceName:](v2, "initWithReceiver:forServiceName:", *(v3 - 1), v4);
  v6 = (void *)SpotlightReceiverRegister_sCSReceiverConnection;
  SpotlightReceiverRegister_sCSReceiverConnection = v5;

  if (SpotlightReceiverRegister_sCSReceiverConnection)
  {
    objc_msgSend((id)SpotlightReceiverRegister_sCSReceiverConnection, "startListener");
    logForCSLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *v3;
      v9 = 134218242;
      v10 = SpotlightReceiverRegister_sCSReceiverConnection;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_21066D000, v7, OS_LOG_TYPE_INFO, "CSReceiver %p running for %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    logForCSLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __SpotlightReceiverRegister_block_invoke_cold_1(v3, v7);
  }

}

void __SpotlightReceiverRegister_block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_21066D000, a2, OS_LOG_TYPE_ERROR, "Error setting up receiver for %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_5();
}

@end
