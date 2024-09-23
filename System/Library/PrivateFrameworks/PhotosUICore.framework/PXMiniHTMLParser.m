@implementation PXMiniHTMLParser

- (PXMiniHTMLParser)init
{
  return -[PXMiniHTMLParser initWithString:](self, "initWithString:", 0);
}

- (PXMiniHTMLParser)initWithString:(id)a3
{
  id v5;
  PXMiniHTMLParser *v6;
  PXMiniHTMLParser *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXMiniHTMLParser;
  v6 = -[PXMiniHTMLParser init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->__string, a3);

  return v7;
}

- (void)parse
{
  PXMiniXMLParser *v3;
  void *v4;
  PXMiniXMLParser *v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = [PXMiniXMLParser alloc];
  -[PXMiniHTMLParser _string](self, "_string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXMiniXMLParser initWithString:](v3, "initWithString:", v4);

  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __25__PXMiniHTMLParser_parse__block_invoke;
  v10[3] = &unk_1E51485B0;
  v10[4] = self;
  -[PXMiniXMLParser setParsedCharactersBlock:](v5, "setParsedCharactersBlock:", v10);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __25__PXMiniHTMLParser_parse__block_invoke_2;
  v9[3] = &unk_1E51485D8;
  v9[4] = self;
  -[PXMiniXMLParser setParsedTagBlock:](v5, "setParsedTagBlock:", v9);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __25__PXMiniHTMLParser_parse__block_invoke_3;
  v8[3] = &unk_1E51485B0;
  v8[4] = self;
  -[PXMiniXMLParser setParsedEntityBlock:](v5, "setParsedEntityBlock:", v8);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __25__PXMiniHTMLParser_parse__block_invoke_4;
  v7[3] = &unk_1E5148600;
  v7[4] = self;
  -[PXMiniXMLParser setParsedErrorBlock:](v5, "setParsedErrorBlock:", v7);
  -[PXMiniXMLParser parse](v5, "parse");

}

- (id)parsedCharactersBlock
{
  return self->_parsedCharactersBlock;
}

- (void)setParsedCharactersBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)parsedMarkupElementStartBlock
{
  return self->_parsedMarkupElementStartBlock;
}

- (void)setParsedMarkupElementStartBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)parsedMarkupElementEndBlock
{
  return self->_parsedMarkupElementEndBlock;
}

- (void)setParsedMarkupElementEndBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)parsedErrorBlock
{
  return self->_parsedErrorBlock;
}

- (void)setParsedErrorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)_string
{
  return self->__string;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__string, 0);
  objc_storeStrong(&self->_parsedErrorBlock, 0);
  objc_storeStrong(&self->_parsedMarkupElementEndBlock, 0);
  objc_storeStrong(&self->_parsedMarkupElementStartBlock, 0);
  objc_storeStrong(&self->_parsedCharactersBlock, 0);
}

void __25__PXMiniHTMLParser_parse__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "parsedCharactersBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "parsedCharactersBlock");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v4)[2](v4, v5);

  }
}

void __25__PXMiniHTMLParser_parse__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("b")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("i")))
      goto LABEL_12;
    v5 = 2;
  }
  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "parsedMarkupElementEndBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "parsedMarkupElementEndBlock");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  else if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "parsedMarkupElementStartBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "parsedMarkupElementStartBlock");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v9 = (void *)v7;
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v5);

    }
  }
LABEL_12:

}

void __25__PXMiniHTMLParser_parse__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v3 = a2;
  +[PXMiniHTMLParser charactersForEntityNames](PXMiniHTMLParser, "charactersForEntityNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "parsedCharactersBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "parsedCharactersBlock");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v6)[2](v6, v7);

    }
  }

}

void __25__PXMiniHTMLParser_parse__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "parsedErrorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "parsedErrorBlock");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v4)[2](v4, v5);

  }
}

+ (NSDictionary)charactersForEntityNames
{
  if (charactersForEntityNames_onceToken != -1)
    dispatch_once(&charactersForEntityNames_onceToken, &__block_literal_global_299580);
  return (NSDictionary *)(id)charactersForEntityNames_charactersForEntityNames;
}

+ (id)stringByConvertingToHTML:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__299570;
  v14 = __Block_byref_object_dispose__299571;
  v3 = a3;
  v15 = v3;
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("&"), CFSTR("&amp;"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v11[5];
  v11[5] = v4;

  +[PXMiniHTMLParser charactersForEntityNames](PXMiniHTMLParser, "charactersForEntityNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__PXMiniHTMLParser_stringByConvertingToHTML___block_invoke;
  v9[3] = &unk_1E5148628;
  v9[4] = &v10;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __45__PXMiniHTMLParser_stringByConvertingToHTML___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("&")) & 1) == 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("&%@;"), v10);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByReplacingOccurrencesOfString:withString:", v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

void __44__PXMiniHTMLParser_charactersForEntityNames__block_invoke()
{
  void *v0;

  v0 = (void *)charactersForEntityNames_charactersForEntityNames;
  charactersForEntityNames_charactersForEntityNames = (uint64_t)&unk_1E53F10B0;

}

@end
