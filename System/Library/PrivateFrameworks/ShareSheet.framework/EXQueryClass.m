@implementation EXQueryClass

void __get_EXQueryClass_block_invoke(uint64_t a1)
{
  ExtensionKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("_EXQuery");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_EXQueryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __get_EXQueryClass_block_invoke_cold_1();
    ExtensionKitLibrary();
  }
}

uint64_t __get_EXQueryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __get_EXQueryControllerClass_block_invoke_cold_1(v0);
}

@end
