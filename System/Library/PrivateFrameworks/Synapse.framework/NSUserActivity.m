@implementation NSUserActivity

void __82__NSUserActivity_SYInternalExtensions___syFetchCurrentUserActivityWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.synapse", ");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __82__NSUserActivity_SYInternalExtensions___syFetchCurrentUserActivityWithCompletion___block_invoke_cold_1((uint64_t)v6, v7, v8);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_syDocument
{
  id v1;
  void *v2;
  void *v3;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    objc_msgSend(v1, "_payloadForIdentifier:", CFSTR("com.apple.synapse.document"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      +[SYDocument documentFromData:](SYDocument, "documentFromData:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

    objc_sync_exit(v1);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)set_syDocument:(void *)a1
{
  id v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  if (a1)
  {
    v4 = a1;
    objc_sync_enter(v4);
    v14 = 0;
    objc_msgSend(v3, "dataRepresentationWithError:", &v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v14;
    if (v6)
    {
      v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[NSUserActivity set_syDocument:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    }
    if (v5)
      objc_msgSend(v4, "_setPayload:object:identifier:", v5, 0, CFSTR("com.apple.synapse.document"));

    objc_sync_exit(v4);
  }

}

void __57__NSUserActivity_SynapseExtensions__set_linkContextInfo___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;

  v7 = a2;
  v8 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = SYCanUseObjectInContextInfo(v7);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_5;
  v9 = os_log_create("com.apple.synapse", ");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    __57__NSUserActivity_SynapseExtensions__set_linkContextInfo___block_invoke_cold_2((uint64_t)v7, v9);

  *a4 = 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
LABEL_5:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = SYCanUseObjectInContextInfo(v8);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      v10 = os_log_create("com.apple.synapse", ");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __57__NSUserActivity_SynapseExtensions__set_linkContextInfo___block_invoke_cold_1((uint64_t)v7, v10);

      *a4 = 1;
    }
  }

}

- (void)set_syDocument:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BCC38000, a2, a3, "Unable to encode document, error: %@", a5, a6, a7, a8, 2u);
}

void __57__NSUserActivity_SynapseExtensions__set_linkContextInfo___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  v4 = OUTLINED_FUNCTION_1_2(v3);
  OUTLINED_FUNCTION_0_1(&dword_1BCC38000, a2, v5, "Invalid value of class %@ in linkContextInfo dictionary.", v6);

  OUTLINED_FUNCTION_3_0();
}

void __57__NSUserActivity_SynapseExtensions__set_linkContextInfo___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  v4 = OUTLINED_FUNCTION_1_2(v3);
  OUTLINED_FUNCTION_0_1(&dword_1BCC38000, a2, v5, "Invalid key of class %@ in linkContextInfo dictionary.", v6);

  OUTLINED_FUNCTION_3_0();
}

void __82__NSUserActivity_SYInternalExtensions___syFetchCurrentUserActivityWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1BCC38000, a2, a3, "Fetching current user activity failed with error: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

@end
