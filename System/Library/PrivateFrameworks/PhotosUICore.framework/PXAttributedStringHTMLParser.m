@implementation PXAttributedStringHTMLParser

- (PXAttributedStringHTMLParser)init
{
  return -[PXAttributedStringHTMLParser initWithHTMLString:defaultAttributes:](self, "initWithHTMLString:defaultAttributes:", &stru_1E5149688, 0);
}

- (PXAttributedStringHTMLParser)initWithHTMLString:(id)a3 defaultAttributes:(id)a4
{
  id v6;
  id v7;
  PXAttributedStringHTMLParser *v8;
  uint64_t v9;
  NSString *htmlString;
  uint64_t v11;
  NSDictionary *defaultAttributes;
  uint64_t v13;
  NSCountedSet *currentMarkupElements;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXAttributedStringHTMLParser;
  v8 = -[PXAttributedStringHTMLParser init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    htmlString = v8->__htmlString;
    v8->__htmlString = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    defaultAttributes = v8->__defaultAttributes;
    v8->__defaultAttributes = (NSDictionary *)v11;

    objc_msgSend(MEMORY[0x1E0CB3550], "setWithCapacity:", 3);
    v13 = objc_claimAutoreleasedReturnValue();
    currentMarkupElements = v8->__currentMarkupElements;
    v8->__currentMarkupElements = (NSCountedSet *)v13;

    objc_storeStrong((id *)&v8->__currentAttributes, v8->__defaultAttributes);
  }

  return v8;
}

- (void)parse
{
  PXMiniHTMLParser *v3;
  void *v4;
  PXMiniHTMLParser *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = [PXMiniHTMLParser alloc];
  -[PXAttributedStringHTMLParser _htmlString](self, "_htmlString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXMiniHTMLParser initWithString:](v3, "initWithString:", v4);

  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__PXAttributedStringHTMLParser_parse__block_invoke;
  v10[3] = &unk_1E51485B0;
  v10[4] = self;
  -[PXMiniHTMLParser setParsedCharactersBlock:](v5, "setParsedCharactersBlock:", v10);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __37__PXAttributedStringHTMLParser_parse__block_invoke_2;
  v9[3] = &unk_1E51438B0;
  v9[4] = self;
  -[PXMiniHTMLParser setParsedMarkupElementStartBlock:](v5, "setParsedMarkupElementStartBlock:", v9);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __37__PXAttributedStringHTMLParser_parse__block_invoke_3;
  v8[3] = &unk_1E51438B0;
  v8[4] = self;
  -[PXMiniHTMLParser setParsedMarkupElementEndBlock:](v5, "setParsedMarkupElementEndBlock:", v8);
  -[PXAttributedStringHTMLParser parsedErrorBlock](self, "parsedErrorBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMiniHTMLParser setParsedErrorBlock:](v5, "setParsedErrorBlock:", v7);

  -[PXMiniHTMLParser parse](v5, "parse");
}

- (void)_updateCurrentTraits
{
  int v3;
  id v4;

  -[PXAttributedStringHTMLParser _currentMarkupElements](self, "_currentMarkupElements");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", &unk_1E53ED440))
    v3 = 2;
  else
    v3 = 0;
  -[PXAttributedStringHTMLParser _setCurrentTraits:](self, "_setCurrentTraits:", v3 | objc_msgSend(v4, "containsObject:", &unk_1E53ED458));

}

- (void)_setCurrentTraits:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  if (self->__currentTraits != a3)
  {
    v3 = *(_QWORD *)&a3;
    self->__currentTraits = a3;
    if (a3 == 1)
    {
      -[PXAttributedStringHTMLParser italicizedAttributes](self, "italicizedAttributes");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 2)
        goto LABEL_7;
      -[PXAttributedStringHTMLParser emphasizedAttributes](self, "emphasizedAttributes");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (id)v5;
    if (v5)
    {
LABEL_10:
      v15 = v6;
      -[PXAttributedStringHTMLParser _setCurrentAttributes:](self, "_setCurrentAttributes:", v6);

      return;
    }
LABEL_7:
    -[PXAttributedStringHTMLParser _defaultAttributes](self, "_defaultAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0DC1138];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v9, "fontDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fontDescriptorWithSymbolicTraits:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pointSize");
    objc_msgSend(v10, "fontWithDescriptor:size:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v7);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v8);

    v6 = v14;
    goto LABEL_10;
  }
}

- (NSDictionary)emphasizedAttributes
{
  return self->_emphasizedAttributes;
}

- (void)setEmphasizedAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)italicizedAttributes
{
  return self->_italicizedAttributes;
}

- (void)setItalicizedAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)parsedAttributedStringBlock
{
  return self->_parsedAttributedStringBlock;
}

- (void)setParsedAttributedStringBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)parsedErrorBlock
{
  return self->_parsedErrorBlock;
}

- (void)setParsedErrorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)_htmlString
{
  return self->__htmlString;
}

- (NSDictionary)_defaultAttributes
{
  return self->__defaultAttributes;
}

- (NSCountedSet)_currentMarkupElements
{
  return self->__currentMarkupElements;
}

- (unsigned)_currentTraits
{
  return self->__currentTraits;
}

- (NSDictionary)_currentAttributes
{
  return self->__currentAttributes;
}

- (void)_setCurrentAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentAttributes, 0);
  objc_storeStrong((id *)&self->__currentMarkupElements, 0);
  objc_storeStrong((id *)&self->__defaultAttributes, 0);
  objc_storeStrong((id *)&self->__htmlString, 0);
  objc_storeStrong(&self->_parsedErrorBlock, 0);
  objc_storeStrong(&self->_parsedAttributedStringBlock, 0);
  objc_storeStrong((id *)&self->_italicizedAttributes, 0);
  objc_storeStrong((id *)&self->_emphasizedAttributes, 0);
}

void __37__PXAttributedStringHTMLParser_parse__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "parsedAttributedStringBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_currentAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v4);
    objc_msgSend(*(id *)(a1 + 32), "parsedAttributedStringBlock");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v6)[2](v6, v5);

  }
}

uint64_t __37__PXAttributedStringHTMLParser_parse__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_currentMarkupElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentTraits");
}

uint64_t __37__PXAttributedStringHTMLParser_parse__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_currentMarkupElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentTraits");
}

+ (id)stringByConvertingToHTML:(id)a3
{
  return +[PXMiniHTMLParser stringByConvertingToHTML:](PXMiniHTMLParser, "stringByConvertingToHTML:", a3);
}

@end
