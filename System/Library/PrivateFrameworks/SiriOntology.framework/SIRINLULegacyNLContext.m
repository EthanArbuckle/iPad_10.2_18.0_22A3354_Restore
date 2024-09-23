@implementation SIRINLULegacyNLContext

- (SIRINLULegacyNLContext)initWithDictationPrompt:(BOOL)a3 strictPrompt:(BOOL)a4 previousDomainName:(id)a5 listenAfterSpeaking:(BOOL)a6
{
  return -[SIRINLULegacyNLContext initWithDictationPrompt:strictPrompt:previousDomainName:listenAfterSpeaking:renderedTexts:legacyContextSource:](self, "initWithDictationPrompt:strictPrompt:previousDomainName:listenAfterSpeaking:renderedTexts:legacyContextSource:", a3, a4, a5, a6, 0, 0);
}

- (SIRINLULegacyNLContext)initWithDictationPrompt:(BOOL)a3 strictPrompt:(BOOL)a4 previousDomainName:(id)a5 listenAfterSpeaking:(BOOL)a6 renderedTexts:(id)a7
{
  return -[SIRINLULegacyNLContext initWithDictationPrompt:strictPrompt:previousDomainName:listenAfterSpeaking:renderedTexts:legacyContextSource:](self, "initWithDictationPrompt:strictPrompt:previousDomainName:listenAfterSpeaking:renderedTexts:legacyContextSource:", a3, a4, a5, a6, a7, 0);
}

- (SIRINLULegacyNLContext)initWithDictationPrompt:(BOOL)a3 strictPrompt:(BOOL)a4 previousDomainName:(id)a5 listenAfterSpeaking:(BOOL)a6 renderedTexts:(id)a7 legacyContextSource:(int)a8
{
  id v15;
  id v16;
  SIRINLULegacyNLContext *v17;
  SIRINLULegacyNLContext *v18;
  objc_super v20;

  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)SIRINLULegacyNLContext;
  v17 = -[SIRINLULegacyNLContext init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_dictationPrompt = a3;
    v17->_strictPrompt = a4;
    objc_storeStrong((id *)&v17->_previousDomainName, a5);
    v18->_listenAfterSpeaking = a6;
    objc_storeStrong((id *)&v18->_renderedTexts, a7);
    v18->_legacyContextSource = a8;
  }

  return v18;
}

- (SIRINLULegacyNLContext)initWithCoder:(id)a3
{
  id v4;
  SIRINLULegacyNLContext *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *previousDomainName;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *renderedTexts;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SIRINLULegacyNLContext;
  v5 = -[SIRINLULegacyNLContext init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dictationPrompt"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_dictationPrompt = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("strictPrompt"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_strictPrompt = objc_msgSend(v7, "BOOLValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previousDomainName"));
    v8 = objc_claimAutoreleasedReturnValue();
    previousDomainName = v5->_previousDomainName;
    v5->_previousDomainName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("listenAfterSpeaking"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_listenAfterSpeaking = objc_msgSend(v10, "BOOLValue");
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("renderedTexts"));
    v14 = objc_claimAutoreleasedReturnValue();
    renderedTexts = v5->_renderedTexts;
    v5->_renderedTexts = (NSArray *)v14;

    v5->_legacyContextSource = objc_msgSend(v4, "decodeIntForKey:", CFSTR("legacyContextSource"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 dictationPrompt;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  dictationPrompt = self->_dictationPrompt;
  v6 = a3;
  objc_msgSend(v4, "numberWithBool:", dictationPrompt);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("dictationPrompt"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_strictPrompt);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("strictPrompt"));
  -[SIRINLULegacyNLContext previousDomainName](self, "previousDomainName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("previousDomainName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_listenAfterSpeaking);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("listenAfterSpeaking"));
  -[SIRINLULegacyNLContext renderedTexts](self, "renderedTexts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("renderedTexts"));

  objc_msgSend(v6, "encodeInt:forKey:", -[SIRINLULegacyNLContext legacyContextSource](self, "legacyContextSource"), CFSTR("legacyContextSource"));
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), -[SIRINLULegacyNLContext dictationPrompt](self, "dictationPrompt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), -[SIRINLULegacyNLContext strictPrompt](self, "strictPrompt"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), -[SIRINLULegacyNLContext listenAfterSpeaking](self, "listenAfterSpeaking"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLULegacyNLContext renderedTexts](self, "renderedTexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", v6, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), -[SIRINLULegacyNLContext legacyContextSource](self, "legacyContextSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  -[SIRINLULegacyNLContext previousDomainName](self, "previousDomainName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("{LegacyNLContext\n  dictationPrompt: %@\n  strictPrompt: %@\n  previousDomainName: %@\n  listenAfterSpeaking: %@\n  renderedTexts:\n%@\n  legacyContextSource: %@\n}"), v3, v4, v10, v5, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)dictationPrompt
{
  return self->_dictationPrompt;
}

- (void)setDictationPrompt:(BOOL)a3
{
  self->_dictationPrompt = a3;
}

- (BOOL)strictPrompt
{
  return self->_strictPrompt;
}

- (void)setStrictPrompt:(BOOL)a3
{
  self->_strictPrompt = a3;
}

- (NSString)previousDomainName
{
  return self->_previousDomainName;
}

- (void)setPreviousDomainName:(id)a3
{
  objc_storeStrong((id *)&self->_previousDomainName, a3);
}

- (BOOL)listenAfterSpeaking
{
  return self->_listenAfterSpeaking;
}

- (void)setListenAfterSpeaking:(BOOL)a3
{
  self->_listenAfterSpeaking = a3;
}

- (NSArray)renderedTexts
{
  return self->_renderedTexts;
}

- (void)setRenderedTexts:(id)a3
{
  objc_storeStrong((id *)&self->_renderedTexts, a3);
}

- (BOOL)fromPommes
{
  return self->_fromPommes;
}

- (void)setFromPommes:(BOOL)a3
{
  self->_fromPommes = a3;
}

- (int)legacyContextSource
{
  return self->_legacyContextSource;
}

- (void)setLegacyContextSource:(int)a3
{
  self->_legacyContextSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderedTexts, 0);
  objc_storeStrong((id *)&self->_previousDomainName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
