@implementation TILexiconEntry

- (id)copyWithZone:(_NSZone *)a3
{
  TILexiconEntry *v4;
  uint64_t v5;
  NSString *userInput;
  uint64_t v7;
  NSString *documentText;

  v4 = objc_alloc_init(TILexiconEntry);
  v5 = -[NSString copy](self->_userInput, "copy");
  userInput = v4->_userInput;
  v4->_userInput = (NSString *)v5;

  v7 = -[NSString copy](self->_documentText, "copy");
  documentText = v4->_documentText;
  v4->_documentText = (NSString *)v7;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[TILexiconEntry userInput](self, "userInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInput");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[TILexiconEntry userInput](self, "userInput");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userInput");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
      {
        v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    -[TILexiconEntry documentText](self, "documentText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
    {
      v12 = 1;
    }
    else
    {
      -[TILexiconEntry documentText](self, "documentText");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "documentText");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v15, "isEqual:", v16);

    }
    goto LABEL_11;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (TILexiconEntry)initWithCoder:(id)a3
{
  id v4;
  TILexiconEntry *v5;
  uint64_t v6;
  NSString *userInput;
  uint64_t v8;
  NSString *documentText;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TILexiconEntry;
  v5 = -[TILexiconEntry init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userInput"));
    v6 = objc_claimAutoreleasedReturnValue();
    userInput = v5->_userInput;
    v5->_userInput = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("documentText"));
    v8 = objc_claimAutoreleasedReturnValue();
    documentText = v5->_documentText;
    v5->_documentText = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *userInput;
  NSString *documentText;
  id v7;

  v4 = a3;
  userInput = self->_userInput;
  v7 = v4;
  if (userInput)
  {
    objc_msgSend(v4, "encodeObject:forKey:", userInput, CFSTR("userInput"));
    v4 = v7;
  }
  documentText = self->_documentText;
  if (documentText)
  {
    objc_msgSend(v7, "encodeObject:forKey:", documentText, CFSTR("documentText"));
    v4 = v7;
  }

}

- (NSString)userInput
{
  return self->_userInput;
}

- (NSString)documentText
{
  return self->_documentText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentText, 0);
  objc_storeStrong((id *)&self->_userInput, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)entryWithDocumentText:(id)a3 userInput:(id)a4
{
  id v5;
  id v6;
  TILexiconEntry *v7;
  uint64_t v8;
  NSString *documentText;
  uint64_t v10;
  NSString *userInput;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(TILexiconEntry);
  v8 = objc_msgSend(v6, "copy");

  documentText = v7->_documentText;
  v7->_documentText = (NSString *)v8;

  v10 = objc_msgSend(v5, "copy");
  userInput = v7->_userInput;
  v7->_userInput = (NSString *)v10;

  return v7;
}

@end
