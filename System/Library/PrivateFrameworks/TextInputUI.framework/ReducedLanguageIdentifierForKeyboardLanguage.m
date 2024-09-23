@implementation ReducedLanguageIdentifierForKeyboardLanguage

void ___ReducedLanguageIdentifierForKeyboardLanguage_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v1 = (void *)_ReducedLanguageIdentifierForKeyboardLanguage___languageCounts;
  _ReducedLanguageIdentifierForKeyboardLanguage___languageCounts = (uint64_t)v0;

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  UIKeyboardGetSupportedLanguages();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = (void *)_ReducedLanguageIdentifierForKeyboardLanguage___languageCounts;
        objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

@end
