@implementation UIKitGetTextEffectsCatalogSymbolLoc

void *__get_UIKitGetTextEffectsCatalogSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E260C1F0;
    v5 = 0;
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!UIKitLibraryCore_frameworkLibrary)
    __get_UIKitGetTextEffectsCatalogSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)UIKitLibraryCore_frameworkLibrary, "_UIKitGetTextEffectsCatalog");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  get_UIKitGetTextEffectsCatalogSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_UIKitGetTextEffectsCatalogSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *UIKitLibrary(void)"), CFSTR("__NSTextAppearanceInterface.m"), 16, CFSTR("%s"), *a1);
  __break(1u);
}

@end
