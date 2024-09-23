@implementation AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc

void *__get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  v4 = 0;
  v2 = (void *)libAccessibilityLibraryCore();
  if (!v2)
    __get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_block_invoke_cold_1(&v4);
  result = dlsym(v2, "_AXSReduceMotionAutoplayAnimatedImagesEnabled");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                               + 24);
  return result;
}

void __get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *libAccessibilityLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WBSAccessibilityUtilities.m"), 11, CFSTR("%s"), *a1);

  __break(1u);
}

@end
