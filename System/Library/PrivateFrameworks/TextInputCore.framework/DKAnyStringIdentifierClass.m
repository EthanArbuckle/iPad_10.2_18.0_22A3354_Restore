@implementation DKAnyStringIdentifierClass

void __get_DKAnyStringIdentifierClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("_DKAnyStringIdentifier");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_DKAnyStringIdentifierClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    CoreDuetLibrary();
  }
}

@end
