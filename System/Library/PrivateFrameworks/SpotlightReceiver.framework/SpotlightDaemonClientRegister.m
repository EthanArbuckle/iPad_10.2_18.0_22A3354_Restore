@implementation SpotlightDaemonClientRegister

void __SpotlightDaemonClientRegister_block_invoke(uint64_t a1)
{
  SpotlightDaemonClientConnection *v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = [SpotlightDaemonClientConnection alloc];
  v4 = *(_QWORD *)(a1 + 40);
  v3 = (id *)(a1 + 40);
  v5 = -[SpotlightDaemonClientConnection initWithClient:forServiceName:](v2, "initWithClient:forServiceName:", *(v3 - 1), v4);
  v6 = (void *)SpotlightDaemonClientRegister_sSpotlightDaemonClientConnection;
  SpotlightDaemonClientRegister_sSpotlightDaemonClientConnection = v5;

  if (SpotlightDaemonClientRegister_sSpotlightDaemonClientConnection)
  {
    objc_msgSend((id)SpotlightDaemonClientRegister_sSpotlightDaemonClientConnection, "startListener");
    logForCSLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *v3;
      v20 = 134218242;
      v21 = SpotlightDaemonClientRegister_sSpotlightDaemonClientConnection;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_21066D000, v7, OS_LOG_TYPE_INFO, "spotlight_daemon %p running for %@", (uint8_t *)&v20, 0x16u);
    }

    logForCSLogCategoryDaemonClient();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_generate(v9);

    logForCSLogCategoryDaemonClient();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      if (*v3)
        v13 = (void *)objc_msgSend(objc_retainAutorelease(*v3), "UTF8String");
      else
        v13 = &unk_2106730FF;
      v20 = 136315138;
      v21 = (uint64_t)v13;
      _os_signpost_emit_with_name_impl(&dword_21066D000, v12, OS_SIGNPOST_EVENT, v10, "ClientRegister", "%s", (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    logForCSLogCategoryDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __SpotlightDaemonClientRegister_block_invoke_cold_1((uint64_t)v3, v12, v14, v15, v16, v17, v18, v19);
  }

}

void __SpotlightDaemonClientRegister_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21066D000, a2, a3, "Error setting up reciever for %@", a5, a6, a7, a8, 2u);
}

@end
