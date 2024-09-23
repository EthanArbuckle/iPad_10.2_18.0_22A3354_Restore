@implementation KSTextReplacementServerClass

Class __get_KSTextReplacementServerClass_block_invoke(uint64_t a1)
{
  Class result;

  KeyboardServicesLibrary_13070();
  result = objc_getClass("_KSTextReplacementServer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_KSTextReplacementServerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)getKSTextReplacementDidChangeNotification();
  }
  return result;
}

@end
