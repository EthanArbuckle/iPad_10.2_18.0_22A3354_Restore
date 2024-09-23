@implementation DKPredictorClass

Class __get_DKPredictorClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CoreDuetLibrary_0();
  result = objc_getClass("_DKPredictor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_DKPredictorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __get_DKPredictorClass_block_invoke_cold_1();
    return (Class)__get_DKIdentifierClass_block_invoke(v3);
  }
  return result;
}

uint64_t __get_DKPredictorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __get_DKIdentifierClass_block_invoke_cold_1(v0);
}

@end
