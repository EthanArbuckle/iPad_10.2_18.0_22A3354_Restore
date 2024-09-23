@implementation SSDictionaryResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.dictionary");
}

- (SSDictionaryResultBuilder)initWithResult:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSDictionaryResultBuilder;
  return -[SSResultBuilder initWithResult:](&v4, sel_initWithResult_, a3);
}

- (id)buildCompactCardSection
{
  return 0;
}

- (id)buildInlineCardSection
{
  return 0;
}

- (id)buildTitle
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  -[SSDictionaryResultBuilder word](self, "word");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D8C3D0], "textWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsEmphasized:", 1);
    objc_msgSend(v3, "addObject:", v5);

  }
  -[SSDictionaryResultBuilder dictionaryName](self, "dictionaryName");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = isMacOS();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D8C3D0], "textWithString:", CFSTR(" — "));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v9);

      v10 = (void *)MEMORY[0x1E0D8C3D0];
      -[SSDictionaryResultBuilder dictionaryName](self, "dictionaryName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textWithString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v12);

    }
  }
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setFormattedTextPieces:", v3);

  return v13;
}

- (id)buildDescriptions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D8C660];
  -[SSDictionaryResultBuilder definitionString](self, "definitionString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)buildCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[SSDictionaryResultBuilder dictionaryURL](self, "dictionaryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v5 = (void *)MEMORY[0x1E0D8C5E0];
    -[SSDictionaryResultBuilder dictionaryURL](self, "dictionaryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "punchoutWithURL:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPunchout:", v7);

    return v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SSDictionaryResultBuilder;
    -[SSResultBuilder buildCommand](&v9, sel_buildCommand);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (NSString)definitionString
{
  NSString *definitionString;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  unint64_t v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  NSString *v23;
  SSDictionaryResultBuilder *v25;

  definitionString = self->_definitionString;
  if (!definitionString)
  {
    v25 = self;
    -[SSDictionaryResultBuilder definitions](self, "definitions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    v6 = objc_msgSend(v4, "count");
    v7 = 2;
    if (v6 < 2)
      v7 = v6;
    if (v7)
    {
      v8 = 0;
      do
      {
        if (definitionString_onceToken != -1)
          dispatch_once(&definitionString_onceToken, &__block_literal_global_6);
        v9 = &stru_1E6E549F0;
        if ((unint64_t)objc_msgSend(v4, "count") >= 2)
        {
          v10 = (void *)MEMORY[0x1E0CB3940];
          v11 = (void *)definitionString_numberFormatter;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8 + 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringFromNumber:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringWithFormat:", CFSTR("%@. "), v13);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        v14 = &stru_1E6E549F0;
        if (v8 == 1)
        {
          v15 = objc_msgSend(v4, "count");
          v14 = CFSTR("…");
          if (v15 <= 2)
            v14 = &stru_1E6E549F0;
        }
        v16 = (void *)MEMORY[0x1E0CB3940];
        v17 = v14;
        objc_msgSend(v4, "objectAtIndexedSubscript:", v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@%@%@"), v9, v18, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v19);
        ++v8;
        v20 = objc_msgSend(v4, "count");
        v21 = 2;
        if (v20 < 2)
          v21 = v20;
      }
      while (v8 < v21);
    }
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" "));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v25->_definitionString;
    v25->_definitionString = (NSString *)v22;

    definitionString = v25->_definitionString;
  }
  return definitionString;
}

uint64_t __45__SSDictionaryResultBuilder_definitionString__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)definitionString_numberFormatter;
  definitionString_numberFormatter = v0;

  return objc_msgSend((id)definitionString_numberFormatter, "setNumberStyle:", 1);
}

- (void)setDefinitionString:(id)a3
{
  objc_storeStrong((id *)&self->_definitionString, a3);
}

- (NSArray)definitions
{
  return self->_definitions;
}

- (void)setDefinitions:(id)a3
{
  objc_storeStrong((id *)&self->_definitions, a3);
}

- (NSString)dictionaryName
{
  return self->_dictionaryName;
}

- (void)setDictionaryName:(id)a3
{
  objc_storeStrong((id *)&self->_dictionaryName, a3);
}

- (NSString)word
{
  return self->_word;
}

- (void)setWord:(id)a3
{
  objc_storeStrong((id *)&self->_word, a3);
}

- (NSURL)dictionaryURL
{
  return self->_dictionaryURL;
}

- (void)setDictionaryURL:(id)a3
{
  objc_storeStrong((id *)&self->_dictionaryURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryURL, 0);
  objc_storeStrong((id *)&self->_word, 0);
  objc_storeStrong((id *)&self->_dictionaryName, 0);
  objc_storeStrong((id *)&self->_definitions, 0);
  objc_storeStrong((id *)&self->_definitionString, 0);
}

@end
