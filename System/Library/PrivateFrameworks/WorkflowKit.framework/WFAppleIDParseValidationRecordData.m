@implementation WFAppleIDParseValidationRecordData

void __WFAppleIDParseValidationRecordData_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;
  id v5;
  void (**v6)(id, id, _QWORD);
  uint64_t Int64;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v4;
  if (a3 == 1 || a3 == 4)
  {
    Int64 = CFDictionaryGetInt64();
    if ((unint64_t)(Int64 - 101) > 0xFFFFFFFFFFFFFF9BLL)
    {
      if (v6)
        v6[2](v6, v5, 0);
      goto LABEL_12;
    }
    v10 = Int64;
    v9 = 201212;
    getWFSecurityLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "handleValidationRecordTrustResult";
      v13 = 2048;
      v14 = v10;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Signed Shortcut File Apple ID Parsing Validation Record: Unsupported version %ld (must be between 1 and 100)", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    getWFSecurityLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "handleValidationRecordTrustResult";
      v13 = 1024;
      LODWORD(v14) = a3;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Signed Shortcut File Apple ID Parsing Validation Record: Unexpected trust result %d", (uint8_t *)&v11, 0x12u);
    }
    v9 = 201214;
  }

  if (v6)
    v6[2](v6, 0, v9);
LABEL_12:

}

uint64_t __WFAppleIDParseValidationRecordData_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(unsigned int *)(a1 + 40));
}

@end
