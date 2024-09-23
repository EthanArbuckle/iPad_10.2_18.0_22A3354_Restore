@implementation NSNumber(VideosUI)

- (id)vui_languageAwareDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "descriptionWithLocale:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(v2, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "characterDirectionForLanguage:", v5);

  if (v6 == 2)
    v7 = CFSTR("\u200F");
  else
    v7 = CFSTR("\u200E");
  objc_msgSend(v3, "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
