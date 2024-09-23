@implementation SILanguagesGetLocale

CFLocaleRef __SILanguagesGetLocale_block_invoke(CFLocaleRef result)
{
  uint64_t v1;
  CFLocaleRef v2;

  v1 = *((unsigned int *)result + 8);
  if ((v1 - 1) <= 0x39)
  {
    v2 = result;
    result = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], gLanguageTags[v1]);
    SILanguagesGetLocale::gLocales[*((unsigned int *)v2 + 8)] = result;
  }
  return result;
}

@end
