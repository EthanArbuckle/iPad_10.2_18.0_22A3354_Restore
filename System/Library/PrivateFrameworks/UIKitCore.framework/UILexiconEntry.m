@implementation UILexiconEntry

- (id)copyWithZone:(_NSZone *)a3
{
  UILexiconEntry *v4;
  uint64_t v5;
  NSString *userInput;
  uint64_t v7;
  NSString *documentText;

  v4 = objc_alloc_init(UILexiconEntry);
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
    -[UILexiconEntry userInput](self, "userInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInput");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[UILexiconEntry userInput](self, "userInput");
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
    -[UILexiconEntry documentText](self, "documentText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
    {
      v12 = 1;
    }
    else
    {
      -[UILexiconEntry documentText](self, "documentText");
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

+ (id)_entryWithTILexiconEntry:(id)a3
{
  id v3;
  UILexiconEntry *v4;
  void *v5;
  uint64_t v6;
  NSString *documentText;
  void *v8;
  uint64_t v9;
  NSString *userInput;

  v3 = a3;
  v4 = objc_alloc_init(UILexiconEntry);
  objc_msgSend(v3, "documentText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  documentText = v4->_documentText;
  v4->_documentText = (NSString *)v6;

  objc_msgSend(v3, "userInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "copy");
  userInput = v4->_userInput;
  v4->_userInput = (NSString *)v9;

  if (!v4->_userInput)
    objc_storeStrong((id *)&v4->_userInput, v4->_documentText);
  return v4;
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

@end
