@implementation SWCollaborationShareOptionsClass

Class __get_SWCollaborationShareOptionsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SharedWithYouCoreLibraryCore_frameworkLibrary)
  {
    SharedWithYouCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SharedWithYouCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("_SWCollaborationShareOptions");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__get_SWCollaborationShareOptionsClass_block_invoke_cold_1();
    free(v3);
  }
  get_SWCollaborationShareOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __get_SWCollaborationShareOptionsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SHSheetGroupActivitySharingController initWithItemProvider:].cold.1(v0);
}

@end
