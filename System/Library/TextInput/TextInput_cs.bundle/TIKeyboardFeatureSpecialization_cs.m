@implementation TIKeyboardFeatureSpecialization_cs

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  return 0;
}

- (id)allAccentKeyStrings
{
  return &unk_25011FC48;
}

- (id)accentKeyStringForKeyboardState:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v4 = a3;
  objc_msgSend(v4, "layoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasAccentKey");

  if (v6)
  {
    objc_msgSend(v4, "documentState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contextBeforeInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "length");
    v10 = v9 - 2;
    if (v9 < 2)
    {
      v11 = CFSTR("´");
    }
    else
    {
      v11 = CFSTR("´");
      if (objc_msgSend(v8, "characterAtIndex:", v9 - 1) == 117)
      {
        v12 = objc_msgSend(v8, "rangeOfComposedCharacterSequenceAtIndex:", v10);
        objc_msgSend(v8, "substringWithRange:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "_firstLongCharacter");
        -[TIKeyboardFeatureSpecialization wordCharacters](self, "wordCharacters");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "characterSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v15) = objc_msgSend(v17, "longCharacterIsMember:", v15);

        if ((_DWORD)v15)
          v11 = CFSTR("˚");

      }
    }

  }
  else
  {
    v11 = 0;
  }

  return (id)v11;
}

- (BOOL)doesComposeText
{
  return 1;
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
  *(_QWORD *)v5 = 0x2C7000000B4;
  v5[2] = 730;
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
  v5.super_class = (Class)TIKeyboardFeatureSpecialization_cs;
  -[TIKeyboardFeatureSpecialization nonstopPunctuationCharacters](&v5, sel_nonstopPunctuationCharacters);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("ˇ´˚"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
