@implementation TIKeyboardInputManager_haw

- (void)initImplementation
{
  void *result;
  uint64_t v3;

  result = *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
  if (!result)
  {
    v3 = operator new();
    return (void *)MEMORY[0x234902110](v3);
  }
  return result;
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
  _DWORD *__p;
  _BYTE v10[32];
  _BYTE v11[32];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (KB *)a3;
  __p = operator new(4uLL);
  *__p = 175;
  KB::utf8_string(v4, v5);

  -[TIKeyboardInputManager_haw precomposedCharacterSet](self, "precomposedCharacterSet");
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
  -[TIKeyboardInputManager_haw precomposedCharacterSet](self, "precomposedCharacterSet");
  KB::compose_diacritics();
  KB::ns_string((KB *)v8, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  KB::String::~String((KB::String *)v8);
  KB::String::~String((KB::String *)v7);
  return v5;
}

- (id)sentencePrefixingCharacters
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManager_haw;
  -[TIKeyboardInputManager_haw sentencePrefixingCharacters](&v5, sel_sentencePrefixingCharacters);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("ʻ"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
