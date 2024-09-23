@implementation TUAdhocResult

- (TUAdhocResult)initWithString:(id)a3
{
  id v4;
  TUAdhocResult *v5;
  TUAdhocResult *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUAdhocResult;
  v5 = -[TUAdhocResult init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[TUAdhocResult setValue:](v5, "setValue:", v4);

  return v6;
}

- (NSString)displayName
{
  void *v2;
  void *v3;

  -[TUAdhocResult value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattedDisplayID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CNContact)backingContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TUAdhocResult searchController](self, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUAdhocResult value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactForDestinationId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContact *)v6;
}

- (NSString)backingContactIdentifier
{
  void *v2;
  void *v3;

  -[TUAdhocResult backingContact](self, "backingContact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)isoCountryCode
{
  return (NSString *)&stru_1E38A53C8;
}

- (NSArray)handles
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[TUAdhocResult value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  -[TUAdhocResult value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
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
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[TUAdhocResult value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  -[TUAdhocResult value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "IDSFormattedDestinationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v7;
}

- (TUSearchController)searchController
{
  return (TUSearchController *)objc_loadWeakRetained((id *)&self->_searchController);
}

- (void)setSearchController:(id)a3
{
  objc_storeWeak((id *)&self->_searchController, a3);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_destroyWeak((id *)&self->_searchController);
}

@end
