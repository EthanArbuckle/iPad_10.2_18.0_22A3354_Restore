@implementation AXSPrefersNonBlinkingCursorIndicatorSymbolLoc

void *__get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (void *)libAccessibilityLibraryCore_frameworkLibrary;
  v8 = libAccessibilityLibraryCore_frameworkLibrary;
  if (!libAccessibilityLibraryCore_frameworkLibrary)
  {
    v9 = xmmword_24CC1D390;
    v10 = 0;
    v2 = (void *)_sl_dlopen();
    v6[3] = (uint64_t)v2;
    libAccessibilityLibraryCore_frameworkLibrary = (uint64_t)v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    __get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_block_invoke_cold_1(&v4);
  if (v4)
    free(v4);
  result = dlsym(v2, "_AXSPrefersNonBlinkingCursorIndicator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *libAccessibilityLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SCROBrailleDisplay.m"), 33, CFSTR("%s"), *a1);

  __break(1u);
}

@end
