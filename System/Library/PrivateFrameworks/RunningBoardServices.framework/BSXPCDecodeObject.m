@implementation BSXPCDecodeObject

BOOL ___BSXPCDecodeObject_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;

  v5 = a3;
  _BSXPCDecodeObjectFromContext(*(_QWORD *)(a1 + 32), v5, 0, *(_QWORD *)(a1 + 48), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }
  else
  {
    rbs_coder_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      ___BSXPCDecodeObject_block_invoke_cold_1((uint64_t)v5, a2, v7);

  }
  return v6 != 0;
}

BOOL ___BSXPCDecodeObject_block_invoke_180(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _BSXPCDecodeObjectForKey(*(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 56), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v4, v3);
  else
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v3);

  return v4 != 0;
}

void ___BSXPCDecodeObject_block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl(&dword_190CD6000, log, OS_LOG_TYPE_ERROR, "Array element %zu failed to decode: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_0();
}

@end
