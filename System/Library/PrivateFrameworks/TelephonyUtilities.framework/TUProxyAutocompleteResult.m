@implementation TUProxyAutocompleteResult

- (TUProxyAutocompleteResult)initWithAutocompleteResult:(id)a3
{
  id v4;
  TUProxyAutocompleteResult *v5;
  TUProxyAutocompleteResult *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUProxyAutocompleteResult;
  v5 = -[TUProxyAutocompleteResult init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[TUProxyAutocompleteResult setAutocompleteResult:](v5, "setAutocompleteResult:", v4);

  return v6;
}

- (TUProxyAutocompleteResult)init
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[TUProxyAutocompleteResult init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Don't call %@, call designated initializer instead."), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("** TUAssertion failure: %@"), v6);

  if (_TUAssertShouldCrashApplication())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[TUProxyAutocompleteResult init]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUProxyAutocompleteResult.m"), 41, CFSTR("Don't call %@, call designated initializer instead."), v8);

  }
  return 0;
}

- (NSString)displayName
{
  void *v3;
  void *v4;

  -[TUProxyAutocompleteResult autocompleteResult](self, "autocompleteResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[TUProxyAutocompleteResult destinationId](self, "destinationId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (CNContact)backingContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[TUSearchController sharedInstance](TUSearchController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUProxyAutocompleteResult autocompleteResult](self, "autocompleteResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContact *)v7;
}

- (NSString)backingContactIdentifier
{
  void *v2;
  void *v3;

  -[TUProxyAutocompleteResult autocompleteResult](self, "autocompleteResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)destinationId
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TUProxyAutocompleteResult autocompleteResult](self, "autocompleteResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[TUProxyAutocompleteResult backingContact](self, "backingContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyDestinationID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (NSString)isoCountryCode
{
  return (NSString *)&stru_1E38A53C8;
}

- (NSArray)handles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[TUProxyAutocompleteResult backingContact](self, "backingContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "phoneNumberStrings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emailAddressStrings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[TUProxyAutocompleteResult destinationId](self, "destinationId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v7 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_6;
    }
    -[TUProxyAutocompleteResult destinationId](self, "destinationId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  return (NSArray *)v7;
}

- (int64_t)mostRecentCallType
{
  return 3;
}

- (BOOL)mostRecentCallWasMissed
{
  return 0;
}

- (NSArray)idsCanonicalDestinations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUProxyAutocompleteResult destinationId](self, "destinationId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "IDSFormattedDestinationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  -[TUProxyAutocompleteResult backingContact](self, "backingContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TUProxyAutocompleteResult backingContact](self, "backingContact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allIDSDestinations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v8);

  }
  objc_msgSend(v3, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (CNAutocompleteResult)autocompleteResult
{
  return self->_autocompleteResult;
}

- (void)setAutocompleteResult:(id)a3
{
  objc_storeStrong((id *)&self->_autocompleteResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autocompleteResult, 0);
}

@end
