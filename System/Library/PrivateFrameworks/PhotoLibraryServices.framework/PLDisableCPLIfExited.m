@implementation PLDisableCPLIfExited

uint64_t __PLDisableCPLIfExited_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t result;
  uint8_t v6[16];

  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Has exited iCPL: DID disable the iCPL account setting", v6, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

@end
