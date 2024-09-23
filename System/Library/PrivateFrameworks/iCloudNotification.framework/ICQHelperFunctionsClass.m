@implementation ICQHelperFunctionsClass

Class __get_ICQHelperFunctionsClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!iCloudQuotaLibraryCore_frameworkLibrary)
  {
    iCloudQuotaLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!iCloudQuotaLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __get_ICQHelperFunctionsClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("_ICQHelperFunctions");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  get_ICQHelperFunctionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_ICQHelperFunctionsClass_block_invoke_cold_1()
{
  const void *v0;
  int v1;

  v0 = (const void *)abort_report_np();
  _Block_object_dispose(v0, v1);
}

@end
