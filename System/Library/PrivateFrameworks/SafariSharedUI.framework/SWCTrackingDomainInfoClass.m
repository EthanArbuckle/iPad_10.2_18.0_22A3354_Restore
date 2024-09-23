@implementation SWCTrackingDomainInfoClass

Class __get_SWCTrackingDomainInfoClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!SharedWebCredentialsLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E5444380;
    v5 = 0;
    SharedWebCredentialsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SharedWebCredentialsLibraryCore_frameworkLibrary)
    __get_SWCTrackingDomainInfoClass_block_invoke_cold_1(&v3);
  result = objc_getClass("_SWCTrackingDomainInfo");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __get_SWCTrackingDomainInfoClass_block_invoke_cold_2();
  get_SWCTrackingDomainInfoClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_SWCTrackingDomainInfoClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SharedWebCredentialsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WBSKnownTrackerFilter.m"), 17, CFSTR("%s"), *a1);

  __break(1u);
}

void __get_SWCTrackingDomainInfoClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_SWCTrackingDomainInfoClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WBSKnownTrackerFilter.m"), 18, CFSTR("Unable to find class %s"), "_SWCTrackingDomainInfo");

  __break(1u);
}

@end
