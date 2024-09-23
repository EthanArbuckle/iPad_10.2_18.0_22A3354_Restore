@implementation PLSharedCountFormatter

uint64_t __PLSharedCountFormatter_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)PLSharedCountFormatter_sharedCountFormatter;
  PLSharedCountFormatter_sharedCountFormatter = (uint64_t)v0;

  v2 = (void *)PLSharedCountFormatter_sharedCountFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend((id)PLSharedCountFormatter_sharedCountFormatter, "setGeneratesDecimalNumbers:", 1);
  return objc_msgSend((id)PLSharedCountFormatter_sharedCountFormatter, "setNumberStyle:", 1);
}

@end
