@implementation WDSymbol

- (WDSymbol)initWithParagraph:(id)a3
{
  id v4;
  WDSymbol *v5;
  WDCharacterProperties *v6;
  void *v7;
  WDCharacterProperties *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  WDFont *mFont;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WDSymbol;
  v5 = -[WDRunWithCharacterProperties initWithParagraph:](&v14, sel_initWithParagraph_, v4);
  if (v5)
  {
    v6 = [WDCharacterProperties alloc];
    objc_msgSend(v4, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WDCharacterProperties initWithDocument:](v6, "initWithDocument:", v7);
    -[WDRunWithCharacterProperties setProperties:](v5, "setProperties:", v8);

    objc_msgSend(v4, "document");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fontTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "fontWithName:", CFSTR("Symbol"));
    v11 = objc_claimAutoreleasedReturnValue();
    mFont = v5->mFont;
    v5->mFont = (WDFont *)v11;

  }
  return v5;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->mFont, a3);
}

- (void)setCharacter:(unsigned __int16)a3
{
  self->mCharacter = a3;
}

- (int)runType
{
  return 10;
}

- (unsigned)character
{
  return self->mCharacter;
}

- (id)font
{
  return self->mFont;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDSymbol;
  -[WDRun description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFont, 0);
}

@end
