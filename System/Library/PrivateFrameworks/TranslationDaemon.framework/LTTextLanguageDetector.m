@implementation LTTextLanguageDetector

uint64_t __56___LTTextLanguageDetector_detectionForStrings_strategy___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

id __48___LTTextLanguageDetector__mapSupportedLocales___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "availableLocales");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _LTLanguageCodeToSupportedLocale();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
