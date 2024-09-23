@implementation TIInputModeParser

- (TIInputModeParser)init
{
  TIInputModeParser *v2;
  uint64_t v3;
  NSMutableDictionary *inputModeDicts;
  NSCharacterSet *v5;
  NSCharacterSet *invalidCharacterSet;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIInputModeParser;
  v2 = -[TIInputModeParser init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    inputModeDicts = v2->_inputModeDicts;
    v2->_inputModeDicts = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0CB3780], "characterSetWithCharactersInString:", CFSTR("_"));
    v5 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    -[NSCharacterSet addCharactersInRange:](v5, "addCharactersInRange:", 97, 26);
    -[NSCharacterSet addCharactersInRange:](v5, "addCharactersInRange:", 65, 26);
    -[NSCharacterSet addCharactersInRange:](v5, "addCharactersInRange:", 48, 10);
    -[NSCharacterSet invert](v5, "invert");
    invalidCharacterSet = v2->_invalidCharacterSet;
    v2->_invalidCharacterSet = v5;

  }
  return v2;
}

- (id)parseInputMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_inputModeDicts, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    TIInputModeGetLanguageWithRegion(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIInputModeParser stringByReplacingInvalidCharactersWithUnderscores:](self, "stringByReplacingInvalidCharactersWithUnderscores:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    TIInputModeGetComponentsFromIdentifier(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("sw"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIInputModeParser stringByReplacingInvalidCharactersWithUnderscores:](self, "stringByReplacingInvalidCharactersWithUnderscores:", v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKey:", CFSTR("hw"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIInputModeParser stringByReplacingInvalidCharactersWithUnderscores:](self, "stringByReplacingInvalidCharactersWithUnderscores:", v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v17[0] = v7;
    v16[0] = CFSTR("language");
    v16[1] = CFSTR("softwareLayout");
    if (v10 || objc_msgSend(0, "length"))
      v13 = v10;
    else
      v13 = CFSTR("Automatic");
    v17[1] = v13;
    v16[2] = CFSTR("hardwareLayout");
    if (v12 || objc_msgSend(0, "length"))
      v14 = v12;
    else
      v14 = CFSTR("Automatic");
    v17[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_inputModeDicts, "setObject:forKey:", v5, v4);

  }
  return v5;
}

- (id)stringByReplacingInvalidCharactersWithUnderscores:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length")
    && objc_msgSend(v4, "rangeOfCharacterFromSet:", self->_invalidCharacterSet) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "_stringByReplacingCharactersInSet:withCharacter:", self->_invalidCharacterSet, 95);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidCharacterSet, 0);
  objc_storeStrong((id *)&self->_inputModeDicts, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6637 != -1)
    dispatch_once(&sharedInstance_onceToken_6637, &__block_literal_global_6638);
  return (id)sharedInstance_instance;
}

void __35__TIInputModeParser_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = v0;

}

@end
