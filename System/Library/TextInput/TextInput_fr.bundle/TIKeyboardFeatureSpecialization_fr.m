@implementation TIKeyboardFeatureSpecialization_fr

- (id)allAccentKeyStrings
{
  return &unk_250121248;
}

- (id)accentKeyStringForInputPrefix:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  __int16 v7;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "lowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[TIKeyboardFeatureSpecialization_fr accentKeyStringForInputPrefix:]::once != -1)
      dispatch_once(&-[TIKeyboardFeatureSpecialization_fr accentKeyStringForInputPrefix:]::once, &__block_literal_global);
    if ((objc_msgSend(v4, "hasSuffix:", CFSTR("qu")) & 1) != 0
      || (objc_msgSend((id)-[TIKeyboardFeatureSpecialization_fr accentKeyStringForInputPrefix:]::apostrophePrefixes, "containsObject:", v4) & 1) != 0)
    {
LABEL_6:
      v5 = CFSTR("'’");
    }
    else
    {
      v7 = objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v4, "length") - 1);
      v5 = CFSTR("ˋ");
      switch(((unsigned __int16)(v7 - 97) >> 1) | (unsigned __int16)((v7 - 97) << 15))
      {
        case 0:
          break;
        case 2:
          v5 = CFSTR("´");
          break;
        case 4:
        case 7:
          v5 = CFSTR("ˆ");
          break;
        case 10:
          if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ou")) & 1) == 0
            && !objc_msgSend(v4, "isEqualToString:", CFSTR("dou")))
          {
            v5 = CFSTR("ˆ");
          }
          v5 = v5;
          break;
        default:
          goto LABEL_6;
      }
    }
  }
  else
  {
    v5 = CFSTR("´");
    v4 = v3;
  }

  return v5;
}

- (id)accentKeyStringForKeyboardState:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;

  v4 = a3;
  objc_msgSend(v4, "layoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasAccentKey");

  if (v6)
  {
    if (-[TIKeyboardFeatureSpecialization_fr accentKeyStringForKeyboardState:]::onceToken != -1)
      dispatch_once(&-[TIKeyboardFeatureSpecialization_fr accentKeyStringForKeyboardState:]::onceToken, &__block_literal_global_18);
    objc_msgSend(v4, "documentState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contextBeforeInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:", -[TIKeyboardFeatureSpecialization_fr accentKeyStringForKeyboardState:]::nonLetterSet, 4);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v8, "substringFromIndex:", v9 + v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v11;
    }
    -[TIKeyboardFeatureSpecialization_fr accentKeyStringForInputPrefix:](self, "accentKeyStringForInputPrefix:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = CFSTR("UI-Nothing");
    if (v12)
      v14 = (__CFString *)v12;
    v15 = v14;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)createInputManager
{
  uint64_t v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  const __CFLocale *v8;
  void *v9;
  KB *v10;
  NSString *v11;
  std::__shared_weak_count *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  KB::InputManagerSpecialization_fr *v17;
  std::__shared_weak_count *v18;
  _BYTE v19[32];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = operator new();
  MEMORY[0x234901E84]();
  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedIdentifier");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "UTF8String");
  v6 = TILexiconIDForLocaleIdentifier();

  *(_DWORD *)(v3 + 248) = v6;
  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locale");
  v8 = (const __CFLocale *)objc_claimAutoreleasedReturnValue();

  TIInputManager::set_word_medial_punctuation_predicate();
  -[TIKeyboardFeatureSpecialization_fr allAccentKeyStrings](self, "allAccentKeyStrings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", &stru_250120FD0);
  v10 = (KB *)objc_claimAutoreleasedReturnValue();

  KB::utf8_string(v10, v11);
  v12 = (std::__shared_weak_count *)operator new(0x48uLL);
  v12->__shared_weak_owners_ = 0;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&unk_250120CE0;
  v12->__shared_owners_ = 0;
  v17 = KB::InputManagerSpecialization_fr::InputManagerSpecialization_fr((KB::InputManagerSpecialization_fr *)&v12[1], v8, (const KB::String *)v19);
  v18 = v12;
  TIInputManager::set_input_manager_specialization((TIInputManager *)v3, (uint64_t *)&v17);
  v13 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  KB::String::~String((KB::String *)v19);
  *(_DWORD *)(v3 + 584) = 1;
  *(_BYTE *)(v3 + 684) = -[TIKeyboardFeatureSpecialization useRelaxedOVSPolicy](self, "useRelaxedOVSPolicy");

  return (void *)v3;
}

- (id)externalStringToInternal:(id)a3
{
  KB *v4;
  NSString *v5;
  const KB::String *v6;
  void *v7;
  _OWORD *__p;
  _BYTE v10[32];
  _BYTE v11[32];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (KB *)a3;
  __p = operator new(0x10uLL);
  *__p = xmmword_2322FC7E0;
  KB::utf8_string(v4, v5);

  -[TIKeyboardFeatureSpecialization precomposedCharacterSet](self, "precomposedCharacterSet");
  KB::decompose_diacritics();
  KB::ns_string((KB *)v11, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  KB::String::~String((KB::String *)v11);
  KB::String::~String((KB::String *)v10);
  if (__p)
    operator delete(__p);
  return v7;
}

- (id)internalStringToExternal:(id)a3
{
  const KB::String *v4;
  void *v5;
  _BYTE v7[32];
  _BYTE v8[32];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  KB::utf8_string((KB *)a3, (NSString *)a2);
  -[TIKeyboardFeatureSpecialization precomposedCharacterSet](self, "precomposedCharacterSet");
  KB::compose_diacritics();
  KB::ns_string((KB *)v8, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  KB::String::~String((KB::String *)v8);
  KB::String::~String((KB::String *)v7);
  return v5;
}

- (id)nonstopPunctuationCharacters
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardFeatureSpecialization_fr;
  -[TIKeyboardFeatureSpecialization nonstopPunctuationCharacters](&v5, sel_nonstopPunctuationCharacters);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("-"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)terminatorsDeletingAutospace
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageWithRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("fr_CA")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("fr_CH")))
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardFeatureSpecialization_fr;
    -[TIKeyboardFeatureSpecialization terminatorsDeletingAutospace](&v8, sel_terminatorsDeletingAutospace);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[TIKeyboardFeatureSpecialization_fr terminatorsDeletingAutospace]::onceToken != -1)
      dispatch_once(&-[TIKeyboardFeatureSpecialization_fr terminatorsDeletingAutospace]::onceToken, &__block_literal_global_34);
    v5 = (id)-[TIKeyboardFeatureSpecialization_fr terminatorsDeletingAutospace]::result;
  }
  v6 = v5;

  return v6;
}

@end
