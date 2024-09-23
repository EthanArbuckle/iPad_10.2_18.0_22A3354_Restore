@implementation RTAccount

- (RTAccount)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithACAccount_);
}

- (RTAccount)initWithACAccount:(id)a3
{
  id v4;
  RTAccount *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RTAccount;
  v5 = -[RTAccount init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "aa_personID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTAccount setDsid:](v5, "setDsid:", v6);

    objc_msgSend(v4, "aa_firstName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTAccount setFirstName:](v5, "setFirstName:", v7);

    objc_msgSend(v4, "aa_lastName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTAccount setLastName:](v5, "setLastName:", v8);

    -[RTAccount setPrimaryEmailVerified:](v5, "setPrimaryEmailVerified:", objc_msgSend(v4, "aa_isPrimaryEmailVerified"));
    objc_msgSend(v4, "username");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTAccount setAppleID:](v5, "setAppleID:", v9);

    objc_msgSend(v4, "aa_altDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTAccount setAltDSID:](v5, "setAltDSID:", v10);

    objc_msgSend(v4, "aa_primaryEmail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTAccount setPrimaryEmail:](v5, "setPrimaryEmail:", v11);

    objc_msgSend(v4, "appleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTAccount setAppleIDAlias:](v5, "setAppleIDAlias:", v12);

    objc_msgSend(v4, "aa_appleIDAliases");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTAccount setAppleIDAliases:](v5, "setAppleIDAliases:", v13);

  }
  return v5;
}

- (id)appleIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  -[RTAccount dsid](self, "dsid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTAccount dsid](self, "dsid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[RTAccount appleID](self, "appleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RTAccount appleID](self, "appleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  if (-[RTAccount primaryEmailVerified](self, "primaryEmailVerified"))
  {
    -[RTAccount primaryEmail](self, "primaryEmail");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[RTAccount primaryEmail](self, "primaryEmail");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v9);

    }
  }
  -[RTAccount appleIDAlias](self, "appleIDAlias");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[RTAccount appleIDAlias](self, "appleIDAlias");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  -[RTAccount appleIDAliases](self, "appleIDAliases");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v12);

  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DSID: %@, Apple ID: %@, Primary Email: %@, Apple ID Alias: %@, Apple ID Aliases, %@"), self->_dsid, self->_appleID, self->_primaryEmail, self->_appleIDAlias, self->_appleIDAliases);
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_storeStrong((id *)&self->_dsid, a3);
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (BOOL)primaryEmailVerified
{
  return self->_primaryEmailVerified;
}

- (void)setPrimaryEmailVerified:(BOOL)a3
{
  self->_primaryEmailVerified = a3;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
  objc_storeStrong((id *)&self->_appleID, a3);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_altDSID, a3);
}

- (NSString)primaryEmail
{
  return self->_primaryEmail;
}

- (void)setPrimaryEmail:(id)a3
{
  objc_storeStrong((id *)&self->_primaryEmail, a3);
}

- (NSString)appleIDAlias
{
  return self->_appleIDAlias;
}

- (void)setAppleIDAlias:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDAlias, a3);
}

- (NSArray)appleIDAliases
{
  return self->_appleIDAliases;
}

- (void)setAppleIDAliases:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDAliases, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleIDAliases, 0);
  objc_storeStrong((id *)&self->_appleIDAlias, 0);
  objc_storeStrong((id *)&self->_primaryEmail, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
