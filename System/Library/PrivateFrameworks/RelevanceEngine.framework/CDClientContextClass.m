@implementation CDClientContextClass

void __get_CDClientContextClass_block_invoke(uint64_t a1)
{
  CoreDuetContextLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("_CDClientContext");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_CDClientContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __get_CDClientContextClass_block_invoke_cold_1();
    CoreDuetContextLibrary();
  }
}

uint64_t __get_CDClientContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __get_CDContextQueriesClass_block_invoke_cold_1(v0);
}

@end
