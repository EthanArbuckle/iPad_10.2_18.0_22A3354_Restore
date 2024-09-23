@implementation NSUserDefaults(WebNSUserDefaultsExtras)

+ (const)_webkit_preferredLanguageCode
{
  StringImpl *v0;
  uint64_t v1;
  WTF::StringImpl *v3;

  WTF::defaultLanguage();
  if (!v3)
    return &stru_1E9D6EC48;
  v1 = WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v3 == 2)
  {
    WTF::StringImpl::destroy(v3, v0);
    return (const __CFString *)v1;
  }
  else
  {
    *(_DWORD *)v3 -= 2;
    return (const __CFString *)v1;
  }
}

@end
