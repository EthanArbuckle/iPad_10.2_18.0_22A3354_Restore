@implementation WBSLocalePair

- (WBSLocalePair)initWithSourceLocale:(id)a3 targetLocale:(id)a4
{
  id v7;
  id v8;
  WBSLocalePair *v9;
  WBSLocalePair *v10;
  WBSLocalePair *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSLocalePair;
  v9 = -[WBSLocalePair init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceLocale, a3);
    objc_storeStrong((id *)&v10->_targetLocale, a4);
    v11 = v10;
  }

  return v10;
}

- (WBSLocalePair)initWithSourceLocaleIdentifier:(id)a3 targetLocaleIdentifier:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  WBSLocalePair *v10;

  v6 = (void *)MEMORY[0x1E0C99DC8];
  v7 = a4;
  objc_msgSend(v6, "localeWithLocaleIdentifier:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[WBSLocalePair initWithSourceLocale:targetLocale:](self, "initWithSourceLocale:targetLocale:", v8, v9);
  return v10;
}

- (WBSLocalePair)initWithLTLocalePair:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WBSLocalePair *v7;

  v4 = a3;
  objc_msgSend(v4, "sourceLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WBSLocalePair initWithSourceLocale:targetLocale:](self, "initWithSourceLocale:targetLocale:", v5, v6);
  return v7;
}

- (NSString)sourceLocaleIdentifier
{
  return -[NSLocale localeIdentifier](self->_sourceLocale, "localeIdentifier");
}

- (NSString)targetLocaleIdentifier
{
  return -[NSLocale localeIdentifier](self->_targetLocale, "localeIdentifier");
}

- (_LTLocalePair)lt_localePair
{
  return (_LTLocalePair *)(id)objc_msgSend(objc_alloc(get_LTLocalePairClass()), "initWithSourceLocale:targetLocale:", self->_sourceLocale, self->_targetLocale);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[WBSLocalePair sourceLocaleIdentifier](self, "sourceLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSLocalePair targetLocaleIdentifier](self, "targetLocaleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; sourceLocale = %@; targetLocale = %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)compactDescriptionForLogging
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WBSLocalePair sourceLocaleIdentifier](self, "sourceLocaleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSLocalePair targetLocaleIdentifier](self, "targetLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ > %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSLocale)sourceLocale
{
  return self->_sourceLocale;
}

- (NSLocale)targetLocale
{
  return self->_targetLocale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLocale, 0);
  objc_storeStrong((id *)&self->_sourceLocale, 0);
}

@end
