@implementation SILocalizationLoad

void __SILocalizationLoad_block_invoke()
{
  const __CFDictionary *OptionsDictionary;

  OptionsDictionary = SIGeneralTrieCreateOptionsDictionary(2, 64, 0, 0, 0);
  sDynamicCache = (uint64_t)SIGeneralTrieCreateMutableWithDictionary(OptionsDictionary);
  if (OptionsDictionary)
    CFRelease(OptionsDictionary);
}

void __SILocalizationLoad_block_invoke_2(uint64_t a1)
{
  update(*(const __CFLocale **)(a1 + 32), *(const __CFDictionary **)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __SILocalizationLoad_block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

@end
