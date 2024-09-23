@implementation TIInputMode

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = -[TIInputMode isSiriMode](self, "isSiriMode");
  v6 = 81069269;
  if (v5)
    v6 = 16843009;
  return v6 + v4;
}

- (NSDictionary)reverseCompositionMap
{
  void *v2;
  void *v3;
  void *v4;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE118]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSDictionary)compositionMap
{
  void *v2;
  void *v3;
  void *v4;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE088]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSString)normalizedIdentifier
{
  return self->_normalizedIdentifier;
}

- (NSLocale)locale
{
  NSLocale *locale;
  id v4;
  void *v5;
  NSLocale *v6;
  NSLocale *v7;

  locale = self->_locale;
  if (!locale)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99DC8]);
    -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSLocale *)objc_msgSend(v4, "initWithLocaleIdentifier:", v5);
    v7 = self->_locale;
    self->_locale = v6;

    locale = self->_locale;
  }
  return locale;
}

- (NSString)replacementForDoubleSpace
{
  void *v2;
  void *v3;
  void *v4;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE0B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  TIInputMode *v4;
  TIInputMode *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (TIInputMode *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIInputMode normalizedIdentifier](v5, "normalizedIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7)
        && (v8 = -[TIInputMode isSiriMode](self, "isSiriMode"), v8 == -[TIInputMode isSiriMode](v5, "isSiriMode")))
      {
        -[TIInputMode originalIdentifier](self, "originalIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        TIInputModeGetMultilingualID();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIInputMode originalIdentifier](v5, "originalIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        TIInputModeGetMultilingualID();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v11 == v13;

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (NSArray)allAccentKeyStrings
{
  void *v2;
  void *v3;
  void *v4;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE058]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier = %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (TIInputMode)inputModeWithIdentifier:(id)a3
{
  return (TIInputMode *)objc_msgSend(a1, "inputModeWithIdentifier:isSiriMode:", a3, 0);
}

- (Class)multilingualInputManagerClass
{
  Class multilingualInputManagerClass;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  objc_class *v8;

  multilingualInputManagerClass = self->_multilingualInputManagerClass;
  if (!multilingualInputManagerClass)
  {
    -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    TIGetInputModeProperties();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DBE158]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if (v7
      && (-[objc_class isSubclassOfClass:](-[TIInputMode inputManagerClass](self, "inputManagerClass"), "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    {
      v8 = (objc_class *)objc_opt_class();
    }
    else
    {
      v8 = -[TIInputMode inputManagerClass](self, "inputManagerClass");
    }
    self->_multilingualInputManagerClass = v8;

    multilingualInputManagerClass = self->_multilingualInputManagerClass;
  }
  return multilingualInputManagerClass;
}

- (NSString)languageWithRegion
{
  NSString *languageWithRegion;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  languageWithRegion = self->_languageWithRegion;
  if (!languageWithRegion)
  {
    -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetLanguageWithRegion();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSString *)objc_msgSend(v5, "copy");
    v7 = self->_languageWithRegion;
    self->_languageWithRegion = v6;

    languageWithRegion = self->_languageWithRegion;
  }
  return languageWithRegion;
}

- (TIInputMode)initWithNormalizedIdentifier:(id)a3 isSiriMode:(BOOL)a4
{
  id v6;
  TIInputMode *v7;
  uint64_t v8;
  NSString *normalizedIdentifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIInputMode;
  v7 = -[TIInputMode init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    normalizedIdentifier = v7->_normalizedIdentifier;
    v7->_normalizedIdentifier = (NSString *)v8;

    v7->_isSiriMode = a4;
  }

  return v7;
}

- (TIInputMode)initWithNormalizedIdentifier:(id)a3
{
  return -[TIInputMode initWithNormalizedIdentifier:isSiriMode:](self, "initWithNormalizedIdentifier:isSiriMode:", a3, 0);
}

- (NSString)variant
{
  NSString *variant;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  variant = self->_variant;
  if (!variant)
  {
    -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetVariant();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSString *)objc_msgSend(v5, "copy");
    v7 = self->_variant;
    self->_variant = v6;

    variant = self->_variant;
  }
  return variant;
}

- (NSString)preferredModelLocaleIdentifier
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    -[TIInputMode preferredMultilingualLanguageModelLocale](self, "preferredMultilingualLanguageModelLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[TIInputMode locale](self, "locale");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localeIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = 0;
      goto LABEL_7;
    }
    v4 = v3;
    v5 = v4;
  }
  else
  {
    -[TIInputMode locale](self, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localeIdentifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
LABEL_7:

  return (NSString *)v6;
}

- (BOOL)preferredModelLocaleIsMultilingual
{
  TIInputMode *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[TIInputMode preferredModelLocaleIdentifier](self, "preferredModelLocaleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIInputMode preferredMultilingualLanguageModelLocale](v2, "preferredMultilingualLanguageModelLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (NSArray)additionalConfiguredLatinLanguages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  TIInputModeGetMultilingualID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    TIInputModeGetMultilingualSet();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v5, "removeObject:", self->_originalIdentifier);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_1172);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filterUsingPredicate:", v6);
LABEL_8:

    return (NSArray *)v5;
  }
  TIInputModeGetNormalizedIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("ko_KR")))
  {
    v5 = 0;
    goto LABEL_8;
  }
  TIInputModeGetSWLayout();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Korean-With-QWERTY"));

  if (v8)
    v5 = &unk_1EA13FF10;
  else
    v5 = 0;
  return (NSArray *)v5;
}

- (Class)inputManagerClass
{
  Class inputManagerClass;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;

  inputManagerClass = self->_inputManagerClass;
  if (!inputManagerClass)
  {
    -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    TIGetInputModeProperties();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!self->_inputManagerClass)
    {
      objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DBE0E8]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        TIBundleForInputMode();
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = (objc_class *)objc_msgSend(v8, "classNamed:", v6);
        self->_inputManagerClass = v9;
        if (!v9
          && ((objc_msgSend(v6, "isEqualToString:", CFSTR("TIKeyboardInputManagerTransliteration")) & 1) != 0
           || objc_msgSend(v6, "isEqualToString:", CFSTR("TIKeyboardInputManagerIndic"))))
        {
          self->_inputManagerClass = (Class)objc_opt_class();
        }

      }
      if (!self->_inputManagerClass)
        self->_inputManagerClass = (Class)objc_opt_class();
    }

    inputManagerClass = self->_inputManagerClass;
  }
  return inputManagerClass;
}

- (Class)keyboardFeatureSpecializationClassFromInputModeProperties
{
  void *v3;
  void *v4;
  NSString *v5;
  Class v6;
  Class v7;
  BOOL v8;
  void *v9;
  void *v10;
  objc_class *v11;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DBE0F0]);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = NSClassFromString(v5);
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  if (v8)
  {
    -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    TIBundleForInputMode();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (Class)objc_msgSend(v10, "classNamed:", v5);
  }
  v11 = v7;

  return v11;
}

- (Class)keyboardFeatureSpecializationClass
{
  objc_class *keyboardFeatureSpecializationClass;

  keyboardFeatureSpecializationClass = self->_keyboardFeatureSpecializationClass;
  if (!keyboardFeatureSpecializationClass)
  {
    keyboardFeatureSpecializationClass = -[TIInputMode keyboardFeatureSpecializationClassFromInputModeProperties](self, "keyboardFeatureSpecializationClassFromInputModeProperties");
    self->_keyboardFeatureSpecializationClass = keyboardFeatureSpecializationClass;
    if (!keyboardFeatureSpecializationClass)
    {
      -[TIInputMode supportsPrediction](self, "supportsPrediction");
      keyboardFeatureSpecializationClass = (objc_class *)objc_opt_class();
      self->_keyboardFeatureSpecializationClass = keyboardFeatureSpecializationClass;
    }
  }
  return keyboardFeatureSpecializationClass;
}

- (BOOL)supportsPrediction
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE0D0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)supportsMultilingualKeyboard
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE158]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)wantsMultilingualUnionOVS
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE170]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)preferredMultilingualLanguageModelLocale
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[TIInputMode languageWithRegion](self, "languageWithRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqual:", CFSTR("hi_Latn")))
  {

LABEL_5:
    -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    TIGetInputModeProperties();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0DBE110]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v5 = 0;
        goto LABEL_11;
      }
      objc_msgSend(v8, "performSelector:", sel_stringValue);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v9;
LABEL_11:

    return v5;
  }
  v4 = isH13ANEPresentOnIOS();

  if ((v4 & 1) != 0)
    goto LABEL_5;
  v5 = 0;
  return v5;
}

- (BOOL)spaceAutocorrectionEnabled
{
  uint64_t v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (TIGetKeyboardDisableSpaceCorrectionsValue_onceToken != -1)
    dispatch_once(&TIGetKeyboardDisableSpaceCorrectionsValue_onceToken, &__block_literal_global_141);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "valueForPreferenceKey:", CFSTR("KeyboardDisableSpaceCorrections"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "BOOLValue");
  if ((v3 & 1) != 0)
    return 0;
  if (TIGetKeyboardForceSpaceCorrectionsValue_onceToken != -1)
    dispatch_once(&TIGetKeyboardForceSpaceCorrectionsValue_onceToken, &__block_literal_global_148_1154);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "valueForPreferenceKey:", CFSTR("KeyboardForceSpaceCorrections"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "BOOLValue");
  if ((v6 & 1) != 0)
    return 1;
  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0DBE140]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    v5 = objc_msgSend(v10, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

- (BOOL)typedStringLMRankingEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE160]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 1;

  return v6;
}

- (BOOL)doesComposeText
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE080]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)deletesByComposedCharacterSequence
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE0A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

- (NSDictionary)layoutTags
{
  void *v2;
  void *v3;
  void *v4;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE0F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSString)nonstopPunctuationCharacters
{
  void *v2;
  void *v3;
  void *v4;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE108]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)sentencePrefixingCharacters
{
  void *v2;
  void *v3;
  void *v4;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE128]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)sentenceDelimitingCharacters
{
  void *v2;
  void *v3;
  void *v4;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE120]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)sentenceTrailingCharacters
{
  void *v2;
  void *v3;
  void *v4;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE130]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)wordMedialPunctuationCharacters
{
  void *v2;
  void *v3;
  void *v4;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE178]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)spaceDeletingCharacters
{
  void *v2;
  void *v3;
  void *v4;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE148]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)autocorrectionLocaleIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE070]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)doesSupportInlineCompletion
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[TIInputMode normalizedIdentifier](self, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE0E0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)isSiriMode
{
  return self->_isSiriMode;
}

- (NSString)originalIdentifier
{
  return self->_originalIdentifier;
}

- (void)setOriginalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalIdentifier, 0);
  objc_storeStrong((id *)&self->_normalizedIdentifier, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_languageWithRegion, 0);
}

uint64_t __49__TIInputMode_additionalConfiguredLatinLanguages__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsString:", CFSTR("Translit")) ^ 1;
}

+ (TIInputMode)inputModeWithIdentifier:(id)a3 isSiriMode:(BOOL)a4
{
  return (TIInputMode *)objc_msgSend(a1, "inputModeWithIdentifier:isSiriMode:originalIdentifier:", a3, a4, 0);
}

+ (TIInputMode)inputModeWithIdentifier:(id)a3 isSiriMode:(BOOL)a4 originalIdentifier:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  uint64_t *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  TIInputMode *v20;
  void *v21;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  if (v6)
    v9 = &inputModeWithIdentifier_isSiriMode_originalIdentifier__cachedSiriInputModes;
  else
    v9 = &inputModeWithIdentifier_isSiriMode_originalIdentifier__cachedInputModes;
  v10 = (void *)*v9;
  if (!*v9)
  {
    v11 = objc_opt_new();
    v12 = (void *)*v9;
    *v9 = v11;

    v10 = (void *)*v9;
  }
  v13 = v10;
  objc_msgSend(v13, "objectForKey:", v7);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    v16 = v8;
  }
  else
  {
    TIInputModeGetNormalizedIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v18 = v8;
    else
      v18 = v7;
    v16 = v18;

    if (!v15
      || (objc_msgSend(v15, "originalIdentifier"),
          v19 = (id)objc_claimAutoreleasedReturnValue(),
          v19,
          v19 != v16))
    {
      v20 = -[TIInputMode initWithNormalizedIdentifier:isSiriMode:]([TIInputMode alloc], "initWithNormalizedIdentifier:isSiriMode:", v17, v6);

      v21 = (void *)objc_msgSend(v16, "copy");
      -[TIInputMode setOriginalIdentifier:](v20, "setOriginalIdentifier:", v21);

      objc_msgSend(v13, "setObject:forKey:", v20, v17);
      v15 = v20;
    }
    objc_msgSend(v13, "setObject:forKey:", v15, v7);
    if (v16 != v7)
      objc_msgSend(v13, "setObject:forKey:", v15, v16);

  }
  return (TIInputMode *)v15;
}

- (void)setQuickTypeKeyboardFeatureSpecializationClass
{
  if (!self->_keyboardFeatureSpecializationClass)
    self->_keyboardFeatureSpecializationClass = (Class)objc_opt_class();
}

@end
