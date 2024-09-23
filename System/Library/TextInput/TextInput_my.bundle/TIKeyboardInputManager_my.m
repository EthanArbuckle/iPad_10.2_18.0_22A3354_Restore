@implementation TIKeyboardInputManager_my

- (BOOL)doesComposeText
{
  return 1;
}

- (BOOL)deletesComposedTextByComposedCharacterSequence
{
  return 0;
}

- (id)internalStringToExternal:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  if ((unint64_t)objc_msgSend(v4, "length") >= 2
    && objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v4, "length") - 1) == 4145)
  {
    objc_msgSend(v4, "insertString:atIndex:", CFSTR("​"), objc_msgSend(v4, "length") - 1);
  }
  if (InternalToExternalRegex(void)::__onceToken != -1)
    dispatch_once(&InternalToExternalRegex(void)::__onceToken, &__block_literal_global_38);
  v5 = (id)InternalToExternalRegex(void)::__regex;
  v6 = objc_msgSend(v3, "length");
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __54__TIKeyboardInputManager_my_internalStringToExternal___block_invoke;
  v15 = &unk_25012B2F0;
  v16 = v3;
  v7 = v4;
  v17 = v7;
  v8 = v3;
  objc_msgSend(v5, "enumerateMatchesInString:options:range:usingBlock:", v8, 0, 0, v6, &v12);
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("ဦ"), CFSTR("ဦ"), 2, 0, objc_msgSend(v7, "length", v12, v13, v14, v15));
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("ဥ်"), CFSTR("ဉ်"), 2, 0, objc_msgSend(v7, "length"));
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("သြ"), CFSTR("ဩ"), 2, 0, objc_msgSend(v7, "length"));
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("ဩော်"), CFSTR("ဪ"), 2, 0, objc_msgSend(v7, "length"));
  v9 = v17;
  v10 = v7;

  return v10;
}

- (id)externalStringToInternal:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    if (ExternalToInternalRegex(void)::__onceToken != -1)
      dispatch_once(&ExternalToInternalRegex(void)::__onceToken, &__block_literal_global_42);
    v6 = (id)ExternalToInternalRegex(void)::__regex;
    v7 = objc_msgSend(v4, "length");
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __54__TIKeyboardInputManager_my_externalStringToInternal___block_invoke;
    v12[3] = &unk_25012B2F0;
    v13 = v4;
    v8 = v5;
    v14 = v8;
    objc_msgSend(v6, "enumerateMatchesInString:options:range:usingBlock:", v13, 0, 0, v7, v12);
    v9 = v14;
    v10 = v8;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)deleteFromInput:(unint64_t *)a3
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v10;
  const KB::String *v11;
  void *v12;
  NSString *v13;
  const KB::String *v14;
  void *v15;
  void *v16;
  const KB::String *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _BYTE v22[32];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (a3)
    *a3 = 1;
  v5 = (int)*MEMORY[0x24BEB5498];
  if (!*(Class *)((char *)&self->super.super.super.isa + v5))
    return 0;
  v6 = -[TIKeyboardInputManager_my inputIndex](self, "inputIndex");
  if (v6 >= 3
    && (v7 = v6,
        v8 = (int)*MEMORY[0x24BEB5490],
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v8), "length") >= (unint64_t)v6))
  {
    v10 = v7;
    TIInputManager::input_string(*(TIInputManager **)((char *)&self->super.super.super.isa + v5));
    KB::ns_string((KB *)v22, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    KB::String::~String((KB::String *)v22);
    if (objc_msgSend(v12, "hasSuffix:", CFSTR("င်္")))
    {
      KB::utf8_string((KB *)CFSTR("င်္"), v13);
      TIInputManager::delete_suffix_from_input();
      KB::String::~String((KB::String *)v22);
    }
    else
    {
      TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.isa + v5));
    }
    TIInputManager::input_string(*(TIInputManager **)((char *)&self->super.super.super.isa + v5));
    KB::ns_string((KB *)v22, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_my internalStringToExternal:](self, "internalStringToExternal:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    KB::String::~String((KB::String *)v22);
    TIInputManager::input_stem(*(TIInputManager **)((char *)&self->super.super.super.isa + v5));
    KB::ns_string((KB *)v22, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_my internalStringToExternal:](self, "internalStringToExternal:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    KB::String::~String((KB::String *)v22);
    -[TIKeyboardInputManager_my suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:](self, "suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:", v19, *(Class *)((char *)&self->super.super.super.isa + v8), v10, a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v8), "setString:", v16);
    if (!objc_msgSend(v20, "length"))
    {

      v20 = 0;
    }

    return v20;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)TIKeyboardInputManager_my;
    -[TIKeyboardInputManager_my deleteFromInput:](&v21, sel_deleteFromInput_, a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
