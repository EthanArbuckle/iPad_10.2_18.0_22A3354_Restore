@implementation WDCharacterRun

- (WDCharacterRun)initWithParagraph:(id)a3
{
  id v4;
  WDCharacterRun *v5;
  WDCharacterProperties *v6;
  void *v7;
  WDCharacterProperties *v8;
  NSMutableString *v9;
  NSMutableString *mString;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WDCharacterRun;
  v5 = -[WDRunWithCharacterProperties initWithParagraph:](&v12, sel_initWithParagraph_, v4);
  if (v5)
  {
    v6 = [WDCharacterProperties alloc];
    objc_msgSend(v4, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WDCharacterProperties initWithDocument:](v6, "initWithDocument:", v7);
    -[WDRunWithCharacterProperties setProperties:](v5, "setProperties:", v8);

    v9 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    mString = v5->mString;
    v5->mString = v9;

    v5->mBinaryWriterContentFlag = 0;
  }

  return v5;
}

- (void)setString:(id)a3
{
  -[NSMutableString setString:](self->mString, "setString:", a3);
}

- (int)runType
{
  return 0;
}

- (void)removeLastCharacter:(unsigned __int16)a3
{
  int v3;
  uint64_t v5;
  uint64_t v6;
  NSMutableString *mString;
  id v8;

  v3 = a3;
  v5 = -[NSMutableString length](self->mString, "length");
  if (v5)
  {
    v6 = v5 - 1;
    if (-[NSMutableString characterAtIndex:](self->mString, "characterAtIndex:", v5 - 1) == v3)
    {
      mString = self->mString;
      -[NSMutableString substringWithRange:](mString, "substringWithRange:", 0, v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableString setString:](mString, "setString:");

    }
  }
}

- (id)string
{
  return self->mString;
}

- (void)appendString:(id)a3
{
  -[NSMutableString appendString:](self->mString, "appendString:", a3);
}

- (void)copyPropertiesFrom:(id)a3
{
  WDCharacterProperties *v4;
  WDCharacterProperties *mProperties;
  WDCharacterProperties *v6;
  id *v7;

  v7 = (id *)a3;
  v4 = (WDCharacterProperties *)objc_msgSend(v7[2], "copy");
  mProperties = self->super.mProperties;
  self->super.mProperties = v4;
  v6 = v4;

  objc_msgSend(v7[2], "copyPropertiesInto:", self->super.mProperties);
}

- (BOOL)binaryWriterContentFlag
{
  return self->mBinaryWriterContentFlag;
}

- (void)setBinaryWriterContentFlag:(BOOL)a3
{
  self->mBinaryWriterContentFlag = a3;
}

- (void)setPropertiesForDocument
{
  void *v3;
  void *v4;
  WDCharacterProperties *v5;
  WDCharacterProperties *mProperties;
  id v7;

  -[WDCharacterProperties document](self->super.mProperties, "document");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "styleSheet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultCharacterProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (WDCharacterProperties *)objc_msgSend(v4, "copy");
  mProperties = self->super.mProperties;
  self->super.mProperties = v5;

}

- (void)clearString
{
  NSMutableString *mString;

  mString = self->mString;
  self->mString = 0;

}

- (WDCharacterRun)initWithParagraph:(id)a3 string:(id)a4
{
  id v6;
  id v7;
  WDCharacterRun *v8;
  WDCharacterRun *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[WDCharacterRun initWithParagraph:](self, "initWithParagraph:", v6);
  v9 = v8;
  if (v8)
    -[NSMutableString setString:](v8->mString, "setString:", v7);

  return v9;
}

- (BOOL)isEmpty
{
  return -[NSMutableString length](self->mString, "length") == 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDCharacterRun;
  -[WDRun description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mString, 0);
}

@end
