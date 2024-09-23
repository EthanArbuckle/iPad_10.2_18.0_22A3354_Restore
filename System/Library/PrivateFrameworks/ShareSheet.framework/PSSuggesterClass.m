@implementation PSSuggesterClass

Class __get_PSSuggesterClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;
  float v4;

  PeopleSuggesterLibrary();
  result = objc_getClass("_PSSuggester");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_PSSuggesterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __get_PSSuggesterClass_block_invoke_cold_1();
    return (Class)OUTLINED_FUNCTION_3_0(v3, v4);
  }
  return result;
}

uint64_t __get_PSSuggesterClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SHSheetRouter activityPerformCleanUpPresentation:].cold.1(v0);
}

@end
