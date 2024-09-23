@implementation RKLexicalEntity

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[RKLexicalEntity string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKLexicalEntity language](self, "language");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKLexicalEntity partOfSpeech](self, "partOfSpeech");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKLexicalEntity lemma](self, "lemma");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[RKLexicalEntity lemma](self, "lemma");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@{%@,%@,%@}"), v4, v5, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@{%@,%@,%@}"), v4, v5, v6, &stru_24C6B9E08);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (NSString)word
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[RKLexicalEntity internalWord](self, "internalWord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[RKLexicalEntity lemma](self, "lemma");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[RKLexicalEntity lemma](self, "lemma");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RKLexicalEntity setInternalWord:](self, "setInternalWord:", v5);
    }
    else
    {
      -[RKLexicalEntity string](self, "string");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lowercaseString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RKLexicalEntity setInternalWord:](self, "setInternalWord:", v6);

    }
  }
  return -[RKLexicalEntity internalWord](self, "internalWord");
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)tokenType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTokenType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)partOfSpeech
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPartOfSpeech:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)lemma
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLemma:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (_NSRange)tokenRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_tokenRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setTokenRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_tokenRange, &v3, 16, 1, 0);
}

- (NSString)internalWord
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInternalWord:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalWord, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_lemma, 0);
  objc_storeStrong((id *)&self->_partOfSpeech, 0);
  objc_storeStrong((id *)&self->_tokenType, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
