@implementation PSPeopleSuggestionsMetricsModelClass

Class __get_PSPeopleSuggestionsMetricsModelClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!ReportingPluginLibraryCore_frameworkLibrary)
    ReportingPluginLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("_PSPeopleSuggestionsMetricsModel");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  get_PSPeopleSuggestionsMetricsModelClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
