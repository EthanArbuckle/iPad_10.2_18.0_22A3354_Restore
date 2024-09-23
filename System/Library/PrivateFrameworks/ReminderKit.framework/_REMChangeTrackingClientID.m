@implementation _REMChangeTrackingClientID

- (_REMChangeTrackingClientID)initWithClientName:(id)a3 accountIdentifier:(id)a4
{
  id v7;
  id v8;
  _REMChangeTrackingClientID *v9;
  _REMChangeTrackingClientID *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_REMChangeTrackingClientID;
  v9 = -[_REMChangeTrackingClientID init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientName, a3);
    objc_storeStrong((id *)&v10->_accountIdentifier, a4);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_REMChangeTrackingClientID clientName](self, "clientName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("clientName"));

  -[_REMChangeTrackingClientID accountIdentifier](self, "accountIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("accountIdentifier"));

}

- (_REMChangeTrackingClientID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  _REMChangeTrackingClientID *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[_REMChangeTrackingClientID initWithClientName:accountIdentifier:](self, "initWithClientName:accountIdentifier:", v5, v6);
    v8 = self;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  _REMChangeTrackingClientID *v4;
  _REMChangeTrackingClientID *v5;
  _REMChangeTrackingClientID *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = (_REMChangeTrackingClientID *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_REMChangeTrackingClientID clientName](self, "clientName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_REMChangeTrackingClientID clientName](v6, "clientName");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[_REMChangeTrackingClientID clientName](self, "clientName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_REMChangeTrackingClientID clientName](v6, "clientName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_5;
      }
      -[_REMChangeTrackingClientID accountIdentifier](self, "accountIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_REMChangeTrackingClientID accountIdentifier](v6, "accountIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {
        v13 = 1;
        v16 = v14;
      }
      else
      {
        v16 = (void *)v15;
        -[_REMChangeTrackingClientID accountIdentifier](self, "accountIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_REMChangeTrackingClientID accountIdentifier](v6, "accountIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v17, "isEqual:", v18);

      }
      goto LABEL_12;
    }
LABEL_5:
    v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v13 = 1;
LABEL_13:

  return v13;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_REMChangeTrackingClientID;
  -[_REMChangeTrackingClientID description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[_REMChangeTrackingClientID clientName](self, "clientName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_REMChangeTrackingClientID accountIdentifier](self, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR(" - {clientName: %@, accountIdentifier: %@};"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
}

@end
