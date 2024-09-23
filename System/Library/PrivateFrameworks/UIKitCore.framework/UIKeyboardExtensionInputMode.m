@implementation UIKeyboardExtensionInputMode

- (UIKeyboardExtensionInputMode)initWithIdentifier:(id)a3
{
  id v4;
  UIKeyboardExtensionInputMode *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UIKeyboardExtensionInputMode *v25;
  UIKeyboardExtensionInputMode *v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)UIKeyboardExtensionInputMode;
  v5 = -[UIKeyboardExtensionInputMode init](&v33, sel_init);
  if (v4)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_MCFilteredExtensionIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (!v8)
      goto LABEL_10;
    v9 = *(_QWORD *)v30;
LABEL_4:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v4);

      if ((v13 & 1) != 0)
        break;
      if (v8 == (id)++v10)
      {
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v8)
          goto LABEL_4;
LABEL_10:
        v14 = (uint64_t)v5;
LABEL_19:
        v5 = 0;
        goto LABEL_20;
      }
    }
    v8 = v11;

    if (!v8)
      goto LABEL_17;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_plugIn");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "url");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v15, "fileExistsAtPath:", v18);

    if (!v19)
    {
      v7 = v8;
      v14 = (uint64_t)v5;
      v8 = 0;
      goto LABEL_19;
    }
    if (!v5)
    {
LABEL_17:
      v26 = 0;
      goto LABEL_21;
    }
    -[UIKeyboardInputMode setIdentifier:](v5, "setIdentifier:", v4);
    -[UIKeyboardInputMode setNormalizedIdentifier:](v5, "setNormalizedIdentifier:", v4);
    -[UIKeyboardExtensionInputMode setExtension:](v5, "setExtension:", v8);
    objc_msgSend(v8, "attributes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", CFSTR("PrimaryLanguage"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardExtensionInputMode setPrimaryLanguage:](v5, "setPrimaryLanguage:", v21);

    -[UIKeyboardInputMode primaryLanguage](v5, "primaryLanguage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardInputMode setLanguageWithRegion:](v5, "setLanguageWithRegion:", v22);

    -[UIKeyboardInputMode primaryLanguage](v5, "primaryLanguage");
    v14 = objc_claimAutoreleasedReturnValue();
    TIGetDefaultInputModesForLanguage();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetLanguageWithRegion();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      -[UIKeyboardInputMode setLanguageWithRegion:](v5, "setLanguageWithRegion:", v24);
    }
    else
    {
      -[UIKeyboardInputMode primaryLanguage](v5, "primaryLanguage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardInputMode setLanguageWithRegion:](v5, "setLanguageWithRegion:", v28);

    }
LABEL_20:
    v26 = v5;

    v5 = (UIKeyboardExtensionInputMode *)v14;
LABEL_21:

    v5 = v26;
    v25 = v5;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)setPrimaryLanguage:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;

  +[UIKeyboardInputMode canonicalLanguageIdentifierFromIdentifier:](UIKeyboardInputMode, "canonicalLanguageIdentifierFromIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputMode primaryLanguage](self, "primaryLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if ((v6 & 1) == 0)
  {
    -[UIKeyboardInputMode setHardwareLayout:](self, "setHardwareLayout:", 0);
    v12.receiver = self;
    v12.super_class = (Class)UIKeyboardExtensionInputMode;
    -[UIKeyboardInputMode setPrimaryLanguage:](&v12, sel_setPrimaryLanguage_, v4);
    TIGetDefaultInputModesForLanguage();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetLanguageWithRegion();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = v4;
    -[UIKeyboardInputMode setLanguageWithRegion:](self, "setLanguageWithRegion:", v11);

  }
}

- (BOOL)showSWLayoutWithHWKeyboard
{
  void *v3;
  int v4;
  void *v5;

  -[UIKeyboardExtensionInputMode hardwareLayout](self, "hardwareLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    -[UIKeyboardInputMode primaryLanguage](self, "primaryLanguage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("mul")) ^ 1;

  }
  return v4;
}

- (id)hardwareLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v47.receiver = self;
  v47.super_class = (Class)UIKeyboardExtensionInputMode;
  -[UIKeyboardInputMode hardwareLayout](&v47, sel_hardwareLayout);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferencesActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *MEMORY[0x1E0DBDDF0];
    objc_msgSend(v5, "valueForPreferenceKey:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v44;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v6);
        +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isExtensionInputMode") & 1) == 0)
        {
          objc_msgSend(v11, "primaryLanguage");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardInputMode primaryLanguage](self, "primaryLanguage");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqualToString:", v13);

          if ((v14 & 1) != 0)
            break;
        }

        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_11;
        }
      }
      objc_msgSend(v11, "hardwareLayout");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
        goto LABEL_33;
    }
    else
    {
LABEL_11:

    }
    v15 = (void *)MEMORY[0x1E0C99DC8];
    -[UIKeyboardInputMode primaryLanguage](self, "primaryLanguage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localeWithLocaleIdentifier:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17
      && (objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0C997E8]), (v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v38 = (void *)v18;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "preferencesActions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "valueForPreferenceKey:", v37);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v40;
LABEL_17:
        v25 = 0;
        while (1)
        {
          if (*(_QWORD *)v40 != v24)
            objc_enumerationMutation(v21);
          +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v25));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v26, "isExtensionInputMode") & 1) == 0)
          {
            objc_msgSend(v26, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            TIInputModeGetBaseLanguage();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v38, "isEqualToString:", v28);

            if ((v29 & 1) != 0)
              break;
          }

          if (v23 == ++v25)
          {
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
            if (v23)
              goto LABEL_17;
            goto LABEL_24;
          }
        }
        objc_msgSend(v26, "hardwareLayout");
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v3)
          goto LABEL_28;
        v30 = v38;
      }
      else
      {
LABEL_24:

LABEL_28:
        v30 = v38;
        TIGetDefaultInputModesForLanguage();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        TIInputModeGetBaseLanguage();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v38, "isEqualToString:", v33);

        if (v34)
        {
          TIInputModeGetNormalizedIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          UIKeyboardGetDefaultHardwareKeyboardLayoutForInputMode(v35);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v35;
        }
        else
        {
          v3 = 0;
        }

      }
    }
    else
    {
      v30 = 0;
      v3 = 0;
    }

  }
LABEL_33:
  -[UIKeyboardInputMode setHardwareLayout:](self, "setHardwareLayout:", v3);
  return v3;
}

- (id)monolingualDisplayName
{
  void *v3;
  void *v4;
  void *v5;

  -[UIKeyboardExtensionInputMode extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[UIKeyboardExtensionInputMode extension](self, "extension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE88]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[UIKeyboardInputMode identifier](self, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v4;
}

- (id)extendedDisplayName
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[UIKeyboardExtensionInputMode containingBundleDisplayName](self, "containingBundleDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  -[UIKeyboardExtensionInputMode displayName](self, "displayName");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_4;
  v5 = (void *)v4;
  -[UIKeyboardExtensionInputMode displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "containsString:", v6);

  if ((v7 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[UIKeyboardExtensionInputMode displayName](self, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardExtensionInputMode containingBundleDisplayName](self, "containingBundleDisplayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ — %@"), v10, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    -[UIKeyboardExtensionInputMode displayName](self, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)isDefaultRightToLeft
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[UIKeyboardExtensionInputMode extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("PrefersRightToLeft"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)defaultLayoutIsASCIICapable
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[UIKeyboardExtensionInputMode extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("IsASCIICapable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)isStalledExtensionInputMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardExtensionInputMode extension](self, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_plugIn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "fileExistsAtPath:", v7) ^ 1;

  return v8;
}

- (BOOL)isExtensionInputMode
{
  return 1;
}

- (id)containingBundle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[UIKeyboardExtensionInputMode extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_plugIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containingUrl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)containingBundleDisplayName
{
  void *v2;
  void *v3;
  void *v4;

  -[UIKeyboardExtensionInputMode extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_plugIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedContainingName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)normalizedIdentifierLevels
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)isDesiredForTraits:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  BOOL v15;

  v4 = a3;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allowedExtensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardExtensionInputMode extension](self, "extension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (!v8)
    goto LABEL_12;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "deviceStateIsLocked") & 1) != 0)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "containerRootController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isSnapshotting");

    if (!v12)
      goto LABEL_12;
  }
  else
  {

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "textInputTraitsNeedAutofillExcludeOneTimeCodeAndContact");

  if ((v14 & 1) == 0
    && (objc_msgSend(v4, "isCarPlayIdiom") & 1) == 0
    && (objc_msgSend(v4, "isSecureTextEntry") & 1) == 0
    && objc_msgSend(v4, "keyboardAppearance") != 127
    && objc_msgSend(v4, "keyboardType") != 127
    && objc_msgSend(v4, "keyboardType") != 5)
  {
    v15 = objc_msgSend(v4, "keyboardType") != 6;
    goto LABEL_13;
  }
LABEL_12:
  v15 = 0;
LABEL_13:

  return v15;
}

- (id)_indicatorIconWithBackground:(BOOL)a3 iconWidth:(double)a4 scaleFactor:(double)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIGraphicsImageRenderer *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  double v17;

  -[UIKeyboardInputMode cachedIcon](self, "cachedIcon", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[UIKeyboardExtensionInputMode extension](self, "extension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "icons");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = -[UIGraphicsImageRenderer initWithSize:]([UIGraphicsImageRenderer alloc], "initWithSize:", a4, 18.0);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __83__UIKeyboardExtensionInputMode__indicatorIconWithBackground_iconWidth_scaleFactor___block_invoke;
      v15[3] = &unk_1E16CCFF0;
      v16 = v10;
      v17 = a4;
      -[UIGraphicsImageRenderer imageWithActions:](v11, "imageWithActions:", v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "imageWithRenderingMode:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIKeyboardInputMode setCachedIcon:](self, "setCachedIcon:", v13);
    }
  }
  return -[UIKeyboardInputMode cachedIcon](self, "cachedIcon");
}

uint64_t __83__UIKeyboardExtensionInputMode__indicatorIconWithBackground_iconWidth_scaleFactor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:blendMode:alpha:", 17, 0.0, 0.0, *(double *)(a1 + 40), 18.0, 1.0);
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
}

@end
