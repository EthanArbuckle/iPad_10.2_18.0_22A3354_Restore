@implementation SWCollaborationOptionsGroupClass

Class __get_SWCollaborationOptionsGroupClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!SharedWithYouCoreLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_1E48338E0;
    v5 = 0;
    SharedWithYouCoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!SharedWithYouCoreLibraryCore_frameworkLibrary_0)
    __get_SWCollaborationOptionsGroupClass_block_invoke_cold_1(&v3);
  result = objc_getClass("_SWCollaborationOptionsGroup");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_SWCollaborationOptionsGroupClass_block_invoke_cold_2();
  get_SWCollaborationOptionsGroupClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_SWCollaborationOptionsGroupClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SharedWithYouCoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SFCollaborationCloudSharingRequest.m"), 27, CFSTR("%s"), *a1);

  __break(1u);
}

void __get_SWCollaborationOptionsGroupClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_SWCollaborationOptionsGroupClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SFCollaborationCloudSharingRequest.m"), 28, CFSTR("Unable to find class %s"), "_SWCollaborationOptionsGroup");

  __break(1u);
}

@end
