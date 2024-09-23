@implementation TIAutoshiftRegularExpressionLoader

- (NSRegularExpression)regex
{
  NSRegularExpression *regex;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSRegularExpression *v7;
  NSRegularExpression *v8;

  regex = self->_regex;
  if (!regex)
  {
    -[TIAutoshiftRegularExpressionLoader sentenceDelimitingCharacters](self, "sentenceDelimitingCharacters");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    -[TIAutoshiftRegularExpressionLoader sentenceTrailingCharacters](self, "sentenceTrailingCharacters");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    -[TIAutoshiftRegularExpressionLoader nextSentencePrefixCharacters](self, "nextSentencePrefixCharacters");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    createAutoshiftRegularExpression(v4, v5, v6);
    v7 = (NSRegularExpression *)objc_claimAutoreleasedReturnValue();
    v8 = self->_regex;
    self->_regex = v7;

    regex = self->_regex;
  }
  return regex;
}

- (TIAutoshiftRegularExpressionLoader)initWithSentenceDelimiters:(id)a3 trailingChars:(id)a4 prefixChars:(id)a5
{
  id v8;
  id v9;
  id v10;
  TIAutoshiftRegularExpressionLoader *v11;
  uint64_t v12;
  NSString *sentenceDelimitingCharacters;
  uint64_t v14;
  NSString *sentenceTrailingCharacters;
  uint64_t v16;
  NSString *nextSentencePrefixCharacters;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TIAutoshiftRegularExpressionLoader;
  v11 = -[TIAutoshiftRegularExpressionLoader init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    sentenceDelimitingCharacters = v11->_sentenceDelimitingCharacters;
    v11->_sentenceDelimitingCharacters = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    sentenceTrailingCharacters = v11->_sentenceTrailingCharacters;
    v11->_sentenceTrailingCharacters = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    nextSentencePrefixCharacters = v11->_nextSentencePrefixCharacters;
    v11->_nextSentencePrefixCharacters = (NSString *)v16;

  }
  return v11;
}

- (void)startBackgroundLoad
{
  void *v2;

  _TIQueueBackground();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIDispatchAsync();

}

- (void)setRegex:(id)a3
{
  objc_storeStrong((id *)&self->_regex, a3);
}

- (NSString)sentenceDelimitingCharacters
{
  return self->_sentenceDelimitingCharacters;
}

- (NSString)sentenceTrailingCharacters
{
  return self->_sentenceTrailingCharacters;
}

- (NSString)nextSentencePrefixCharacters
{
  return self->_nextSentencePrefixCharacters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextSentencePrefixCharacters, 0);
  objc_storeStrong((id *)&self->_sentenceTrailingCharacters, 0);
  objc_storeStrong((id *)&self->_sentenceDelimitingCharacters, 0);
  objc_storeStrong((id *)&self->_regex, 0);
}

void __57__TIAutoshiftRegularExpressionLoader_startBackgroundLoad__block_invoke(uint64_t a1)
{
  NSString *v2;
  NSString *v3;
  NSString *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "sentenceDelimitingCharacters");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sentenceTrailingCharacters");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "nextSentencePrefixCharacters");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  createAutoshiftRegularExpression(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  TIDispatchAsync();

}

uint64_t __57__TIAutoshiftRegularExpressionLoader_startBackgroundLoad__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRegex:", *(_QWORD *)(a1 + 40));
}

+ (TIAutoshiftRegularExpressionLoader)loaderWithSentenceDelimiters:(id)a3 trailingChars:(id)a4 prefixChars:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSentenceDelimiters:trailingChars:prefixChars:", v10, v9, v8);

  return (TIAutoshiftRegularExpressionLoader *)v11;
}

@end
