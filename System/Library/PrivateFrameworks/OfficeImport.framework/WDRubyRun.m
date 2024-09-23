@implementation WDRubyRun

- (WDRubyRun)initWithParagraph:(id)a3
{
  id v4;
  WDRubyRun *v5;
  WDCharacterRun *v6;
  WDCharacterRun *mPhoneticRun;
  WDRubyProperties *v8;
  WDRubyProperties *mRubyProperties;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WDRubyRun;
  v5 = -[WDCharacterRun initWithParagraph:](&v11, sel_initWithParagraph_, v4);
  if (v5)
  {
    v6 = -[WDCharacterRun initWithParagraph:]([WDCharacterRun alloc], "initWithParagraph:", v4);
    mPhoneticRun = v5->mPhoneticRun;
    v5->mPhoneticRun = v6;

    v8 = objc_alloc_init(WDRubyProperties);
    mRubyProperties = v5->mRubyProperties;
    v5->mRubyProperties = v8;

  }
  return v5;
}

- (int)runType
{
  return 14;
}

- (id)rubyProperties
{
  return self->mRubyProperties;
}

- (id)phoneticRun
{
  return self->mPhoneticRun;
}

- (id)phoneticRunString
{
  return -[WDCharacterRun string](self->mPhoneticRun, "string");
}

- (void)setPhoneticRunString:(id)a3
{
  -[WDCharacterRun setString:](self->mPhoneticRun, "setString:", a3);
}

- (void)appendPhoneticRunString:(id)a3
{
  -[WDCharacterRun appendString:](self->mPhoneticRun, "appendString:", a3);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDRubyRun;
  -[WDCharacterRun description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRubyProperties, 0);
  objc_storeStrong((id *)&self->mPhoneticRun, 0);
}

@end
