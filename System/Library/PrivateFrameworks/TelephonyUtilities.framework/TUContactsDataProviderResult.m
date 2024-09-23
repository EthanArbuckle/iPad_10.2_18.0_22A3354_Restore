@implementation TUContactsDataProviderResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUContactsDataProviderResult contacts](self, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" contacts=%@"), v4);

  -[TUContactsDataProviderResult localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" localizedName=%@"), v5);

  -[TUContactsDataProviderResult companyName](self, "companyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" companyName=%@"), v6);

  -[TUContactsDataProviderResult contactLabel](self, "contactLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" contactLabel=%@"), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(" legacyAddressBookIdentifier=%d"), -[TUContactsDataProviderResult legacyAddressBookIdentifier](self, "legacyAddressBookIdentifier"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (NSArray)contacts
{
  NSArray *contacts;

  contacts = self->_contacts;
  if (!contacts)
  {
    self->_contacts = (NSArray *)MEMORY[0x1E0C9AA60];

    contacts = self->_contacts;
  }
  return contacts;
}

- (void)setContacts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)companyName
{
  return self->_companyName;
}

- (void)setCompanyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)contactLabel
{
  return self->_contactLabel;
}

- (void)setContactLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int)legacyAddressBookIdentifier
{
  return self->_legacyAddressBookIdentifier;
}

- (void)setLegacyAddressBookIdentifier:(int)a3
{
  self->_legacyAddressBookIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactLabel, 0);
  objc_storeStrong((id *)&self->_companyName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

@end
