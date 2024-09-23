@implementation DKApplicationMetadataKeyClass

Class __get_DKApplicationMetadataKeyClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CoreDuetLibrary_0();
  result = objc_getClass("_DKApplicationMetadataKey");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_DKApplicationMetadataKeyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __get_DKApplicationMetadataKeyClass_block_invoke_cold_1();
    return __get_DKPredictionQueryClass_block_invoke(v3);
  }
  return result;
}

uint64_t __get_DKApplicationMetadataKeyClass_block_invoke_cold_1()
{
  abort_report_np();
  return __get_DKPredictionQueryClass_block_invoke_cold_1();
}

@end
