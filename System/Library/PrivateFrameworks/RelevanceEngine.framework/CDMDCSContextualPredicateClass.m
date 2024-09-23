@implementation CDMDCSContextualPredicateClass

Class __get_CDMDCSContextualPredicateClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CoreDuetContextLibrary();
  result = objc_getClass("_CDMDCSContextualPredicate");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_CDMDCSContextualPredicateClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __get_CDMDCSContextualPredicateClass_block_invoke_cold_1();
    return (Class)__get_CDContextualChangeRegistrationClass_block_invoke(v3);
  }
  return result;
}

uint64_t __get_CDMDCSContextualPredicateClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __get_CDContextualChangeRegistrationClass_block_invoke_cold_1(v0);
}

@end
