@implementation VSSpeechSynthesizerPreference

+ (id)availableLanguages
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VSSpeechSynthesizerPreference_availableLanguages__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (availableLanguages_onceToken != -1)
    dispatch_once(&availableLanguages_onceToken, block);
  return (id)availableLanguages__availableLanguages;
}

+ (id)fallbackLanguageForLanguage:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD block[5];

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "availableLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    v7 = v4;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__VSSpeechSynthesizerPreference_fallbackLanguageForLanguage___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (fallbackLanguageForLanguage__onceToken != -1)
      dispatch_once(&fallbackLanguageForLanguage__onceToken, block);
    objc_msgSend((id)fallbackLanguageForLanguage__fallbacks, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v11 = objc_msgSend(v4, "rangeOfString:", CFSTR("-"));
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v4, "substringWithRange:", 0, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend((id)fallbackLanguageForLanguage__fallbacks, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend((id)fallbackLanguageForLanguage__fallbacks, "objectForKeyedSubscript:", v12);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_8;
          }
        }

      }
      v9 = CFSTR("en-US");
      goto LABEL_8;
    }
    objc_msgSend((id)fallbackLanguageForLanguage__fallbacks, "objectForKeyedSubscript:", v4);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;
LABEL_8:

  return v9;
}

void __61__VSSpeechSynthesizerPreference_fallbackLanguageForLanguage___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("tts_language_fallbacks"), CFSTR("plist"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)fallbackLanguageForLanguage__fallbacks;
  fallbackLanguageForLanguage__fallbacks = v1;

}

void __51__VSSpeechSynthesizerPreference_availableLanguages__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("tts_languages"), CFSTR("plist"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfFile:", v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)availableLanguages__availableLanguages;
  availableLanguages__availableLanguages = v2;

}

@end
