@implementation DKEventStreamClass

Class __get_DKEventStreamClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!CoreDuetLibraryCore_frameworkLibrary)
    CoreDuetLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("_DKEventStream");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  get_DKEventStreamClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
