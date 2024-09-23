@implementation UIDictationMultilingualResults

- (UIDictationMultilingualResults)initWithPhrases:(id)a3 dominantLanguage:(id)a4
{
  id v6;
  id v7;
  UIDictationMultilingualResults *v8;
  uint64_t v9;
  NSArray *phrases;
  uint64_t v11;
  NSString *dominantLanguage;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIDictationMultilingualResults;
  v8 = -[UIDictationMultilingualResults init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    phrases = v8->_phrases;
    v8->_phrases = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    dominantLanguage = v8->_dominantLanguage;
    v8->_dominantLanguage = (NSString *)v11;

  }
  return v8;
}

- (UIDictationMultilingualResults)initWithCoder:(id)a3
{
  id v4;
  UIDictationMultilingualResults *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *phrases;
  uint64_t v11;
  NSString *dominantLanguage;
  UIDictationMultilingualResults *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIDictationMultilingualResults;
  v5 = -[UIDictationMultilingualResults init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("phrases"));
    v9 = objc_claimAutoreleasedReturnValue();
    phrases = v5->_phrases;
    v5->_phrases = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dominantLanguage"));
    v11 = objc_claimAutoreleasedReturnValue();
    dominantLanguage = v5->_dominantLanguage;
    v5->_dominantLanguage = (NSString *)v11;

    v13 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *phrases;
  id v5;

  phrases = self->_phrases;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", phrases, CFSTR("phrases"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dominantLanguage, CFSTR("dominantLanguage"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[UIDictationMultilingualResults dominantLanguage](self, "dominantLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dominantLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[UIDictationMultilingualResults phrases](self, "phrases");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phrases");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[UIDictationMultilingualResults dominantLanguage](self, "dominantLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[UIDictationMultilingualResults phrases](self, "phrases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIDictationMultilingualResults *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(UIDictationMultilingualResults);
  v5 = (void *)-[NSArray copy](self->_phrases, "copy");
  -[UIDictationMultilingualResults setPhrases:](v4, "setPhrases:", v5);

  v6 = (void *)-[NSString copy](self->_dominantLanguage, "copy");
  -[UIDictationMultilingualResults setDominantLanguage:](v4, "setDominantLanguage:", v6);

  return v4;
}

- (NSArray)phrases
{
  return self->_phrases;
}

- (void)setPhrases:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)dominantLanguage
{
  return self->_dominantLanguage;
}

- (void)setDominantLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominantLanguage, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
}

@end
