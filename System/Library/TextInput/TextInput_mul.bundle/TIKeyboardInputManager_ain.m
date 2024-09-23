@implementation TIKeyboardInputManager_ain

- (id)deleteComposedTextFromIndex:(unint64_t)a3 count:(unint64_t *)a4
{
  const KB::String *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  KB *v12;
  NSString *v13;
  _BYTE v15[32];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  TIInputManager::input_string(*(TIInputManager **)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BEB5498]));
  KB::ns_string((KB *)v15, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_ain internalStringToExternal:](self, "internalStringToExternal:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  KB::String::~String((KB::String *)v15);
  v9 = a3 - 1;
  if (v9 <= objc_msgSend(v8, "length"))
  {
    objc_msgSend(v8, "substringToIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BEB5490]), "setString:", v10);
    -[TIKeyboardInputManager_ain keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "externalStringToInternal:byConvertingEagerly:", v10, 1);
    v12 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v12, v13);
    TIInputManager::set_input();
    KB::String::~String((KB::String *)v15);

  }
  return 0;
}

@end
