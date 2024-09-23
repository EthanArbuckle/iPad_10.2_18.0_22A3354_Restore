@implementation NSNumberFormatter

uint64_t __72__NSNumberFormatter_SBFCacheInstances__sbf_cachedDecimalNumberFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)sbf_cachedDecimalNumberFormatter__cachedDecimalNumberFormatter;
  sbf_cachedDecimalNumberFormatter__cachedDecimalNumberFormatter = (uint64_t)v0;

  v2 = (void *)sbf_cachedDecimalNumberFormatter__cachedDecimalNumberFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  return objc_msgSend((id)sbf_cachedDecimalNumberFormatter__cachedDecimalNumberFormatter, "setNumberStyle:", 1);
}

@end
