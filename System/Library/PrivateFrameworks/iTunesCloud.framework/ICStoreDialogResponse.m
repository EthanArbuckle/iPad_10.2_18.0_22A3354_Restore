@implementation ICStoreDialogResponse

- (ICStoreDialogResponse)initWithResponseDictionary:(id)a3
{
  id v4;
  ICStoreDialogResponse *v5;
  uint64_t v6;
  NSDictionary *responseDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICStoreDialogResponse;
  v5 = -[ICStoreDialogResponse init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p responseDictionary: %@>"), v5, self, self->_responseDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)type
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("kind"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("authorization"));
  else
    v3 = 0;

  return v3;
}

- (NSString)explanation
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("explanation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (BOOL)isInitialCheckboxValue
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("initialCheckboxValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)isBiometricAuthenticationAllowed
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("m-allowed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (NSString)message
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("message"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSArray)buttons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStoreDialogResponse _buttonWithType:](self, "_buttonWithType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[ICStoreDialogResponse _buttonWithType:](self, "_buttonWithType:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  -[ICStoreDialogResponse _buttonWithType:](self, "_buttonWithType:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "addObject:", v6);

  return (NSArray *)v3;
}

- (int64_t)defaultButtonType
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("defaultButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("ok")) & 1) != 0)
    {
      v3 = 1;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("cancel")) & 1) != 0)
    {
      v3 = 2;
    }
    else if (objc_msgSend(v2, "isEqualToString:", CFSTR("other")))
    {
      v3 = 3;
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_buttonWithType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ICStoreDialogResponseButton *v9;
  ICStoreDialogResponseButtonAction *v10;

  -[ICStoreDialogResponse _buttonTitleKeyForType:](self, "_buttonTitleKeyForType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (_NSIsNSString())
  {
    -[ICStoreDialogResponse _buttonActionKeyForType:](self, "_buttonActionKeyForType:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    if (_NSIsNSDictionary())
      v10 = -[ICStoreDialogResponseButtonAction initWithResponseButtonActionDictionary:]([ICStoreDialogResponseButtonAction alloc], "initWithResponseButtonActionDictionary:", v8);
    else
      v10 = 0;
    v9 = -[ICStoreDialogResponseButton initWithType:isDefaultButton:title:action:]([ICStoreDialogResponseButton alloc], "initWithType:isDefaultButton:title:action:", a3, -[ICStoreDialogResponse defaultButtonType](self, "defaultButtonType") == a3, v6, v10);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_buttonTitleKeyForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return off_1E438EE18[a3 - 1];
}

- (id)_buttonActionKeyForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return off_1E438EE30[a3 - 1];
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
