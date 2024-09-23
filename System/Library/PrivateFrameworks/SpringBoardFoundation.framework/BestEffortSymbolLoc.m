@implementation BestEffortSymbolLoc

void *__getSOSCCBailFromCircle_BestEffortSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!SecurityLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E200E070;
    v5 = 0;
    SecurityLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SecurityLibraryCore_frameworkLibrary)
    __getSOSCCBailFromCircle_BestEffortSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)SecurityLibraryCore_frameworkLibrary, "SOSCCBailFromCircle_BestEffort");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSOSCCBailFromCircle_BestEffortSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getSOSCCBailFromCircle_BestEffortSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SecurityLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SBFObliterationController.m"), 35, CFSTR("%s"), *a1);

  __break(1u);
}

@end
