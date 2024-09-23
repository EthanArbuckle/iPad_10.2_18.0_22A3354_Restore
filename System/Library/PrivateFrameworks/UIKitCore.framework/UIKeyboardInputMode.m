@implementation UIKeyboardInputMode

- (NSString)identifier
{
  return self->identifier;
}

+ (id)dictationInputMode
{
  if (qword_1ECD79060 != -1)
    dispatch_once(&qword_1ECD79060, &__block_literal_global_1035);
  return (id)qword_1ECD79058;
}

- (BOOL)isEqual:(id)a3
{
  UIKeyboardInputMode *v4;
  UIKeyboardInputMode *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (UIKeyboardInputMode *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[UIKeyboardInputMode identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardInputMode identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[UIKeyboardInputMode primaryLanguage](self, "primaryLanguage");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardInputMode primaryLanguage](v5, "primaryLanguage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSString)identifierWithLayouts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[UIKeyboardInputMode identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[UIKeyboardInputMode identifier](self, "identifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NSString *)v7;
}

- (NSString)dictationLanguage
{
  UIKeyboardInputMode *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  char v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  char v31;
  id v32;
  void *v33;
  char v34;
  id v35;
  void *v36;
  char v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  UIKeyboardInputMode *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v2 = self;
  v58 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardInputMode languageWithRegion](self, "languageWithRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputMode languageWithRegion](v2, "languageWithRegion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultDictationLanguages:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferencesActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForPreferenceKey:", CFSTR("DictationLanguagesLastUsed"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("LastUsedDictationLangauge"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {
    v12 = v3;
    if (v3)
      goto LABEL_30;
LABEL_25:
    v12 = 0;
    goto LABEL_31;
  }
  v47 = v10;
  -[UIKeyboardInputMode languageWithRegion](v2, "languageWithRegion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isDictationLanguageEnabled:", v12);

    if ((v14 & 1) != 0)
    {
      v10 = v47;
      goto LABEL_30;
    }
  }
  v46 = v9;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "suggestedDictationLanguagesForDeviceLanguage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v53;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v53 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        if (v22)
        {
          if (objc_msgSend(v6, "containsObject:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i)))
          {
            +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isDictationLanguageEnabled:", v22);

            if ((v24 & 1) != 0)
            {
              v25 = v17;
LABEL_28:
              v32 = v22;

              v12 = v32;
              goto LABEL_29;
            }
          }
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      if (v19)
        continue;
      break;
    }
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v25 = v6;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v26)
  {
    v27 = v26;
    v45 = v2;
    v28 = *(_QWORD *)v49;
    while (2)
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v49 != v28)
          objc_enumerationMutation(v25);
        v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isDictationLanguageEnabled:", v22);

        if ((v31 & 1) != 0)
        {
          v2 = v45;
          goto LABEL_28;
        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      if (v27)
        continue;
      break;
    }
    v2 = v45;
  }
LABEL_29:

  v9 = v46;
  v10 = v47;
  if (!v12)
    goto LABEL_25;
LABEL_30:
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isDictationLanguageEnabled:", v12);

  if ((v34 & 1) == 0)
  {
LABEL_31:
    v35 = v10;

    v12 = v35;
    if (!v35)
      goto LABEL_34;
  }
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "isDictationLanguageEnabled:", v12);

  if ((v37 & 1) != 0)
  {
    v38 = v12;
    v39 = v38;
    goto LABEL_38;
  }
LABEL_34:
  v40 = v10;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "enabledDictationLanguages");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "firstObject");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    v38 = v43;
    v39 = v38;
  }
  else
  {
    -[UIKeyboardInputMode languageWithRegion](v2, "languageWithRegion");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v39 = 0;
  }
  v10 = v40;
LABEL_38:

  return (NSString *)v38;
}

- (NSString)languageWithRegion
{
  return self->_languageWithRegion;
}

- (NSString)primaryLanguage
{
  return self->_primaryLanguage;
}

- (BOOL)isExtensionInputMode
{
  return 0;
}

- (BOOL)isSpecializedInputMode
{
  return 0;
}

- (NSString)normalizedIdentifier
{
  return self->normalizedIdentifier;
}

+ (UIKeyboardInputMode)keyboardInputModeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  __objc2_class *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (qword_1ECD79030 != -1)
    dispatch_once(&qword_1ECD79030, &__block_literal_global_1028);
  objc_msgSend((id)qword_1ECD78FC8, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("dictation")))
    {
      objc_msgSend(a1, "dictationInputMode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("autofillsignup")))
    {
      objc_msgSend(a1, "autofillSignupInputMode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "identifierIsValidSystemInputMode:", v4);

      if (v8)
        v9 = UIKeyboardInputMode;
      else
        v9 = UIKeyboardExtensionInputMode;
      v6 = (void *)objc_msgSend([v9 alloc], "initWithIdentifier:", v4);
    }
    v5 = v6;
    if (v6)
    {
      v10 = (void *)qword_1ECD78FC8;
      objc_msgSend(v6, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v5, v11);

    }
    else
    {
      if (v4)
        objc_msgSend((id)qword_1ECD78FC8, "removeObjectForKey:", v4);
      v5 = 0;
    }
  }

  return (UIKeyboardInputMode *)v5;
}

- (void)setIsDisplayed:(BOOL)a3
{
  self->isDisplayed = a3;
}

- (BOOL)isEmojiInputMode
{
  void *v3;
  _BOOL4 v4;

  -[UIKeyboardInputMode primaryLanguage](self, "primaryLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("emoji")))
    v4 = !-[UIKeyboardInputMode isExtensionInputMode](self, "isExtensionInputMode");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)isDefaultRightToLeft
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char IsDefaultRightToLeft;

  if (-[UIKeyboardInputMode isEmojiInputMode](self, "isEmojiInputMode")
    && (+[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController"), v3 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v3, "inputModeThatInvokeEmoji"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v3, v4))
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputModeThatInvokeEmoji");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    IsDefaultRightToLeft = UIKeyboardInputModeIsDefaultRightToLeft(v7);

  }
  else
  {
    -[UIKeyboardInputMode identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    IsDefaultRightToLeft = UIKeyboardInputModeIsDefaultRightToLeft(v5);
  }

  return IsDefaultRightToLeft;
}

- (BOOL)isDisplayed
{
  return self->isDisplayed;
}

- (BOOL)isDesiredForTraits:(id)a3 withExtended:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  char IsSecure;
  BOOL v9;

  v4 = a4;
  v6 = a3;
  -[UIKeyboardInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isSecureTextEntry"))
  {
    IsSecure = UIKeyboardLayoutDefaultTypeForInputModeIsSecure(v7);
LABEL_10:
    v9 = IsSecure;
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "isCarPlayIdiom"))
  {
    IsSecure = _UIKeyboardInputModeDefaultLayoutIsCarPlayEnabled(self);
    goto LABEL_10;
  }
  if (+[UITextInputTraits keyboardTypeRequiresASCIICapable:](UITextInputTraits, "keyboardTypeRequiresASCIICapable:", objc_msgSend(v6, "keyboardType")))
  {
    if (v4)
      IsSecure = UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapableExtended(v7);
    else
      IsSecure = UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable(v7);
    goto LABEL_10;
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)isDesiredForTraits:(id)a3
{
  return -[UIKeyboardInputMode isDesiredForTraits:withExtended:](self, "isDesiredForTraits:withExtended:", a3, 1);
}

void __55__UIKeyboardInputMode_keyboardInputModeWithIdentifier___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)qword_1ECD78FC8;
  qword_1ECD78FC8 = (uint64_t)v0;

}

- (UIKeyboardInputMode)initWithIdentifier:(id)a3
{
  id v4;
  UIKeyboardInputMode *v5;
  UIKeyboardInputMode *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UIKeyboardInputMode;
  v5 = -[UIKeyboardInputMode init](&v18, sel_init);
  v6 = v5;
  if (!v4)
  {
    v16 = v5;
    v6 = 0;
    goto LABEL_7;
  }
  if (!v5)
  {
    v16 = 0;
    goto LABEL_7;
  }
  -[UIKeyboardInputMode setIdentifier:](v5, "setIdentifier:", v4);
  TIInputModeGetNormalizedIdentifier();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputMode setNormalizedIdentifier:](v6, "setNormalizedIdentifier:", v7);

  TIInputModeGetLanguageWithRegion();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputMode setLanguageWithRegion:](v6, "setLanguageWithRegion:", v8);

  TIInputModeGetVariant();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputMode setVariant:](v6, "setVariant:", v9);

  +[UIKeyboardInputMode canonicalLanguageIdentifierFromIdentifier:](UIKeyboardInputMode, "canonicalLanguageIdentifierFromIdentifier:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputMode setPrimaryLanguage:](v6, "setPrimaryLanguage:", v10);

  +[UIKeyboardInputMode softwareLayoutFromIdentifier:](UIKeyboardInputMode, "softwareLayoutFromIdentifier:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputMode setSoftwareLayout:](v6, "setSoftwareLayout:", v11);

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inputModesWithoutHardwareSupport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputMode normalizedIdentifier](v6, "normalizedIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsObject:", v14);

  if ((v15 & 1) == 0)
  {
    +[UIKeyboardInputMode hardwareLayoutFromIdentifier:](UIKeyboardInputMode, "hardwareLayoutFromIdentifier:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardInputMode setHardwareLayout:](v6, "setHardwareLayout:", v16);
LABEL_7:

  }
  return v6;
}

- (void)setVariant:(id)a3
{
  objc_storeStrong((id *)&self->_variant, a3);
}

- (void)setSoftwareLayout:(id)a3
{
  objc_storeStrong((id *)&self->softwareLayout, a3);
}

- (void)setPrimaryLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLanguage, a3);
}

- (void)setNormalizedIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->normalizedIdentifier, a3);
}

- (void)setLanguageWithRegion:(id)a3
{
  objc_storeStrong((id *)&self->_languageWithRegion, a3);
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->identifier, a3);
}

+ (id)softwareLayoutFromIdentifier:(id)a3
{
  void *v3;
  void *v4;

  TIInputModeGetComponentsFromIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("sw"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)canonicalLanguageIdentifierFromIdentifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    TIInputModeGetComponentsFromIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0C997E8];
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0C99820];
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C99820]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0C997B0];
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v6, v5, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8)
      objc_msgSend(v11, "setObject:forKey:", v8, v7);
    if (v10)
      objc_msgSend(v12, "setObject:forKey:", v10, v9);
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)setHardwareLayout:(id)a3
{
  objc_storeStrong((id *)&self->hardwareLayout, a3);
}

+ (id)hardwareLayoutFromIdentifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  TIInputModeGetComponentsFromIdentifier();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("hw"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (__CFString *)v5;
  }
  else
  {
    UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v3);
    v7 = objc_claimAutoreleasedReturnValue();

    TIInputModeGetComponentsFromIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKey:", CFSTR("hw"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
      v6 = (__CFString *)v9;
    else
      v6 = CFSTR("US");
    v3 = (id)v7;
    v4 = v8;
  }

  return v6;
}

- (void)setMultilingualLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_multilingualLanguages, a3);
}

- (BOOL)isAllowedForTraits:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  char v9;
  void *v10;
  unsigned int v11;
  int v12;
  char v13;
  BOOL v14;

  v5 = a3;
  -[UIKeyboardInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("emoji")))
  {
    if (!-[UIKeyboardInputMode isHandwritingInputMode](self, "isHandwritingInputMode"))
      goto LABEL_12;
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "keyboardType") == 2 || objc_msgSend(v5, "keyboardType") == 123)
    goto LABEL_4;
  v11 = objc_msgSend(v5, "keyboardType");
  v7 = 0;
  if ((v11 > 0xB || ((1 << v11) & 0x930) == 0) && v11 != 127)
  {
    if (objc_msgSend(v5, "keyboardType") == 13)
    {
LABEL_4:
      v7 = 0;
      goto LABEL_5;
    }
    if (+[UIKeyboard isMajelEnabled](UIKeyboard, "isMajelEnabled")
      && objc_msgSend(v5, "forceFloatingKeyboard"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "_shouldSuppressAssistantBar"))
      {
        v7 = 0;
LABEL_45:

        goto LABEL_5;
      }
      v12 = 1;
    }
    else
    {
      v12 = 0;
    }
    if (_UIApplicationIsStickerPickerService())
      v7 = objc_msgSend(v5, "keyboardType") == 124;
    else
      v7 = 1;
    if (v12)
      goto LABEL_45;
  }
LABEL_5:
  if (-[UIKeyboardInputMode isHandwritingInputMode](self, "isHandwritingInputMode"))
  {
LABEL_9:
    if ((objc_msgSend(v5, "disableHandwritingKeyboard") & 1) != 0)
      goto LABEL_35;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_shouldSuppressSoftwareKeyboardByOneness");

    if ((v9 & 1) != 0
      || !+[UIKeyboardVisualModeManager softwareKeyboardAllowedForActiveKeyboardSceneDelegate](UIKeyboardVisualModeManager, "softwareKeyboardAllowedForActiveKeyboardSceneDelegate"))
    {
      goto LABEL_35;
    }
    goto LABEL_12;
  }
  if (!v7)
  {
LABEL_35:
    v14 = 0;
    goto LABEL_36;
  }
LABEL_12:
  if (objc_msgSend(v5, "isSecureTextEntry") && !UIKeyboardLayoutDefaultTypeForInputModeIsSecure(v6)
    || objc_msgSend(v5, "isCarPlayIdiom")
    && !_UIKeyboardInputModeDefaultLayoutIsCarPlayEnabled(self)
    || (objc_msgSend(v5, "keyboardType") == 1
     || objc_msgSend(v5, "keyboardType") == 11
     || objc_msgSend(v5, "keyboardType") == 127)
    && !UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapableExtended(v6))
  {
    goto LABEL_35;
  }
  if (objc_msgSend(v5, "keyboardType") == 4)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "userInterfaceIdiom"))
    {

    }
    else
    {
      v13 = dyld_program_sdk_at_least();

      if ((v13 & 1) == 0 && !UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapableExtended(v6))
        goto LABEL_35;
    }
  }
  v14 = objc_msgSend(v5, "keyboardType") != 122
     || -[UIKeyboardInputMode supportsEmojiSearch](self, "supportsEmojiSearch");
LABEL_36:

  return v14;
}

- (BOOL)isHandwritingInputMode
{
  void *v2;
  char v3;

  -[UIKeyboardInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSuffix:", CFSTR("HWR"));

  return v3;
}

+ (id)intlInputMode
{
  if (qword_1ECD79040 != -1)
    dispatch_once(&qword_1ECD79040, &__block_literal_global_1030);
  return (id)qword_1ECD79038;
}

- (NSArray)multilingualLanguages
{
  return self->_multilingualLanguages;
}

void __41__UIKeyboardInputMode_dictationInputMode__block_invoke()
{
  UIDictationInputMode *v0;
  void *v1;

  v0 = -[UIKeyboardInputMode initWithIdentifier:]([UIDictationInputMode alloc], "initWithIdentifier:", CFSTR("dictation"));
  v1 = (void *)qword_1ECD79058;
  qword_1ECD79058 = (uint64_t)v0;

}

void __36__UIKeyboardInputMode_intlInputMode__block_invoke()
{
  UIKeyboardInputMode *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [UIKeyboardInputMode alloc];
  UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(CFSTR("intl"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIKeyboardInputMode initWithIdentifier:](v0, "initWithIdentifier:", v3);
  v2 = (void *)qword_1ECD79038;
  qword_1ECD79038 = v1;

}

- (void)dealloc
{
  NSString *primaryLanguage;
  NSString *languageWithRegion;
  NSArray *multilingualLanguages;
  UIImage *cachedIcon;
  void *v7;
  NSString *cachedSizeCategory;
  objc_super v9;

  -[UIKeyboardInputMode setIdentifier:](self, "setIdentifier:", 0);
  -[UIKeyboardInputMode setNormalizedIdentifier:](self, "setNormalizedIdentifier:", 0);
  primaryLanguage = self->_primaryLanguage;
  self->_primaryLanguage = 0;

  languageWithRegion = self->_languageWithRegion;
  self->_languageWithRegion = 0;

  multilingualLanguages = self->_multilingualLanguages;
  self->_multilingualLanguages = 0;

  -[UIKeyboardInputMode setSoftwareLayout:](self, "setSoftwareLayout:", 0);
  -[UIKeyboardInputMode setHardwareLayout:](self, "setHardwareLayout:", 0);
  cachedIcon = self->_cachedIcon;
  if (cachedIcon)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0DBE478], 0);

    cachedIcon = self->_cachedIcon;
  }
  self->_cachedIcon = 0;

  cachedSizeCategory = self->_cachedSizeCategory;
  self->_cachedSizeCategory = 0;

  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardInputMode;
  -[UIKeyboardInputMode dealloc](&v9, sel_dealloc);
}

- (void)preferencesControllerChanged:(id)a3
{
  -[UIKeyboardInputMode setCachedIcon:](self, "setCachedIcon:", 0);
}

- (void)setCachedIcon:(id)a3
{
  _BOOL4 v5;
  UIImage *cachedIcon;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = self->_cachedIcon == 0;
  objc_storeStrong((id *)&self->_cachedIcon, a3);
  cachedIcon = self->_cachedIcon;
  if (((v5 ^ (cachedIcon != 0)) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (cachedIcon)
      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_preferencesControllerChanged_, *MEMORY[0x1E0DBE478], 0);
    else
      objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0DBE478], 0);

  }
}

+ (id)autofillSignupInputMode
{
  if (qword_1ECD79050 != -1)
    dispatch_once(&qword_1ECD79050, &__block_literal_global_1031);
  return (id)qword_1ECD79048;
}

uint64_t __46__UIKeyboardInputMode_autofillSignupInputMode__block_invoke()
{
  UISpecializedInputMode *v0;
  void *v1;
  void *v3;
  void *v4;
  void *v5;

  v0 = -[UIKeyboardInputMode initWithIdentifier:]([UISpecializedInputMode alloc], "initWithIdentifier:", CFSTR("autofillsignup"));
  v1 = (void *)qword_1ECD79048;
  qword_1ECD79048 = (uint64_t)v0;

  if (!qword_1ECD79098)
    qword_1ECD79098 = _sl_dlopen();
  if (!qword_1ECD79098)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SafariServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("UIKeyboardInputModeController.m"), 113, CFSTR("%s"), 0);

    __break(1u);
    free(v5);
  }
  return objc_msgSend((id)qword_1ECD79048, "setViewControllerClass:", NSClassFromString(CFSTR("_SFAutomaticPasswordInputViewController")));
}

- (NSArray)normalizedIdentifierLevels
{
  void *v2;
  void *v3;
  void *v4;

  -[UIKeyboardInputMode identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetComponentsFromIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  TIInputModeGetNormalizedLevelsFromComponents();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UIKeyboardInputMode identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[UIKeyboardInputMode primaryLanguage](self, "primaryLanguage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("primaryLanguage"));

}

- (UIKeyboardInputMode)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  UIKeyboardInputMode *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIKeyboardInputMode initWithIdentifier:](self, "initWithIdentifier:", v5);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryLanguage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKeyboardInputMode primaryLanguage](v6, "primaryLanguage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", v7);

    if ((v9 & 1) == 0)
      -[UIKeyboardInputMode setPrimaryLanguage:](v6, "setPrimaryLanguage:", v7);
  }

  return v6;
}

- (BOOL)showSWLayoutWithHWKeyboard
{
  void *v2;
  BOOL v3;

  -[UIKeyboardInputMode hardwareLayout](self, "hardwareLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (NSString)monolingualDisplayName
{
  void *v2;
  void *v3;

  -[UIKeyboardInputMode identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardLocalizedInputModeName(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)_displayNameForMultilingualSet:(id)a3 forDisplayInLists:(BOOL)a4 usingDeviceLanguage:(BOOL)a5
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  int IsKoreanEnglishBilingual;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _BOOL4 v55;
  id v56;
  _BOOL4 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v57 = a5;
  v5 = a4;
  v68 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  if (objc_msgSend(v56, "count") != 1
    || (objc_msgSend(v56, "firstObject"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v6), v7 = (void *)objc_claimAutoreleasedReturnValue(), IsKoreanEnglishBilingual = UIKeyboardInputModeIsKoreanEnglishBilingual(v7), v7, v6, !IsKoreanEnglishBilingual))
  {
    v55 = v5;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "enabledInputModeIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v63 != v16)
            objc_enumerationMutation(v13);
          TIInputModeGetLanguage();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          TIInputModeGetNormalizedIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, v18);
          }
          objc_msgSend(v20, "addObject:", v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      }
      while (v15);
    }

    objc_msgSend(v56, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages();
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v25 = v23;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v59 != v28)
            objc_enumerationMutation(v25);
          if ((TIInputModeIsMultilingualOnly() & 1) == 0)
          {
            TIInputModeGetLanguage();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectForKeyedSubscript:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "count");

            if (v32 >= 2)
            {
              TIInputModeGetLanguageWithRegion();
              v33 = objc_claimAutoreleasedReturnValue();

              v30 = (void *)v33;
            }
            v34 = (void *)MEMORY[0x1E0C99DC8];
            if (v57)
            {
              objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "localeWithLocaleIdentifier:", v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v30);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v36, "localizedStringForLanguage:context:", v30, 3);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v37);

          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      }
      while (v27);
    }

    if (v57)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v55)
      {
LABEL_30:
        v39 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setLocale:", v40);

        objc_msgSend(v39, "stringFromItems:", v24);
        v41 = objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
    }
    else
    {
      objc_msgSend(v25, "firstObject");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      TIInputModeGetLanguageWithRegion();
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v55)
        goto LABEL_30;
    }
    if (objc_msgSend(v24, "count") == 2)
    {
      v43 = (void *)MEMORY[0x1E0CB3940];
      _UILocalizedStringWithDefaultValueInLanguage(CFSTR("%@ & %@"), v38, CFSTR("%@ & %@"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "localizedStringWithFormat:", v39, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_36:
      goto LABEL_44;
    }
    _UILocalizedStringWithDefaultValueInLanguage(CFSTR(", "), v38, CFSTR(", "));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "componentsJoinedByString:", v39);
    v41 = objc_claimAutoreleasedReturnValue();
LABEL_35:
    v46 = (void *)v41;
    goto LABEL_36;
  }
  v9 = (void *)MEMORY[0x1E0C99DC8];
  if (v57)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = CFSTR("ko");
  }
  objc_msgSend(v9, "localeWithLocaleIdentifier:", v10);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "localizedStringForLanguage:context:", CFSTR("ko"), 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {

    v48 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
    v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v48 = (void *)MEMORY[0x1E0C99DC8];
    v49 = CFSTR("en");
  }
  objc_msgSend(v48, "localeWithLocaleIdentifier:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "localizedStringForLanguage:context:", CFSTR("en"), 3);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  v52 = (void *)MEMORY[0x1E0CB3940];
  _UINSLocalizedStringWithDefaultValue(CFSTR("%@ & %@"), CFSTR("%@ & %@"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "localizedStringWithFormat:", v53, v11, v51);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_44:
  return v46;
}

- (NSString)displayName
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    -[UIKeyboardInputMode multilingualInputModeIdentifiers](self, "multilingualInputModeIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v3, "count") >= 2)
    {
      objc_msgSend((id)objc_opt_class(), "_displayNameForMultilingualSet:forDisplayInLists:usingDeviceLanguage:", v3, 1, 0);
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v8 = (void *)v4;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
  }
  if (!UIKeyboardInputModeIsKoreanEnglishBilingual(self))
  {
    -[UIKeyboardInputMode monolingualDisplayName](self, "monolingualDisplayName");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v5 = (void *)objc_opt_class();
  -[UIKeyboardInputMode identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_displayNameForMultilingualSet:forDisplayInLists:usingDeviceLanguage:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return (NSString *)v8;
}

- (NSLocale)locale
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!_os_feature_enabled_impl())
    goto LABEL_13;
  -[UIKeyboardInputMode multilingualInputModeIdentifiers](self, "multilingualInputModeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {

LABEL_13:
    -[UIKeyboardInputMode normalizedIdentifier](self, "normalizedIdentifier", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        TIInputModeGetNormalizedIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10, v15);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "preferredLocalizationsFromArray:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_13;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v12, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSLocale *)v13;
}

- (BOOL)defaultLayoutIsASCIICapable
{
  void *v2;
  char IsASCIICapable;

  -[UIKeyboardInputMode identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsASCIICapable = UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable(v2);

  return IsASCIICapable;
}

- (NSString)automaticHardwareLayout
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UIKeyboardInputMode hardwareLayout](self, "hardwareLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Automatic")))
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hardwareLayoutToUseForInputMode:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = v5;

      v3 = v6;
    }

  }
  return (NSString *)v3;
}

- (BOOL)isStalledExtensionInputMode
{
  return 0;
}

- (NSExtension)extension
{
  return 0;
}

- (NSBundle)containingBundle
{
  return 0;
}

- (NSString)containingBundleDisplayName
{
  return 0;
}

- (BOOL)includeBarHeight
{
  return 0;
}

- (BOOL)supportsEmojiSearch
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (-[UIKeyboardInputMode isExtensionInputMode](self, "isExtensionInputMode"))
    return 0;
  v4 = (void *)MEMORY[0x1E0C99DC8];
  -[UIKeyboardInputMode primaryLanguage](self, "primaryLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeWithLocaleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v7 = (void *)qword_1ECD790A0;
  v14 = qword_1ECD790A0;
  if (!qword_1ECD790A0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getEMFEmojiSearchEngineClass_block_invoke;
    v10[3] = &unk_1E16B14C0;
    v10[4] = &v11;
    __getEMFEmojiSearchEngineClass_block_invoke((uint64_t)v10);
    v7 = (void *)v12[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v11, 8);
  v3 = objc_msgSend(v8, "isLocaleSupported:", v6);

  return v3;
}

- (NSString)dictationDisplayName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[UIKeyboardInputMode dictationLanguage](self, "dictationLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardLocalizedDictationDisplayName(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[UIKeyboardInputMode extendedDisplayName](self, "extendedDisplayName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NSString *)v7;
}

- (NSString)defaultDictationLanguage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardInputMode languageWithRegion](self, "languageWithRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputMode languageWithRegion](self, "languageWithRegion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultDictationLanguages:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suggestedDictationLanguagesForDeviceLanguage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
          if (v14
            && (objc_msgSend(v6, "containsObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), (_QWORD)v17) & 1) != 0)
          {
            v15 = v14;

            v3 = v9;
            goto LABEL_13;
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          continue;
        break;
      }
    }

    objc_msgSend(v6, "firstObject");
    v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

    v3 = v15;
  }

  return (NSString *)v3;
}

- (void)setDictationLanguage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputMode languageWithRegion](self, "languageWithRegion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultDictationLanguages:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "containsObject:", v14))
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferencesActions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForPreferenceKey:", CFSTR("DictationLanguagesLastUsed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "mutableCopy");

    if (!v10)
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[UIKeyboardInputMode languageWithRegion](self, "languageWithRegion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v14, v11);

    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferencesActions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLastUsedDictationLanguages:", v10);

  }
}

- (void)setLastUsedDictationLanguage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  -[UIKeyboardInputMode dictationLanguage](self, "dictationLanguage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v9 = v2;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferencesActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForPreferenceKey:", CFSTR("DictationLanguagesLastUsed"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "mutableCopy");

    if (!v6)
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("LastUsedDictationLangauge"));
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferencesActions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLastUsedDictationLanguages:", v6);

    v2 = v9;
  }

}

- (id)indicatorIcon
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;

  +[_UIKeyboardInputModeIconConfiguration defaultConfiguration](_UIKeyboardInputModeIconConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[UIKeyboard isLanguageIndicatorEnabled](UIKeyboard, "isLanguageIndicatorEnabled"))
    objc_msgSend(v3, "setSize:", 27.0, 20.0);
  -[UIKeyboardInputMode languageIndicatorScale](self, "languageIndicatorScale");
  v5 = v4;
  objc_msgSend(v3, "scaleFactor");
  objc_msgSend(v3, "setScaleFactor:", v5 * v6);
  -[UIKeyboardInputMode _indicatorIconWithConfiguration:](self, "_indicatorIconWithConfiguration:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)indicatorTextIcon
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;

  +[_UIKeyboardInputModeIconConfiguration defaultConfiguration](_UIKeyboardInputModeIconConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackground:", 0);
  -[UIKeyboardInputMode languageIndicatorScale](self, "languageIndicatorScale");
  v5 = v4;
  objc_msgSend(v3, "scaleFactor");
  objc_msgSend(v3, "setScaleFactor:", v5 * v6);
  -[UIKeyboardInputMode _indicatorIconWithConfiguration:](self, "_indicatorIconWithConfiguration:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)cursorAccessoryIcon
{
  void *v3;
  double v4;
  void *v5;

  +[_UIKeyboardInputModeIconConfiguration defaultConfiguration](_UIKeyboardInputModeIconConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackground:", 0);
  +[_UICursorAccessoryView defaultItemSize](_UICursorAccessoryView, "defaultItemSize");
  objc_msgSend(v3, "setSize:", v4 + -6.0);
  objc_msgSend(v3, "setWeight:", 6);
  -[UIKeyboardInputMode _indicatorIconWithConfiguration:](self, "_indicatorIconWithConfiguration:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)largeCursorAccessoryIcon
{
  void *v3;
  double v4;
  void *v5;

  +[_UIKeyboardInputModeIconConfiguration defaultConfiguration](_UIKeyboardInputModeIconConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackground:", 0);
  +[_UICursorAccessoryView largeItemSize](_UICursorAccessoryView, "largeItemSize");
  objc_msgSend(v3, "setSize:", v4 + -6.0);
  objc_msgSend(v3, "setWeight:", 6);
  -[UIKeyboardInputMode _indicatorIconWithConfiguration:](self, "_indicatorIconWithConfiguration:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_iconLabelWithinMultiscriptSet
{
  void *v3;
  id v4;
  id v6;

  v6 = 0;
  -[UIKeyboardInputMode multiscriptInputModeIdentifiers](self, "multiscriptInputModeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputMode _getIconLabel:secondaryIconLabel:artwork:inputModes:](self, "_getIconLabel:secondaryIconLabel:artwork:inputModes:", &v6, 0, 0, v3);
  v4 = v6;

  return v4;
}

- (id)_iconLabelForMultilingualSet
{
  void *v3;
  char IsTransliteration;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsTransliteration = TIInputModeIsTransliteration();

  if ((IsTransliteration & 1) != 0)
    return 0;
  if ((UIKeyboardCurrentInputModeIsKoreanEnglishBilingual() & 1) != 0)
    return CFSTR("한 A");
  -[UIKeyboardInputMode multilingualSet](self, "multilingualSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v18 = 0;
  }
  else
  {
    -[UIKeyboardInputMode multilingualInputModeIdentifiers](self, "multilingualInputModeIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v14, "normalizedIdentifier", v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = TIInputModeIsTransliteration();

          if ((v16 & 1) == 0)
          {
            v20 = 0;
            objc_msgSend(v14, "_getIconLabel:secondaryIconLabel:artwork:inputModes:", &v20, 0, 0, v7);
            v17 = v20;
            if (objc_msgSend(v17, "length"))
              objc_msgSend(v8, "addObject:", v17);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

- (id)_fallbackIconLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  int v14;

  -[UIKeyboardInputMode identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardLocalizedString(CFSTR("UI-ABC"), v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_firstGrapheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqual:", CFSTR("A")))
  {

    v5 = 0;
  }
  -[UIKeyboardInputMode primaryLanguage](self, "primaryLanguage");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "cStringUsingEncoding:", 4);
  uscript_getCode();
  if (v14 != 25 && v14 != 8)
    goto LABEL_4;
  -[UIKeyboardInputMode primaryLanguage](self, "primaryLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "length") >= 3)
  {
    objc_msgSend(v8, "substringToIndex:", 2);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  objc_msgSend(v8, "uppercaseString");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_4:
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[UIKeyboardInputMode identifier](self, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      UIKeyboardLocalizedInputModeName(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_firstGrapheme");
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v12 = v7;

  return v12;
}

- (void)_getIconLabel:(id *)a3 secondaryIconLabel:(id *)a4
{
  -[UIKeyboardInputMode _getIconLabel:secondaryIconLabel:artwork:](self, "_getIconLabel:secondaryIconLabel:artwork:", a3, a4, 0);
}

- (void)_getIconLabel:(id *)a3 secondaryIconLabel:(id *)a4 artwork:(id *)a5
{
  id v9;

  UIKeyboardGetActiveUniqueInputModesForHardwareKeyboard();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputMode _getIconLabel:secondaryIconLabel:artwork:inputModes:](self, "_getIconLabel:secondaryIconLabel:artwork:inputModes:", a3, a4, a5, v9);

}

- (void)_getIconLabel:(id *)a3 secondaryIconLabel:(id *)a4 artwork:(id *)a5 inputModes:(id)a6
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  BOOL v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id *v28;
  void *v29;
  id v30;
  id *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  UIKeyboardInputMode *v43;
  void *v44;
  id v45;
  id *v46;
  id *v47;
  uint64_t v48;
  id v49;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v8 = a6;
  v43 = self;
  -[UIKeyboardInputMode identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardLocalizedObject(CFSTR("UI-IconLabel"), v9, 0, 0, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  UIKeyboardLocalizedObject(CFSTR("UI-IconLabelScript"), v9, 0, 0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  UIKeyboardLocalizedObject(CFSTR("UI-IconLabelLanguage"), v9, 0, 0, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  UIKeyboardLocalizedObject(CFSTR("UI-IconLabelLanguageVariant"), v9, 0, 0, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  UIKeyboardLocalizedObject(CFSTR("UI-IconArtworkShort"), v9, 0, 0, 0);
  v48 = objc_claimAutoreleasedReturnValue();
  UIKeyboardLocalizedObject(CFSTR("UI-IconArtworkFull"), v9, 0, 0, 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v8;
  v54 = (void *)v12;
  v55 = (void *)v11;
  if (v11)
    v14 = 0;
  else
    v14 = v12 == 0;
  v15 = (void *)v13;
  v16 = v14 && v13 == 0;
  v56 = v9;
  if (v16)
  {
    v27 = 0;
    v29 = (void *)v48;
    v28 = a4;
    v30 = 0;
    v31 = a5;
    v32 = v52;
    if (!v48)
      goto LABEL_55;
  }
  else
  {
    v44 = v10;
    v46 = a3;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v17 = v8;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    v42 = (void *)v13;
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = 0;
      v22 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v62 != v22)
            objc_enumerationMutation(v17);
          v24 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          if ((objc_msgSend(v9, "isEqualToString:", v24) & 1) == 0)
          {
            UIKeyboardLocalizedObject(CFSTR("UI-IconLabelScript"), v24, 0, 0, 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            UIKeyboardLocalizedObject(CFSTR("UI-IconLabelLanguage"), v24, 0, 0, 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v21 |= objc_msgSend(v55, "isEqualToString:", v25);
            v20 |= objc_msgSend(v54, "isEqualToString:", v26);

            v9 = v56;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
      }
      while (v19);
    }
    else
    {
      LOBYTE(v20) = 0;
      LOBYTE(v21) = 0;
    }

    v15 = v42;
    if ((v21 & 1) != 0 || !v55)
    {
      v28 = a4;
      v31 = a5;
      a3 = v46;
      v32 = v52;
      if (v52)
      {
        v27 = v52;
        v30 = 0;
        v10 = v44;
        v29 = (void *)v48;
        if (!v48)
          goto LABEL_55;
      }
      else
      {
        v29 = (void *)v48;
        if ((v20 & 1) != 0)
        {
          if (v54)
          {
            v10 = v54;

          }
          else
          {
            v10 = v44;
          }
          v30 = v42;
          v27 = 0;
          if (!v48)
            goto LABEL_55;
        }
        else if (v54)
        {
          v10 = v54;

          v27 = 0;
          v30 = 0;
          if (!v48)
            goto LABEL_55;
        }
        else
        {
          v27 = 0;
          v30 = 0;
          v10 = v44;
          if (!v48)
            goto LABEL_55;
        }
      }
    }
    else
    {
      v10 = v55;

      v27 = 0;
      v30 = 0;
      v28 = a4;
      v31 = a5;
      a3 = v46;
      v29 = (void *)v48;
      v32 = v52;
      if (!v48)
        goto LABEL_55;
    }
  }
  v49 = v30;
  v33 = v29;

  if (v32)
  {
    v47 = a3;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v34 = v53;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    if (v35)
    {
      v36 = v35;
      v45 = v10;
      v37 = *(_QWORD *)v58;
      while (2)
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v58 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
          if ((objc_msgSend(v9, "isEqualToString:", v39) & 1) == 0)
          {
            UIKeyboardLocalizedObject(CFSTR("UI-IconArtworkShort"), v39, 0, 0, 0);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v33, "isEqualToString:", v40);

            v9 = v56;
            if ((v41 & 1) != 0)
            {

              v32 = v52;
              v34 = v33;
              v33 = v52;
              v28 = a4;
              v10 = v45;
              goto LABEL_51;
            }
          }
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
        if (v36)
          continue;
        break;
      }
      v28 = a4;
      v10 = v45;
      v32 = v52;
LABEL_51:
      v31 = a5;
    }
    else
    {
      v32 = v52;
    }

    v27 = v33;
    a3 = v47;
  }
  else
  {
    v27 = v33;
  }
  v30 = v49;
LABEL_55:
  if (!v10)
  {
    -[UIKeyboardInputMode _fallbackIconLabel](v43, "_fallbackIconLabel");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a3)
    *a3 = objc_retainAutorelease(v10);
  if (v28)
    *v28 = objc_retainAutorelease(v30);
  if (v31)
    *v31 = objc_retainAutorelease(v27);

}

- (double)languageIndicatorScale
{
  void *v2;
  void *v3;
  void *v4;
  float v5;
  double v6;

  if (qword_1ECD79070 != -1)
    dispatch_once(&qword_1ECD79070, &__block_literal_global_1057);
  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECD79068, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    v6 = v5;
  }
  else
  {
    v6 = 1.0;
  }

  return v6;
}

void __45__UIKeyboardInputMode_languageIndicatorScale__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];
  _QWORD v3[10];

  v3[9] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("UICTContentSizeCategoryL");
  v2[1] = CFSTR("UICTContentSizeCategoryXL");
  v3[0] = &unk_1E1A95960;
  v3[1] = &unk_1E1A95970;
  v2[2] = CFSTR("UICTContentSizeCategoryXXL");
  v2[3] = CFSTR("UICTContentSizeCategoryXXXL");
  v3[2] = &unk_1E1A95980;
  v3[3] = &unk_1E1A95990;
  v2[4] = CFSTR("UICTContentSizeCategoryAccessibilityM");
  v2[5] = CFSTR("UICTContentSizeCategoryAccessibilityL");
  v3[4] = &unk_1E1A959A0;
  v3[5] = &unk_1E1A959B0;
  v2[6] = CFSTR("UICTContentSizeCategoryAccessibilityXL");
  v2[7] = CFSTR("UICTContentSizeCategoryAccessibilityXXL");
  v3[6] = &unk_1E1A959C0;
  v3[7] = &unk_1E1A959D0;
  v2[8] = CFSTR("UICTContentSizeCategoryAccessibilityXXXL");
  v3[8] = &unk_1E1A959E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD79068;
  qword_1ECD79068 = v0;

}

- (id)_indicatorIconWithConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v29;
  id v30;
  void *v31;

  v4 = a3;
  v5 = objc_msgSend(v4, "hash");
  if (objc_msgSend(v4, "background"))
  {
    -[UIKeyboardInputMode cachedIcon](self, "cachedIcon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && -[UIKeyboardInputMode cachedIconKey](self, "cachedIconKey") == v5)
    {
      -[UIKeyboardInputMode cachedSizeCategory](self, "cachedSizeCategory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)UIApp, "preferredContentSizeCategory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

      if (v9)
      {
        -[UIKeyboardInputMode cachedIcon](self, "cachedIcon");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
    else
    {

    }
  }
  -[UIKeyboardInputMode identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("emoji"));

  if (v12)
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "_lightStyleRenderConfig"))
      v14 = 1;
    else
      v14 = 2;

    +[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      v15 = (void *)objc_msgSend(v15, "imageConfiguration");
    v17 = v15;

    +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleFootnote"), -1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "configurationByApplyingConfiguration:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "size");
    +[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", objc_msgSend(v4, "weight"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "configurationByApplyingConfiguration:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("face.grinning"), v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30 = 0;
    v31 = 0;
    v29 = 0;
    -[UIKeyboardInputMode _getIconLabel:secondaryIconLabel:artwork:](self, "_getIconLabel:secondaryIconLabel:artwork:", &v31, &v30, &v29);
    v23 = v31;
    v24 = v29;
    v25 = v30;
    v26 = v23;
    -[UIKeyboardInputMode imageForInputModeLabel:secondaryIconLabel:artwork:withConfiguration:](self, "imageForInputModeLabel:secondaryIconLabel:artwork:withConfiguration:", v26, v25, v24, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v4, "background"))
  {
    -[UIKeyboardInputMode setCachedIcon:](self, "setCachedIcon:", v10);
    -[UIKeyboardInputMode setCachedIconKey:](self, "setCachedIconKey:", v5);
    objc_msgSend((id)UIApp, "preferredContentSizeCategory");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardInputMode setCachedSizeCategory:](self, "setCachedSizeCategory:", v27);

  }
LABEL_17:

  return v10;
}

- (void)drawStringInRect:(id)a3 inRect:(CGRect)a4 useSmallFont:(BOOL)a5 useCondensedFont:(BOOL)a6 scale:(double)a7
{
  double height;
  double width;
  double v10;
  double v11;
  double *v12;
  id *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v33;
  const __CTLine *v34;
  double v35;
  double v36;
  double a;
  double b;
  double d;
  double c;
  double ty;
  double tx;
  _QWORD *ContextStack;
  CGContext *v44;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  double x;
  double y;
  void *v54;
  id v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGAffineTransform transform;
  CGAffineTransform v59;
  uint64_t v60;
  void *v61;
  _QWORD v62[2];
  _QWORD v63[2];
  uint64_t v64;
  _QWORD v65[3];
  CGRect BoundsWithOptions;
  CGRect v67;

  height = a4.size.height;
  width = a4.size.width;
  x = a4.origin.x;
  y = a4.origin.y;
  v10 = 12.0;
  if (a6)
    v10 = 9.5;
  if (a5)
    v11 = 8.5;
  else
    v11 = v10;
  if (a5)
    v12 = (double *)off_1E167DC50;
  else
    v12 = (double *)off_1E167DC78;
  v65[1] = *MEMORY[0x1E0C80C00];
  if (a6)
    v13 = (id *)off_1E167DC30;
  else
    v13 = (id *)off_1E167DC40;
  v55 = a3;
  UICeilToScale(v11 * a7, 2.0);
  v15 = v14;
  v16 = *v13;
  v64 = *(_QWORD *)off_1E167DC10;
  v62[0] = *(_QWORD *)off_1E167DC80;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = *(_QWORD *)off_1E167DC48;
  v63[0] = v17;
  v54 = v16;
  v63[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A830, "fontDescriptorWithFontAttributes:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v22 = *(_QWORD *)off_1E1678D90;
  v51 = width;
  v23 = 5;
  while (1)
  {
    v24 = v21;
    objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v20, v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_alloc(MEMORY[0x1E0CB3778]);
    v60 = v22;
    v61 = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v26, "initWithString:attributes:", v55, v27);

    objc_msgSend(v21, "size");
    v29 = v28 / (width * 1.2);
    v31 = v30 / (height * 1.2);
    if (v29 <= 1.0 && v31 <= 1.0)
      break;
    if (v29 < v31)
      v29 = v31;
    UICeilToScale(v15 / v29, 2.0);
    if (v15 + -0.5 >= v33)
      v15 = v33;
    else
      v15 = v15 + -0.5;

    if (!--v23)
      goto LABEL_24;
  }

LABEL_24:
  v34 = CTLineCreateWithAttributedString((CFAttributedStringRef)v21);
  BoundsWithOptions = CTLineGetBoundsWithOptions(v34, 0x80uLL);
  v50 = BoundsWithOptions.size.width;
  v67 = CTLineGetBoundsWithOptions(v34, 8uLL);
  v49 = v67.origin.y;
  v35 = v67.size.height;
  memset(&v59, 0, sizeof(v59));
  CGAffineTransformMakeScale(&v59, 1.0, -1.0);
  v57 = v59;
  v36 = height;
  CGAffineTransformTranslate(&transform, &v57, 0.0, height);
  v59 = transform;
  CGAffineTransformInvert(&v56, &transform);
  a = v56.a;
  b = v56.b;
  c = v56.c;
  d = v56.d;
  tx = v56.tx;
  ty = v56.ty;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v44 = 0;
  else
    v44 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  v45 = x + (v51 - v50) * 0.5;
  v46 = y + v49 + (v36 + v35) * 0.5;
  v47 = ty + v45 * b + v46 * d;
  v48 = tx + v45 * a + v46 * c;
  CGContextSaveGState(v44);
  transform = v59;
  CGContextConcatCTM(v44, &transform);
  CGContextSetTextPosition(v44, v48, v47);
  CTLineDraw(v34, v44);
  CGContextRestoreGState(v44);
  CFRelease(v34);

}

- (id)imageForInputModeLabel:(id)a3 secondaryIconLabel:(id)a4 artwork:(id)a5 withConfiguration:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  UIKeyboardInputMode *v37;
  id v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  _BOOL8 v43;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[UIKeyboardInputMode identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardLocalizedObject(CFSTR("UI-IconLabelLanguageUsesCondensedFont"), v14, 0, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "scaleFactor");
  v17 = v16;
  objc_msgSend(v13, "size");
  v19 = ceil(v17 * v18);
  objc_msgSend(v13, "size");
  v21 = ceil(v17 * v20);
  if (+[UIKeyboard isLanguageIndicatorEnabled](UIKeyboard, "isLanguageIndicatorEnabled")
    && NSClassFromString(CFSTR("TUIKeyboardInputModeIconRenderer")))
  {
    v22 = objc_alloc_init(NSClassFromString(CFSTR("TUIKeyboardInputModeIconRendererConfiguration")));
    objc_msgSend(v22, "setSize:", v19, v21);
    +[_UICursorAccessoryView baseFontSize](_UICursorAccessoryView, "baseFontSize");
    objc_msgSend(v22, "setBaseFontSize:");
    objc_msgSend(v22, "setStyle:", objc_msgSend(v13, "background"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIKeyboardInputMode languageWithRegion](self, "languageWithRegion");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setLanguage:", v23);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v22, "setArtwork:", v12);
    v24 = objc_alloc_init(NSClassFromString(CFSTR("TUIKeyboardInputModeIconRenderer")));
    objc_msgSend(v24, "imageForPrimaryLabel:secondaryLabel:withConfiguration:", v10, v11, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "imageWithRenderingMode:", 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = ceil(v17 * 0.0);
    v28 = v27 + v27;
    _UIGraphicsBeginImageContextWithOptions(0, 0, v19, v21, 2.0);
    GetContextStack(0);
    v29 = v19 - (v27 + v27);
    v30 = v21 - (v27 + v27);
    CGContextClear();
    if (objc_msgSend(v13, "background"))
    {
      v45.origin.x = v27;
      v45.origin.y = v27;
      v45.size.width = v29;
      v45.size.height = v21 - v28;
      v46 = CGRectInset(v45, v17 * 1.5 * 0.5, v17 * 1.5 * 0.5);
      +[UIBezierPath _continuousRoundedRectBezierPath:withRoundedCorners:cornerRadius:segments:](UIBezierPath, "_continuousRoundedRectBezierPath:withRoundedCorners:cornerRadius:segments:", -1, 16, v46.origin.x, v46.origin.y, v46.size.width, v46.size.height, v17 * 5.0, v17 * 5.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIColor blackColor](UIColor, "blackColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setStroke");

      objc_msgSend(v31, "setLineWidth:", v17 * 1.5);
      objc_msgSend(v31, "stroke");
    }
    else
    {
      +[UIColor whiteColor](UIColor, "whiteColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setFill");
    }

    if (v11)
    {
      v33 = v30 * 0.5 + -1.0;
      v34 = v29 + -2.0;
      v35 = v30 - (v33 + 1.0);
      -[UIKeyboardInputMode drawStringInRect:inRect:useSmallFont:useCondensedFont:scale:](self, "drawStringInRect:inRect:useSmallFont:useCondensedFont:scale:", v10, 1, v15 != 0, v27 + 1.0, v27 + 1.0, v34, v35, v17);
      v36 = v27 + v33;
      v37 = self;
      v38 = v11;
      v39 = v27 + 1.0;
      v40 = v34;
      v41 = v35;
      v42 = 1;
      v43 = 0;
    }
    else
    {
      v47.origin.x = v27;
      v47.origin.y = v27;
      v47.size.width = v29;
      v47.size.height = v21 - v28;
      *(CGRect *)&v39 = CGRectInset(v47, 2.0, 2.0);
      v37 = self;
      v38 = v10;
      v42 = 0;
      v43 = v15 != 0;
    }
    -[UIKeyboardInputMode drawStringInRect:inRect:useSmallFont:useCondensedFont:scale:](v37, "drawStringInRect:inRect:useSmallFont:useCondensedFont:scale:", v38, v42, v43, v39, v36, v40, v41, v17);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    objc_msgSend(v22, "imageWithRenderingMode:", 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v26;
}

- (id)multilingualInputModeIdentifiers
{
  void *v2;
  void *v3;

  -[UIKeyboardInputMode identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputModeController multilingualSetForInputModeIdentifier:](UIKeyboardInputModeController, "multilingualSetForInputModeIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)multiscriptInputModeIdentifiers
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[UIKeyboardInputMode identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputModeController multilingualSetForInputModeIdentifier:](UIKeyboardInputModeController, "multilingualSetForInputModeIdentifier:", v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    if ((unint64_t)objc_msgSend(v3, "count") >= 2)
    {
      v6 = 1;
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        TIInputModeGetNormalizedIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(&unk_1E1A937D0, "containsObject:", v8))
        {
          objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v9);

        }
        ++v6;
      }
      while (v6 < objc_msgSend(v3, "count"));
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (BOOL)isMultilingual
{
  void *v2;
  BOOL v3;

  -[UIKeyboardInputMode multilingualInputModeIdentifiers](self, "multilingualInputModeIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (BOOL)isMultiscript
{
  void *v2;
  BOOL v3;

  -[UIKeyboardInputMode multiscriptInputModeIdentifiers](self, "multiscriptInputModeIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (BOOL)isMultilingualOnly
{
  void *v2;
  char IsMultilingualOnly;

  -[UIKeyboardInputMode identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsMultilingualOnly = TIInputModeIsMultilingualOnly();

  return IsMultilingualOnly;
}

- (unint64_t)multiscriptIndex
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[UIKeyboardInputMode multiscriptInputModeIdentifiers](self, "multiscriptInputModeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputMode identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "indexOfObject:", v4);

  return v5;
}

- (NSArray)multilingualSet
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardInputMode identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputModeController multilingualSetForInputModeIdentifier:](UIKeyboardInputModeController, "multilingualSetForInputModeIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (id)multilingualSetFromInputModeIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIKeyboardInputMode identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetMultilingualSetFromInputModes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (NSArray)multiscriptSet
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardInputMode multiscriptInputModeIdentifiers](self, "multiscriptInputModeIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

+ (id)multilingualSetsFromInputModeIdentifiers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10), (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "containsObject:", v11) & 1) == 0)
        {
          objc_msgSend(v11, "multilingualSetFromInputModeIdentifiers:", v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count"))
          {
            objc_msgSend(v12, "firstObject");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v13);

            objc_msgSend(v5, "addObjectsFromArray:", v12);
          }
          else
          {
            objc_msgSend(v4, "addObject:", v11);
            objc_msgSend(v5, "addObject:", v11);
          }

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v4;
}

- (BOOL)showsTransliterationCandidates
{
  void *v4;
  char v5;

  if (-[UIKeyboardInputMode isMultiscript](self, "isMultiscript"))
    return 1;
  -[UIKeyboardInputMode identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = UIKeyboardShowsTransliterationCandidatesForInputMode();

  return v5;
}

- (NSString)softwareLayout
{
  return self->softwareLayout;
}

- (NSString)hardwareLayout
{
  return self->hardwareLayout;
}

- (NSString)variant
{
  return self->_variant;
}

- (BOOL)extensionInputModeHasDictation
{
  return self->_extensionInputModeHasDictation;
}

- (void)setExtensionInputModeHasDictation:(BOOL)a3
{
  self->_extensionInputModeHasDictation = a3;
}

- (void)setDefaultDictationLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_defaultDictationLanguage, a3);
}

- (UIImage)cachedIcon
{
  return self->_cachedIcon;
}

- (unint64_t)cachedIconKey
{
  return self->_cachedIconKey;
}

- (void)setCachedIconKey:(unint64_t)a3
{
  self->_cachedIconKey = a3;
}

- (NSString)cachedSizeCategory
{
  return self->_cachedSizeCategory;
}

- (void)setCachedSizeCategory:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSizeCategory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSizeCategory, 0);
  objc_storeStrong((id *)&self->_cachedIcon, 0);
  objc_storeStrong((id *)&self->_defaultDictationLanguage, 0);
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_multilingualLanguages, 0);
  objc_storeStrong((id *)&self->hardwareLayout, 0);
  objc_storeStrong((id *)&self->softwareLayout, 0);
  objc_storeStrong((id *)&self->normalizedIdentifier, 0);
  objc_storeStrong((id *)&self->identifier, 0);
  objc_storeStrong((id *)&self->_languageWithRegion, 0);
  objc_storeStrong((id *)&self->_primaryLanguage, 0);
}

@end
