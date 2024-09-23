@implementation ICLocalizationUtilities

+ (BOOL)supportsRTL
{
  if (supportsRTL_onceToken != -1)
    dispatch_once(&supportsRTL_onceToken, &__block_literal_global_69);
  return supportsRTL_sCachedSupportsRTL;
}

void __38__ICLocalizationUtilities_supportsRTL__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  supportsRTL_sCachedSupportsRTL = ICAnyInputLanguagePassesBlock(&__block_literal_global_27_0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0DC5528];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_3_0);

}

BOOL __38__ICLocalizationUtilities_supportsRTL__block_invoke_2()
{
  _BOOL8 result;

  result = ICAnyInputLanguagePassesBlock(&__block_literal_global_27_0);
  supportsRTL_sCachedSupportsRTL = result;
  return result;
}

+ (BOOL)isArabic
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "hasPrefix:", CFSTR("ar"));
  return (char)v2;
}

@end
