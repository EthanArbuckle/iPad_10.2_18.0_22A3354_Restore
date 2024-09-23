@implementation UIPreferredSystemLanguageForBundle

void ___UIPreferredSystemLanguageForBundle_block_invoke(uint64_t a1)
{
  const __CFString *v1;
  const __CFArray *v2;
  const __CFArray *v3;
  CFArrayRef v4;
  uint64_t v5;
  void *v6;
  const __CFArray *locArray;

  objc_msgSend(*(id *)(a1 + 32), "localizations");
  locArray = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v1 = (const __CFString *)*MEMORY[0x1E0C9B248];
  if (CFPreferencesAppValueIsForced(CFSTR("AppleLanguages"), (CFStringRef)*MEMORY[0x1E0C9B248]))
    v2 = (const __CFArray *)CFPreferencesCopyAppValue(CFSTR("AppleLanguages"), v1);
  else
    v2 = (const __CFArray *)CFPreferencesCopyValue(CFSTR("AppleLanguages"), (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v3 = v2;
  if (v2)
  {
    v4 = CFBundleCopyLocalizationsForPreferences(locArray, v2);
    -[__CFArray firstObject](v4, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)_UIPreferredSystemLanguageForBundle_primaryLanguage;
    _UIPreferredSystemLanguageForBundle_primaryLanguage = v5;

  }
}

@end
