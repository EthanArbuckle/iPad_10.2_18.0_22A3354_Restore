@implementation PCSReportKeyRollPending

void __PCSReportKeyRollPending_block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  pcsLogObjForScope("ManateeStatus");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1A9508000, v6, OS_LOG_TYPE_DEFAULT, "PCSReportKeyRollPending: %d: %@", (uint8_t *)v7, 0x12u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
}

@end
