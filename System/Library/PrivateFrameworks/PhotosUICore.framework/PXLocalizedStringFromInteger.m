@implementation PXLocalizedStringFromInteger

uint64_t __PXLocalizedStringFromInteger_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)PXLocalizedStringFromInteger_decimalCountFormatter;
  PXLocalizedStringFromInteger_decimalCountFormatter = (uint64_t)v0;

  v2 = (void *)PXLocalizedStringFromInteger_decimalCountFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend((id)PXLocalizedStringFromInteger_decimalCountFormatter, "setGeneratesDecimalNumbers:", 1);
  return objc_msgSend((id)PXLocalizedStringFromInteger_decimalCountFormatter, "setNumberStyle:", 1);
}

@end
