@implementation WDSpecialCharacter

- (WDSpecialCharacter)initWithParagraph:(id)a3
{
  id v4;
  WDSpecialCharacter *v5;
  WDCharacterProperties *v6;
  void *v7;
  uint64_t v8;
  WDCharacterProperties *mProperties;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WDSpecialCharacter;
  v5 = -[WDRunWithCharacterProperties initWithParagraph:](&v11, sel_initWithParagraph_, v4);
  if (v5)
  {
    v6 = [WDCharacterProperties alloc];
    objc_msgSend(v4, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WDCharacterProperties initWithDocument:](v6, "initWithDocument:", v7);
    mProperties = v5->super.mProperties;
    v5->super.mProperties = (WDCharacterProperties *)v8;

    v5->mType = 0xFFFF;
  }

  return v5;
}

- (void)setCharacterType:(int)a3
{
  self->mType = a3;
}

- (int)runType
{
  return 11;
}

- (int)characterType
{
  return self->mType;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDSpecialCharacter;
  -[WDRun description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
