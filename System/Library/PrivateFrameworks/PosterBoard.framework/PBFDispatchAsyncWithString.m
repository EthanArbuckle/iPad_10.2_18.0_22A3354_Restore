@implementation PBFDispatchAsyncWithString

void __PBFDispatchAsyncWithString_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  NSObject *v6;

  v2 = qword_1ED89A940;
  v4 = (_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    qword_1ED89A940 = objc_msgSend(*(id *)(a1 + 32), "UTF8String");
    if (*v4)
    {
      if (*(_BYTE *)(a1 + 48))
      {
        v5 = PBFLogCommon();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          __PBFDispatchAsyncWithString_block_invoke_cold_2();
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_QWORD *)(a1 + 32)
    && *(_BYTE *)(a1 + 48)
    && (v6 = PBFLogCommon(), os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)))
  {
    __PBFDispatchAsyncWithString_block_invoke_cold_1();
    if (!v3)
      return;
  }
  else if (!v3)
  {
    return;
  }
  qword_1ED89A940 = v2;
}

void __PBFDispatchAsyncWithString_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1CB9FA000, v0, v1, "fired block %p for msg %@");
}

void __PBFDispatchAsyncWithString_block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1CB9FA000, v0, v1, "firing block %p for msg %@");
}

@end
