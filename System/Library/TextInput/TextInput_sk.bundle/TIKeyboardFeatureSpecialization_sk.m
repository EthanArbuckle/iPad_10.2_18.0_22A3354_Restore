@implementation TIKeyboardFeatureSpecialization_sk

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  return 0;
}

- (id)allAccentKeyStrings
{
  return &unk_25012BF68;
}

- (id)accentKeyStringForKeyboardState:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "layoutState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAccentKey");

  if (v4)
    return CFSTR("´");
  else
    return 0;
}

- (BOOL)doesComposeText
{
  return 1;
}

- (id)externalStringToInternal:(id)a3
{
  KB *v4;
  NSString *v5;
  const KB::String *v6;
  void *v7;
  _QWORD *__p;
  _BYTE v10[32];
  _BYTE v11[32];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (KB *)a3;
  __p = operator new(8uLL);
  *__p = 0x2C7000000B4;
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
  v5.super_class = (Class)TIKeyboardFeatureSpecialization_sk;
  -[TIKeyboardFeatureSpecialization nonstopPunctuationCharacters](&v5, sel_nonstopPunctuationCharacters);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("ˇ´"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
