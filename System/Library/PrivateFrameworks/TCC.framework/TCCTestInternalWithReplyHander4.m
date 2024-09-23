@implementation TCCTestInternalWithReplyHander4

void __TCCTestInternalWithReplyHander4_block_invoke(uint64_t a1)
{
  _xpc_connection_s *v1;
  void *v2;
  _QWORD v3[4];
  __int128 v4;

  v1 = *(_xpc_connection_s **)(a1 + 48);
  v2 = *(void **)(a1 + 56);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = __TCCTestInternalWithReplyHander4_block_invoke_2;
  v3[3] = &unk_1E4A2EC18;
  v4 = *(_OWORD *)(a1 + 32);
  tccd_set_message_number(v2);
  tccd_send_message(v1, 0, v2, (uint64_t)v3, 7, 0);
}

void __TCCTestInternalWithReplyHander4_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;

  if (MEMORY[0x1A859163C](a2) == MEMORY[0x1E0C81310])
  {
    if (tcc_log_handle_onceToken != -1)
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR))
      __TCCTestInternalWithReplyHander4_block_invoke_2_cold_1(a2);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_BOOL(a2, "result");
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, a2, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  }
}

void __TCCTestInternalWithReplyHander4_block_invoke_2_cold_1(void *a1)
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

@end
