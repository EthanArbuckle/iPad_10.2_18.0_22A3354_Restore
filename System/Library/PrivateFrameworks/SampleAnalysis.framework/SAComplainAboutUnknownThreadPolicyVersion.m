@implementation SAComplainAboutUnknownThreadPolicyVersion

int *__SAComplainAboutUnknownThreadPolicyVersion_block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  int *result;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  _sa_logt();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v5 = *(_DWORD *)(a1 + 32);
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_fault_impl(&dword_1B9BE0000, v3, OS_LOG_TYPE_FAULT, "Unknown thread policy version %d! Thread QoS ipc overrides and promotions will be missing", (uint8_t *)v6, 8u);
  }

  result = __error();
  *result = v2;
  return result;
}

@end
