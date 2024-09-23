@implementation RBLogAddStateCaptureBlockWithTitle

_DWORD *___RBLogAddStateCaptureBlockWithTitle_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  size_t v6;
  _DWORD *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;

  if (*(_BYTE *)(a1 + 48) && *(_DWORD *)(a2 + 16) != 3)
    return 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v3, 200, 0, &v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v17;
  if (v4 && (unint64_t)(objc_msgSend(v4, "length") + 200) <= 0x8000)
  {
    v6 = objc_msgSend(v4, "length");
    v7 = malloc_type_calloc(1uLL, v6 + 200, 0xAA855B6FuLL);
    *v7 = 1;
    v7[1] = v6;
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
    __strlcpy_chk();
    memcpy(v7 + 50, (const void *)objc_msgSend(objc_retainAutorelease(v4), "bytes"), v6);
  }
  else
  {
    rbs_state_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v9)
        ___RBLogAddStateCaptureBlockWithTitle_block_invoke_cold_2(a1, v5, v8);
    }
    else if (v9)
    {
      ___RBLogAddStateCaptureBlockWithTitle_block_invoke_cold_1(a1, v8, v10, v11, v12, v13, v14, v15);
    }

    v7 = 0;
  }

  return v7;
}

void ___RBLogAddStateCaptureBlockWithTitle_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21A8B4000, a2, a3, "Error: RBLogAddStateCaptureBlockWithTitle(%@) cannot capture state data larger than 32KB", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

void ___RBLogAddStateCaptureBlockWithTitle_block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_21A8B4000, a3, OS_LOG_TYPE_ERROR, "Error: RBLogAddStateCaptureBlockWithTitle(%@) state data format error: %@", (uint8_t *)&v6, 0x16u);

}

@end
