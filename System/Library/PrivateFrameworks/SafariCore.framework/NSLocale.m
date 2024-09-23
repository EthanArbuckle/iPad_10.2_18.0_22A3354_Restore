@implementation NSLocale

void __81__NSLocale_WBSNSLocaleExtras__safari_localeIdentifiersForMostWidelyUsedLanguages__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E64D1190);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)safari_localeIdentifiersForMostWidelyUsedLanguages_identifiers;
  safari_localeIdentifiersForMostWidelyUsedLanguages_identifiers = v0;

}

@end
