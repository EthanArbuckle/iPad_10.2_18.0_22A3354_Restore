@implementation TIDPNgramWordEntryPair

- (TIDPNgramWordEntryPair)initWithWordString:(id)a3 wordEntryAligned:(id)a4
{
  id v6;
  id v7;
  TIDPNgramWordEntryPair *v8;
  TIDPNgramWordEntryPair *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TIDPNgramWordEntryPair;
  v8 = -[TIDPNgramWordEntryPair init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[TIDPNgramWordEntryPair setWordString:](v8, "setWordString:", v6);
    -[TIDPNgramWordEntryPair setWordEntryAligned:](v9, "setWordEntryAligned:", v7);
  }

  return v9;
}

- (TIDPNgramWordEntryPair)initWithWordString:(id)a3
{
  return -[TIDPNgramWordEntryPair initWithWordString:wordEntryAligned:](self, "initWithWordString:wordEntryAligned:", a3, 0);
}

- (BOOL)isStandaloneString
{
  void *v3;
  BOOL v4;
  void *v5;

  -[TIDPNgramWordEntryPair wordEntryAligned](self, "wordEntryAligned");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[TIDPNgramWordEntryPair wordString](self, "wordString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (NSString)wordString
{
  return self->_wordString;
}

- (void)setWordString:(id)a3
{
  objc_storeStrong((id *)&self->_wordString, a3);
}

- (TIWordEntryAligned)wordEntryAligned
{
  return self->_wordEntryAligned;
}

- (void)setWordEntryAligned:(id)a3
{
  objc_storeStrong((id *)&self->_wordEntryAligned, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordEntryAligned, 0);
  objc_storeStrong((id *)&self->_wordString, 0);
}

@end
