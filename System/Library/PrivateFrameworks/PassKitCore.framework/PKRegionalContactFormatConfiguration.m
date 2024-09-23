@implementation PKRegionalContactFormatConfiguration

- (PKRegionalContactFormatConfiguration)initWithDictionary:(id)a3
{
  id v4;
  PKRegionalContactFormatConfiguration *v5;
  PKNameComponentFormatConfiguration *v6;
  void *v7;
  uint64_t v8;
  PKNameComponentFormatConfiguration *nameComponentFormatConfiguration;
  PKAddressFormatConfiguration *v10;
  void *v11;
  uint64_t v12;
  PKAddressFormatConfiguration *addressFormatConfiguration;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKRegionalContactFormatConfiguration;
  v5 = -[PKRegionalContactFormatConfiguration init](&v15, sel_init);
  if (v5)
  {
    v6 = [PKNameComponentFormatConfiguration alloc];
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("nameComponentsFormat"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKNameComponentFormatConfiguration initWithDictionary:](v6, "initWithDictionary:", v7);
    nameComponentFormatConfiguration = v5->_nameComponentFormatConfiguration;
    v5->_nameComponentFormatConfiguration = (PKNameComponentFormatConfiguration *)v8;

    v10 = [PKAddressFormatConfiguration alloc];
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("addressFormat"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKAddressFormatConfiguration initWithDictionary:](v10, "initWithDictionary:", v11);
    addressFormatConfiguration = v5->_addressFormatConfiguration;
    v5->_addressFormatConfiguration = (PKAddressFormatConfiguration *)v12;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "),
    CFSTR("nameComponentsFormat"),
    self->_nameComponentFormatConfiguration);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("addressFormat"), self->_addressFormatConfiguration);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  PKNameComponentFormatConfiguration *nameComponentFormatConfiguration;
  id v5;

  nameComponentFormatConfiguration = self->_nameComponentFormatConfiguration;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", nameComponentFormatConfiguration, CFSTR("nameComponentsFormat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_addressFormatConfiguration, CFSTR("addressFormat"));

}

- (PKRegionalContactFormatConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKRegionalContactFormatConfiguration *v5;
  uint64_t v6;
  PKNameComponentFormatConfiguration *nameComponentFormatConfiguration;
  uint64_t v8;
  PKAddressFormatConfiguration *addressFormatConfiguration;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKRegionalContactFormatConfiguration;
  v5 = -[PKRegionalContactFormatConfiguration init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nameComponentsFormat"));
    v6 = objc_claimAutoreleasedReturnValue();
    nameComponentFormatConfiguration = v5->_nameComponentFormatConfiguration;
    v5->_nameComponentFormatConfiguration = (PKNameComponentFormatConfiguration *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("addressFormat"));
    v8 = objc_claimAutoreleasedReturnValue();
    addressFormatConfiguration = v5->_addressFormatConfiguration;
    v5->_addressFormatConfiguration = (PKAddressFormatConfiguration *)v8;

  }
  return v5;
}

- (PKNameComponentFormatConfiguration)nameComponentFormatConfiguration
{
  return self->_nameComponentFormatConfiguration;
}

- (PKAddressFormatConfiguration)addressFormatConfiguration
{
  return self->_addressFormatConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressFormatConfiguration, 0);
  objc_storeStrong((id *)&self->_nameComponentFormatConfiguration, 0);
}

@end
