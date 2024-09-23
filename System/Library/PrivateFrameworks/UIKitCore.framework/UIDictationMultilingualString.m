@implementation UIDictationMultilingualString

- (UIDictationMultilingualString)initWithText:(id)a3 forLanguage:(id)a4
{
  id v6;
  id v7;
  UIDictationMultilingualString *v8;
  uint64_t v9;
  NSString *text;
  uint64_t v11;
  NSString *dominantLanguage;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIDictationMultilingualString;
  v8 = -[UIDictationMultilingualString init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    text = v8->_text;
    v8->_text = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    dominantLanguage = v8->_dominantLanguage;
    v8->_dominantLanguage = (NSString *)v11;

  }
  return v8;
}

- (UIDictationMultilingualString)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIDictationMultilingualString *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("language"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[UIDictationMultilingualString initWithText:forLanguage:](self, "initWithText:forLanguage:", v5, v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (UIDictationMultilingualString)initWithCoder:(id)a3
{
  id v4;
  UIDictationMultilingualString *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  NSString *dominantLanguage;
  UIDictationMultilingualString *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIDictationMultilingualString;
  v5 = -[UIDictationMultilingualString init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("language"));
    v8 = objc_claimAutoreleasedReturnValue();
    dominantLanguage = v5->_dominantLanguage;
    v5->_dominantLanguage = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;

  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("text"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dominantLanguage, CFSTR("language"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  UIDictationMultilingualString *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(UIDictationMultilingualString);
  v5 = (void *)-[NSString copy](self->_text, "copy");
  -[UIDictationMultilingualString setText:](v4, "setText:", v5);

  v6 = (void *)-[NSString copy](self->_dominantLanguage, "copy");
  -[UIDictationMultilingualString setDominantLanguage:](v4, "setDominantLanguage:", v6);

  -[UIDictationMultilingualString setCorrectionIdentifier:](v4, "setCorrectionIdentifier:", self->_correctionIdentifier);
  -[UIDictationMultilingualString setInteractionIdentifier:](v4, "setInteractionIdentifier:", self->_interactionIdentifier);
  return v4;
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
  -[UIDictationMultilingualString text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[UIDictationMultilingualString dominantLanguage](self, "dominantLanguage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dominantLanguage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

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

  -[UIDictationMultilingualString text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[UIDictationMultilingualString dominantLanguage](self, "dominantLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v2;
  void *v3;

  -[UIDictationMultilingualString dictionaryValue](self, "dictionaryValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dictionaryValue
{
  __CFString *dominantLanguage;
  __CFString *text;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  dominantLanguage = &stru_1E16EDF20;
  if (self->_text)
    text = (__CFString *)self->_text;
  else
    text = &stru_1E16EDF20;
  if (self->_dominantLanguage)
    dominantLanguage = (__CFString *)self->_dominantLanguage;
  v9[0] = CFSTR("text");
  v9[1] = CFSTR("language");
  v10[0] = text;
  v10[1] = dominantLanguage;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = dominantLanguage;
  v6 = text;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
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

- (id)correctionIdentifier
{
  return self->_correctionIdentifier;
}

- (void)setCorrectionIdentifier:(id)a3
{
  objc_storeStrong(&self->_correctionIdentifier, a3);
}

- (NSString)interactionIdentifier
{
  return self->_interactionIdentifier;
}

- (void)setInteractionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_interactionIdentifier, a3);
}

- (NSArray)phrases
{
  return self->_phrases;
}

- (void)setPhrases:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phrases, 0);
  objc_storeStrong((id *)&self->_interactionIdentifier, 0);
  objc_storeStrong(&self->_correctionIdentifier, 0);
  objc_storeStrong((id *)&self->_dominantLanguage, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
