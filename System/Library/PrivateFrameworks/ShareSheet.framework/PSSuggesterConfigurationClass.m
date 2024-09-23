@implementation PSSuggesterConfigurationClass

void __get_PSSuggesterConfigurationClass_block_invoke(uint64_t a1)
{
  PeopleSuggesterLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("_PSSuggesterConfiguration");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_PSSuggesterConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __get_PSSuggesterConfigurationClass_block_invoke_cold_1();
    PeopleSuggesterLibrary();
  }
}

uint64_t __get_PSSuggesterConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __get_PSSuggesterClass_block_invoke_cold_1(v0);
}

@end
