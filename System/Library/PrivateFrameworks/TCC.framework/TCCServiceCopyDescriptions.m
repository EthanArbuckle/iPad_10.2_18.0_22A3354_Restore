@implementation TCCServiceCopyDescriptions

void __TCCServiceCopyDescriptions_block_invoke(_QWORD *a1)
{
  void *v1;
  _xpc_connection_s *v2;
  _QWORD v3[5];

  v2 = (_xpc_connection_s *)a1[5];
  v1 = (void *)a1[6];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = __TCCServiceCopyDescriptions_block_invoke_2;
  v3[3] = &unk_1E4A2EBC8;
  v3[4] = a1[4];
  tccd_set_message_number(v1);
  tccd_send_message(v2, 0, v1, (uint64_t)v3, 7, 0);
}

void __TCCServiceCopyDescriptions_block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (MEMORY[0x1A859163C](a2) == MEMORY[0x1E0C81310])
  {
    if (tcc_log_handle_onceToken != -1)
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR))
      __TCCServiceCopyDescriptions_block_invoke_2_cold_1(a2);
  }
  else if (xpc_dictionary_get_value(a2, "service_descriptions"))
  {
    if (MEMORY[0x1A859163C]() == MEMORY[0x1E0C812C8])
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _CFXPCCreateCFObjectFromXPCObject();
    }
    else
    {
      if (tcc_log_handle_onceToken != -1)
        dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
      v4 = tcc_client_log;
      if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR))
        __TCCServiceCopyDescriptions_block_invoke_2_cold_2(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

void __TCCServiceCopyDescriptions_block_invoke_2_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x1E0C81270]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1A364C000, v1, v2, "%{public}s: %{public}s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3();
}

void __TCCServiceCopyDescriptions_block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A364C000, a1, a3, "%{public}s: returned object is not an array.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

@end
