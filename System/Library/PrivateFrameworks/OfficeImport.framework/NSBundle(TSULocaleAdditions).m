@implementation NSBundle(TSULocaleAdditions)

- (id)localizedStringForKey:()TSULocaleAdditions value:table:locale:
{
  void *v8;
  uint64_t v9;
  CFBundleRef v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDD1488];
  v9 = objc_msgSend(a1, "localizations");
  v13[0] = +[OITSULocale canonicalizeLocaleIdentifierWithLanguageScriptAndRegionOnly:](OITSULocale, "canonicalizeLocaleIdentifierWithLanguageScriptAndRegionOnly:", objc_msgSend(a6, "localeIdentifier"));
  objc_msgSend((id)objc_msgSend(v8, "preferredLocalizationsFromArray:forPreferences:", v9, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1)), "objectAtIndexedSubscript:", 0);
  v10 = CFBundleCreate(0, (CFURLRef)objc_msgSend(a1, "bundleURL"));
  v11 = (void *)CFBundleCopyLocalizedStringForLocalization();
  CFRelease(v10);
  return v11;
}

@end
