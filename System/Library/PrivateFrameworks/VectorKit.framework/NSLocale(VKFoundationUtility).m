@implementation NSLocale(VKFoundationUtility)

+ (uint64_t)_vk_indexForLocale:()VKFoundationUtility
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  if (v3)
  {
    if (+[NSLocale(VKFoundationUtility) _vk_indexForLocale:]::onceToken != -1)
      dispatch_once(&+[NSLocale(VKFoundationUtility) _vk_indexForLocale:]::onceToken, &__block_literal_global_15131);
    v4 = (void *)+[NSLocale(VKFoundationUtility) _vk_indexForLocale:]::__localeIdentifiers;
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C997E0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "indexOfObject:", v5);

  }
  else
  {
    v6 = -1;
  }

  return v6;
}

@end
