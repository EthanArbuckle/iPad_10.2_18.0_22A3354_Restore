@implementation AXSAttentionAwarenessFeaturesEnabledSymbolLoc

void *__get_AXSAttentionAwarenessFeaturesEnabledSymbolLoc_block_invoke(uint64_t a1)
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
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (void *)libAccessibilityLibraryCore_frameworkLibrary;
  v8 = libAccessibilityLibraryCore_frameworkLibrary;
  if (!libAccessibilityLibraryCore_frameworkLibrary)
  {
    v9 = xmmword_25174A390;
    v10 = 0;
    v2 = (void *)_sl_dlopen();
    v6[3] = (uint64_t)v2;
    libAccessibilityLibraryCore_frameworkLibrary = (uint64_t)v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
  {
    v4 = (void *)abort_report_np();
    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "_AXSAttentionAwarenessFeaturesEnabled");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  get_AXSAttentionAwarenessFeaturesEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
