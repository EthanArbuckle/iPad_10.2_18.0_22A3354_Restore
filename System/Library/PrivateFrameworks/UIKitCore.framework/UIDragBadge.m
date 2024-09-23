@implementation UIDragBadge

uint64_t __45___UIDragBadge__updateLabelTextFromItemCount__block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)_MergedGlobals_5_6;
  _MergedGlobals_5_6 = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_5_6, "setLocale:", v2);

  return objc_msgSend((id)_MergedGlobals_5_6, "setNumberStyle:", 1);
}

@end
