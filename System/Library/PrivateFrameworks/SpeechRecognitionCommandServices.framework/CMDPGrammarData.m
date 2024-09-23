@implementation CMDPGrammarData

- (CMDPGrammarData)initWithGrammarDataWord:(id)a3 lmIdentifer:(id)a4 commandIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  CMDPGrammarData *v12;
  CMDPGrammarData *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CMDPGrammarData;
  v12 = -[CMDPGrammarData init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_word, a3);
    objc_storeStrong((id *)&v13->_builtInLMIdentifier, a4);
    objc_storeStrong((id *)&v13->_commandIdentifier, a5);
  }

  return v13;
}

- (NSString)commandIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)builtInLMIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)word
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_word, 0);
  objc_storeStrong((id *)&self->_builtInLMIdentifier, 0);
  objc_storeStrong((id *)&self->_commandIdentifier, 0);
}

@end
