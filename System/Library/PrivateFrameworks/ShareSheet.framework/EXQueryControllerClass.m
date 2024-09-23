@implementation EXQueryControllerClass

Class __get_EXQueryControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ExtensionKitLibrary();
  result = objc_getClass("_EXQueryController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_EXQueryControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __get_EXQueryControllerClass_block_invoke_cold_1();
    return (Class)SynapseLibrary(v3);
  }
  return result;
}

uint64_t __get_EXQueryControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSYNotesActivationRequestClass_block_invoke_cold_1(v0);
}

@end
