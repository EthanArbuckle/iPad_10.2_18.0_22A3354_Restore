@implementation TCCAccessCopyBundleIdentifiersDisabledForService

void __TCCAccessCopyBundleIdentifiersDisabledForService_block_invoke(_QWORD *a1)
{
  void *v1;
  _xpc_connection_s *v2;
  _QWORD v3[5];

  v2 = (_xpc_connection_s *)a1[5];
  v1 = (void *)a1[6];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = __TCCAccessCopyBundleIdentifiersDisabledForService_block_invoke_2;
  v3[3] = &unk_1E4A2E7D8;
  v3[4] = a1[4];
  tccd_set_message_number(v1);
  tccd_send_message(v2, 0, v1, (uint64_t)v3, 7, 0);
}

void __TCCAccessCopyBundleIdentifiersDisabledForService_block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t value;
  void *v5;
  size_t count;
  CFMutableArrayRef Mutable;
  _QWORD applier[5];

  if (MEMORY[0x1A859163C](a2) == MEMORY[0x1E0C81310])
  {
    if (tcc_log_handle_onceToken != -1)
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR))
      __TCCAccessCopyBundleIdentifiersDisabledForService_block_invoke_2_cold_1(a2);
  }
  else
  {
    value = xpc_dictionary_get_value(a2, "clients");
    if (value)
    {
      v5 = value;
      count = xpc_array_get_count(value);
      Mutable = CFArrayCreateMutable(0, count, MEMORY[0x1E0C9B378]);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Mutable;
      if (Mutable)
      {
        applier[0] = MEMORY[0x1E0C809B0];
        applier[1] = 0x40000000;
        applier[2] = __TCCAccessCopyBundleIdentifiersDisabledForService_block_invoke_253;
        applier[3] = &unk_1E4A2E7B0;
        applier[4] = *(_QWORD *)(a1 + 32);
        xpc_array_apply(v5, applier);
      }
    }
  }
}

uint64_t __TCCAccessCopyBundleIdentifiersDisabledForService_block_invoke_253(uint64_t a1, int a2, xpc_object_t xstring)
{
  const char *string_ptr;
  CFStringRef v5;
  CFStringRef v6;

  string_ptr = xpc_string_get_string_ptr(xstring);
  v5 = CFStringCreateWithCString(0, string_ptr, 0x8000100u);
  if (v5)
  {
    v6 = v5;
    CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v5);
    CFRelease(v6);
  }
  return 1;
}

void __TCCAccessCopyBundleIdentifiersDisabledForService_block_invoke_2_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x1E0C81270]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1A364C000, v1, v2, "%s{public}: %{public}s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3();
}

@end
