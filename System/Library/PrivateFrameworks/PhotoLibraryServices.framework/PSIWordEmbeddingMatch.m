@implementation PSIWordEmbeddingMatch

- (PSIWordEmbeddingMatch)initWithWord:(id)a3 extendedWord:(id)a4 score:(double)a5
{
  id v9;
  id v10;
  PSIWordEmbeddingMatch *v11;
  PSIWordEmbeddingMatch *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PSIWordEmbeddingMatch;
  v11 = -[PSIWordEmbeddingMatch init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_word, a3);
    objc_storeStrong((id *)&v12->_extendedWord, a4);
    v12->_score = a5;
  }

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <- %@ (%f)"), self->_word, self->_extendedWord, *(_QWORD *)&self->_score);
}

- (PSIWordEmbeddingMatch)initWithCoder:(id)a3
{
  id v4;
  PSIWordEmbeddingMatch *v5;
  uint64_t v6;
  NSString *word;
  uint64_t v8;
  NSString *extendedWord;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PSIWordEmbeddingMatch;
  v5 = -[PSIWordEmbeddingMatch init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("word"));
    v6 = objc_claimAutoreleasedReturnValue();
    word = v5->_word;
    v5->_word = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extendedWord"));
    v8 = objc_claimAutoreleasedReturnValue();
    extendedWord = v5->_extendedWord;
    v5->_extendedWord = (NSString *)v8;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("score"));
    v5->_score = v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *word;
  id v5;

  word = self->_word;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", word, CFSTR("word"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extendedWord, CFSTR("extendedWord"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("score"), self->_score);

}

- (NSString)word
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)extendedWord
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (double)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedWord, 0);
  objc_storeStrong((id *)&self->_word, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
