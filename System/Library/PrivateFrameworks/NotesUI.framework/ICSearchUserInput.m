@implementation ICSearchUserInput

+ (id)emptyInput
{
  ICSearchUserInput *v2;

  v2 = objc_alloc_init(ICSearchUserInput);
  -[ICSearchUserInput _configureEmptyInput](v2, "_configureEmptyInput");
  return v2;
}

- (ICSearchUserInput)initWithSearchString:(id)a3 tokens:(id)a4 keyboardLanguage:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICSearchUserInput *v12;
  BOOL v13;
  uint64_t v14;
  NSArray *tokens;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICSearchUserInput;
  v12 = -[ICSearchUserInput init](&v17, sel_init);
  if (v12)
  {
    if (v10)
    {
      if (objc_msgSend(v9, "length"))
        v13 = 0;
      else
        v13 = objc_msgSend(v10, "count") == 0;
    }
    else
    {
      v13 = 1;
    }
    v12->_isEmpty = v13;
    if (!-[ICSearchUserInput isEmpty](v12, "isEmpty"))
    {
      objc_storeStrong((id *)&v12->_searchString, a3);
      v14 = objc_msgSend(v10, "copy");
      tokens = v12->_tokens;
      v12->_tokens = (NSArray *)v14;

      objc_storeStrong((id *)&v12->_keyboardLanguage, a5);
    }
  }

  return v12;
}

- (void)_configureEmptyInput
{
  NSString *searchString;
  NSArray *tokens;

  self->_isEmpty = 1;
  searchString = self->_searchString;
  self->_searchString = 0;

  tokens = self->_tokens;
  self->_tokens = 0;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICSearchUserInput searchString](self, "searchString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ic_trimmedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ic_trimmedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v9))
    {
      -[ICSearchUserInput tokens](self, "tokens");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tokens");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToArray:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSearchUserInput searchString](self, "searchString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSearchUserInput tokens](self, "tokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - searchString: %@, tokens: %@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)displayString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[ICSearchUserInput searchString](self, "searchString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_trimmedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    -[ICSearchUserInput tokens](self, "tokens");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 == 1)
    {
      -[ICSearchUserInput tokens](self, "tokens");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "title");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICSearchUserInput *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ICSearchUserInput *v11;

  v4 = +[ICSearchUserInput allocWithZone:](ICSearchUserInput, "allocWithZone:", a3);
  -[ICSearchUserInput searchString](self, "searchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[ICSearchUserInput tokens](self, "tokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[ICSearchUserInput keyboardLanguage](self, "keyboardLanguage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  v11 = -[ICSearchUserInput initWithSearchString:tokens:keyboardLanguage:](v4, "initWithSearchString:tokens:keyboardLanguage:", v6, v8, v10);

  return v11;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (NSString)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (BOOL)isEmpty
{
  return self->_isEmpty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
