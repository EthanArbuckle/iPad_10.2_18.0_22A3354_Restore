@implementation KSUserWordsSynchroniserClass

Class __get_KSUserWordsSynchroniserClass_block_invoke(uint64_t a1)
{
  Class result;

  KeyboardServicesLibrary();
  result = objc_getClass("_KSUserWordsSynchroniser");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_KSUserWordsSynchroniserClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)KeyboardServicesLibrary();
  }
  return result;
}

@end
