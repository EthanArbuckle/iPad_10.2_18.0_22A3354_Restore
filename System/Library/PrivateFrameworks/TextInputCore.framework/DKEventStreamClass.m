@implementation DKEventStreamClass

Class __get_DKEventStreamClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CoreDuetLibrary();
  result = objc_getClass("_DKEventStream");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_DKEventStreamClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__get_DKAnyStringIdentifierClass_block_invoke(v3);
  }
  return result;
}

@end
