@implementation CDInteractionsStatisticsConfigClass

Class __get_CDInteractionsStatisticsConfigClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!CoreDuetFrameworkLibraryCore_frameworkLibrary)
    CoreDuetFrameworkLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("_CDInteractionsStatisticsConfig");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  get_CDInteractionsStatisticsConfigClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
