@implementation PXMiniXMLParser

- (PXMiniXMLParser)init
{
  return -[PXMiniXMLParser initWithString:](self, "initWithString:", 0);
}

- (PXMiniXMLParser)initWithString:(id)a3
{
  id v4;
  PXMiniXMLParser *v5;
  uint64_t v6;
  NSScanner *scanner;
  uint64_t v8;
  NSCharacterSet *syntaxMarkerCharactersSet;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXMiniXMLParser;
  v5 = -[PXMiniXMLParser init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v4);
    scanner = v5->__scanner;
    v5->__scanner = (NSScanner *)v6;

    -[NSScanner setCharactersToBeSkipped:](v5->__scanner, "setCharactersToBeSkipped:", 0);
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("<&"));
    v8 = objc_claimAutoreleasedReturnValue();
    syntaxMarkerCharactersSet = v5->__syntaxMarkerCharactersSet;
    v5->__syntaxMarkerCharactersSet = (NSCharacterSet *)v8;

  }
  return v5;
}

- (void)parse
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);

  if (!-[PXMiniXMLParser _isAtEnd](self, "_isAtEnd"))
  {
    while (1)
    {
      if (!-[PXMiniXMLParser _parseCharacters](self, "_parseCharacters")
        && !-[PXMiniXMLParser _parseTag](self, "_parseTag")
        && !-[PXMiniXMLParser _parseEntity](self, "_parseEntity"))
      {
        -[PXMiniXMLParser parsedErrorBlock](self, "parsedErrorBlock");
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        if (v3)
          break;
      }
      if (-[PXMiniXMLParser _isAtEnd](self, "_isAtEnd"))
        goto LABEL_7;
    }
    -[PXMiniXMLParser parsedErrorBlock](self, "parsedErrorBlock");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0);

  }
LABEL_7:
  -[PXMiniXMLParser setParsedCharactersBlock:](self, "setParsedCharactersBlock:", 0);
  -[PXMiniXMLParser setParsedTagBlock:](self, "setParsedTagBlock:", 0);
  -[PXMiniXMLParser setParsedEntityBlock:](self, "setParsedEntityBlock:", 0);
  -[PXMiniXMLParser setParsedErrorBlock:](self, "setParsedErrorBlock:", 0);
}

- (BOOL)_isAtEnd
{
  void *v2;
  char v3;

  -[PXMiniXMLParser _scanner](self, "_scanner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAtEnd");

  return v3;
}

- (BOOL)_parseCharacters
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__PXMiniXMLParser__parseCharacters__block_invoke;
  v3[3] = &unk_1E5142110;
  v3[4] = self;
  return -[PXMiniXMLParser _tryScanningUsingBlock:](self, "_tryScanningUsingBlock:", v3);
}

- (BOOL)_parseTag
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__PXMiniXMLParser__parseTag__block_invoke;
  v3[3] = &unk_1E5142110;
  v3[4] = self;
  return -[PXMiniXMLParser _tryScanningUsingBlock:](self, "_tryScanningUsingBlock:", v3);
}

- (BOOL)_parseEntity
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__PXMiniXMLParser__parseEntity__block_invoke;
  v3[3] = &unk_1E5142110;
  v3[4] = self;
  return -[PXMiniXMLParser _tryScanningUsingBlock:](self, "_tryScanningUsingBlock:", v3);
}

- (BOOL)_tryScanningUsingBlock:(id)a3
{
  uint64_t (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  char v7;

  v4 = (uint64_t (**)(id, void *))a3;
  -[PXMiniXMLParser _scanner](self, "_scanner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "scanLocation");
  v7 = v4[2](v4, v5);

  if ((v7 & 1) == 0)
    objc_msgSend(v5, "setScanLocation:", v6);

  return v7;
}

- (id)parsedCharactersBlock
{
  return self->_parsedCharactersBlock;
}

- (void)setParsedCharactersBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)parsedTagBlock
{
  return self->_parsedTagBlock;
}

- (void)setParsedTagBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)parsedEntityBlock
{
  return self->_parsedEntityBlock;
}

- (void)setParsedEntityBlock:(id)a3
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

- (NSScanner)_scanner
{
  return self->__scanner;
}

- (NSCharacterSet)_syntaxMarkerCharactersSet
{
  return self->__syntaxMarkerCharactersSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__syntaxMarkerCharactersSet, 0);
  objc_storeStrong((id *)&self->__scanner, 0);
  objc_storeStrong(&self->_parsedErrorBlock, 0);
  objc_storeStrong(&self->_parsedEntityBlock, 0);
  objc_storeStrong(&self->_parsedTagBlock, 0);
  objc_storeStrong(&self->_parsedCharactersBlock, 0);
}

uint64_t __31__PXMiniXMLParser__parseEntity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  id v11;

  v3 = a2;
  if (objc_msgSend(v3, "scanString:intoString:", CFSTR("&"), 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v5 = objc_msgSend(v3, "scanCharactersFromSet:intoString:", v4, &v11);
    v6 = v11;

    if (v5 && objc_msgSend(v3, "scanString:intoString:", CFSTR(";"), 0))
    {
      objc_msgSend(*(id *)(a1 + 32), "parsedEntityBlock");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 32), "parsedEntityBlock");
        v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id))v8)[2](v8, v6);

      }
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
    v6 = 0;
  }

  return v9;
}

uint64_t __28__PXMiniXMLParser__parseTag__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  char v5;
  char v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  uint64_t v13;
  id v15;

  v3 = a2;
  v4 = objc_msgSend(v3, "scanString:intoString:", CFSTR("<"), 0);
  v5 = objc_msgSend(v3, "scanString:intoString:", CFSTR("/"), 0);
  v6 = v5;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v8 = objc_msgSend(v3, "scanCharactersFromSet:intoString:", v7, &v15);
    v9 = v15;

    if ((v6 & 1) == 0)
      goto LABEL_3;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if (objc_msgSend(v3, "scanString:intoString:", CFSTR("/"), 0))
        v10 = 2;
      else
        v10 = 0;
      if (!v8)
        goto LABEL_14;
      goto LABEL_10;
    }
  }
  v10 = 1;
  if (!v8)
  {
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
LABEL_10:
  if (!objc_msgSend(v3, "scanString:intoString:", CFSTR(">"), 0))
    goto LABEL_14;
  objc_msgSend(*(id *)(a1 + 32), "parsedTagBlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "parsedTagBlock");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, id))v12)[2](v12, v10, v9);

  }
  v13 = 1;
LABEL_15:

  return v13;
}

uint64_t __35__PXMiniXMLParser__parseCharacters__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_syntaxMarkerCharactersSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v4, "scanUpToCharactersFromSet:intoString:", v5, &v11);

  v7 = v11;
  if ((_DWORD)v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "parsedCharactersBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "parsedCharactersBlock");
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v9)[2](v9, v7);

    }
  }

  return v6;
}

@end
