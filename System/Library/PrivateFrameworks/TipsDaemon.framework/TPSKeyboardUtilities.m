@implementation TPSKeyboardUtilities

+ (id)enabledDictationLanguages
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard.preferences"));
  objc_msgSend(v2, "objectForKey:", CFSTR("DictationLanguagesEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

+ (BOOL)isDictationEnabled
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.assistant.support"));
  objc_msgSend(v2, "objectForKey:", CFSTR("Dictation Enabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (BOOL)isDictationSelectedForLanguage:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "enabledDictationLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "TPSSafeBoolForKey:", v3);

  return v5;
}

+ (id)installedInputModes
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("AppleKeyboards"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)isHandwritingEnabledForInputMode:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a1, "_variantForInputMode:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("HWR"));

  return v4;
}

+ (BOOL)isInputModeInstalledForLanguage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[TPSKeyboardUtilities installedInputModes](TPSKeyboardUtilities, "installedInputModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "hasPrefix:", v3, (_QWORD)v10) & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)isExtendedSuggestionSupportedForInputMode:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v18;

  v3 = a3;
  if (isExtendedSuggestionSupportedForInputMode__onceToken != -1)
    dispatch_once(&isExtendedSuggestionSupportedForInputMode__onceToken, &__block_literal_global_5);
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("([a-zA-Z0-9]+)(_\\w+)?(-\\w+)?(@.*)?"), 1, &v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v18;
  objc_msgSend(v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "numberOfRanges") == 5)
  {
    v8 = objc_msgSend(v7, "rangeAtIndex:", 1);
    v10 = v9;
    v11 = objc_msgSend(v7, "rangeAtIndex:", 3);
    v13 = v12;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(v3, "substringWithRange:", v8, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = 0;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL && v13 >= 2)
    {
      objc_msgSend(v3, "substringWithRange:", v11 + 1, v13 - 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v14
      && objc_msgSend((id)isExtendedSuggestionSupportedForInputMode__supportedLanguages, "containsObject:", v14)&& !objc_msgSend(v15, "isEqualToString:", CFSTR("HWR"))|| objc_msgSend(v14, "isEqualToString:", CFSTR("hi"))&& !objc_msgSend(v15, "caseInsensitiveCompare:", CFSTR("translit")))
    {
      v16 = 1;
      goto LABEL_9;
    }
  }
  else
  {
    v15 = 0;
    v14 = 0;
  }
  v16 = 0;
LABEL_9:

  return v16;
}

void __66__TPSKeyboardUtilities_isExtendedSuggestionSupportedForInputMode___block_invoke()
{
  void *v0;

  v0 = (void *)isExtendedSuggestionSupportedForInputMode__supportedLanguages;
  isExtendedSuggestionSupportedForInputMode__supportedLanguages = (uint64_t)&unk_1EA1F0A88;

}

+ (id)_variantForInputMode:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("-"), 2);
  v5 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("@"), 2);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = objc_msgSend(v3, "length");
  v6 = 0;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL && v4 < v5)
  {
    objc_msgSend(v3, "substringWithRange:", v4 + 1, v5 - (v4 + 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (BOOL)isAutoCorrectionEnabled
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard.preferences"));
  objc_msgSend(v2, "objectForKey:", CFSTR("KeyboardAutocorrection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = objc_msgSend(v3, "BOOLValue");
    else
      v4 = 0;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (BOOL)hasCustomizedKeyboard
{
  void *v2;
  BOOL v3;

  objc_msgSend(a1, "installedInputModes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

@end
