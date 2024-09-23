@implementation NSLocale

void __52__NSLocale_VKFoundationUtility___vk_indexForLocale___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99DC8], "availableLocaleIdentifiers");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[NSLocale(VKFoundationUtility) _vk_indexForLocale:]::__localeIdentifiers;
  +[NSLocale(VKFoundationUtility) _vk_indexForLocale:]::__localeIdentifiers = v0;

}

@end
