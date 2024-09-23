@implementation TIKeyboardFeatureSpecialization_el

- (void)createInputManager
{
  TIInputManager *v3;
  void *v4;
  const __CFLocale *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v14;
  std::__shared_weak_count *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TIKeyboardFeatureSpecialization_el;
  v3 = -[TIKeyboardQuickTypeSpecialization createInputManager](&v16, sel_createInputManager);
  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v5 = (const __CFLocale *)objc_claimAutoreleasedReturnValue();

  v6 = (std::__shared_weak_count *)operator new(0x28uLL);
  v6->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_250120128;
  v14 = KB::InputManagerSpecialization_el::InputManagerSpecialization_el((KB::InputManagerSpecialization_el *)&v6[1], v5);
  v15 = v6;
  do
    v8 = __ldxr(p_shared_owners);
  while (__stxr(v8 + 1, p_shared_owners));
  TIInputManager::set_input_manager_specialization(v3, (uint64_t *)&v14);
  v9 = v15;
  if (v15)
  {
    v10 = (unint64_t *)&v15->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  do
    v12 = __ldaxr(p_shared_owners);
  while (__stlxr(v12 - 1, p_shared_owners));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }

  return v3;
}

- (id)sentencePrefixingCharacters
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardFeatureSpecialization_el;
  -[TIKeyboardFeatureSpecialization sentencePrefixingCharacters](&v5, sel_sentencePrefixingCharacters);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("«"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sentenceDelimitingCharacters
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardFeatureSpecialization_el;
  -[TIKeyboardFeatureSpecialization sentenceDelimitingCharacters](&v5, sel_sentenceDelimitingCharacters);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR(";"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sentenceTrailingCharacters
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardFeatureSpecialization_el;
  -[TIKeyboardFeatureSpecialization sentenceTrailingCharacters](&v5, sel_sentenceTrailingCharacters);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("»"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)externalStringToInternal:(id)a3
{
  KB *v4;
  _DWORD *v5;
  NSString *v6;
  const KB::String *v7;
  void *v8;
  void *__p;
  _BYTE v11[32];
  _BYTE v12[32];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (KB *)a3;
  v5 = operator new(0xCuLL);
  *(_QWORD *)v5 = 0xB400000385;
  v5[2] = 168;
  __p = v5;
  KB::utf8_string(v4, v6);

  -[TIKeyboardFeatureSpecialization precomposedCharacterSet](self, "precomposedCharacterSet");
  KB::decompose_diacritics();
  KB::ns_string((KB *)v12, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  KB::String::~String((KB::String *)v12);
  KB::String::~String((KB::String *)v11);
  if (__p)
    operator delete(__p);
  return v8;
}

- (id)internalStringToExternal:(id)a3
{
  KB::String *v4;
  _QWORD *v5;
  _QWORD *v6;
  const KB::String *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  UChar32 v13;
  _QWORD *v14;
  int v15;
  int v16;
  UChar32 c;
  _QWORD *v18;
  int v19;
  int v20;
  int v21;
  _QWORD *v22;
  int v23;
  int v24;
  int v25;
  _BYTE v26[32];
  unsigned __int16 v27;
  _QWORD *v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  KB::utf8_string((KB *)a3, (NSString *)a2);
  -[TIKeyboardFeatureSpecialization precomposedCharacterSet](self, "precomposedCharacterSet");
  KB::compose_diacritics();
  KB::String::~String((KB::String *)v26);
  KB::String::String(v4);
  v5 = v28;
  if (!v28)
    v5 = v29;
  v22 = v5;
  v23 = 0;
  v24 = v27;
  v25 = 0;
  KB::String::iterator::initialize((KB::String::iterator *)&v22);
  v6 = v28;
  if (!v28)
    v6 = v29;
  v18 = v6;
  v19 = v27;
  v20 = v27;
  v21 = 0;
  KB::String::iterator::initialize((KB::String::iterator *)&v18);
  while (v23 != v19)
  {
    if (v25 == 963)
    {
      v8 = v28;
      if (!v28)
        v8 = v29;
      v18 = v8;
      v19 = 0;
      v20 = v27;
      v21 = 0;
      KB::String::iterator::initialize((KB::String::iterator *)&v18);
      if (v23 != v19)
      {
        KB::String::iterator::operator-();
        if (((0x40001FEu >> u_charType(c)) & 1) == 0)
          KB::String::iterator::operator-();
      }
      KB::String::iterator::operator+();
      v9 = v28;
      if (!v28)
        v9 = v29;
      v14 = v9;
      v15 = v27;
      v16 = v27;
      c = 0;
      KB::String::iterator::initialize((KB::String::iterator *)&v14);
      if (v19 != v15)
      {
        KB::String::iterator::operator+();
        if (((0x40001FEu >> u_charType(v13)) & 1) == 0)
          KB::String::iterator::operator+();
      }
    }
    KB::String::append((KB::String *)v26);
    KB::String::iterator::operator++();
    v10 = v28;
    if (!v28)
      v10 = v29;
    v18 = v10;
    v19 = v27;
    v20 = v27;
    v21 = 0;
    KB::String::iterator::initialize((KB::String::iterator *)&v18);
  }
  KB::ns_string((KB *)v26, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  KB::String::~String((KB::String *)v26);
  KB::String::~String((KB::String *)&v27);
  return v11;
}

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  return 0;
}

- (id)nonstopPunctuationCharacters
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardFeatureSpecialization_el;
  -[TIKeyboardFeatureSpecialization nonstopPunctuationCharacters](&v5, sel_nonstopPunctuationCharacters);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("´¨΅"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
