@implementation DKEventQueryClass

Class __get_DKEventQueryClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!CoreDuetLibraryCore_frameworkLibrary)
    CoreDuetLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("_DKEventQuery");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  get_DKEventQueryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
