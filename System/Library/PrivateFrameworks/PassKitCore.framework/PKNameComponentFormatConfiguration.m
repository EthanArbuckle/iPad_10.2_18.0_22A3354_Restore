@implementation PKNameComponentFormatConfiguration

- (PKNameComponentFormatConfiguration)initWithDictionary:(id)a3
{
  id v4;
  PKNameComponentFormatConfiguration *v5;
  void *v6;
  uint64_t v7;
  PKContactFieldConfiguration *givenNameFieldConfiguration;
  void *v9;
  uint64_t v10;
  PKContactFieldConfiguration *familyNameFieldConfiguration;
  void *v12;
  uint64_t v13;
  PKContactFieldConfiguration *phoneticGivenNameFieldConfiguration;
  void *v15;
  uint64_t v16;
  PKContactFieldConfiguration *phoneticFamilyNameFieldConfiguration;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKNameComponentFormatConfiguration;
  v5 = -[PKNameComponentFormatConfiguration init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("givenName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKContactFieldConfiguration contactFieldConfigurationWithDictionary:](PKContactFieldConfiguration, "contactFieldConfigurationWithDictionary:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    givenNameFieldConfiguration = v5->_givenNameFieldConfiguration;
    v5->_givenNameFieldConfiguration = (PKContactFieldConfiguration *)v7;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("familyName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKContactFieldConfiguration contactFieldConfigurationWithDictionary:](PKContactFieldConfiguration, "contactFieldConfigurationWithDictionary:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    familyNameFieldConfiguration = v5->_familyNameFieldConfiguration;
    v5->_familyNameFieldConfiguration = (PKContactFieldConfiguration *)v10;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("phoneticGivenName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKContactFieldConfiguration contactFieldConfigurationWithDictionary:](PKContactFieldConfiguration, "contactFieldConfigurationWithDictionary:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    phoneticGivenNameFieldConfiguration = v5->_phoneticGivenNameFieldConfiguration;
    v5->_phoneticGivenNameFieldConfiguration = (PKContactFieldConfiguration *)v13;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("phoneticFamilyName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKContactFieldConfiguration contactFieldConfigurationWithDictionary:](PKContactFieldConfiguration, "contactFieldConfigurationWithDictionary:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    phoneticFamilyNameFieldConfiguration = v5->_phoneticFamilyNameFieldConfiguration;
    v5->_phoneticFamilyNameFieldConfiguration = (PKContactFieldConfiguration *)v16;

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
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("givenName"), self->_givenNameFieldConfiguration);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("familyName"), self->_familyNameFieldConfiguration);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "),
    CFSTR("phoneticGivenName"),
    self->_phoneticGivenNameFieldConfiguration);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "),
    CFSTR("phoneticFamilyName"),
    self->_phoneticFamilyNameFieldConfiguration);
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
  PKContactFieldConfiguration *givenNameFieldConfiguration;
  id v5;

  givenNameFieldConfiguration = self->_givenNameFieldConfiguration;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", givenNameFieldConfiguration, CFSTR("givenName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_familyNameFieldConfiguration, CFSTR("familyName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneticFamilyNameFieldConfiguration, CFSTR("phoneticGivenName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneticFamilyNameFieldConfiguration, CFSTR("phoneticFamilyName"));

}

- (PKNameComponentFormatConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKNameComponentFormatConfiguration *v5;
  uint64_t v6;
  PKContactFieldConfiguration *givenNameFieldConfiguration;
  uint64_t v8;
  PKContactFieldConfiguration *familyNameFieldConfiguration;
  uint64_t v10;
  PKContactFieldConfiguration *phoneticGivenNameFieldConfiguration;
  uint64_t v12;
  PKContactFieldConfiguration *phoneticFamilyNameFieldConfiguration;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKNameComponentFormatConfiguration;
  v5 = -[PKNameComponentFormatConfiguration init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("givenName"));
    v6 = objc_claimAutoreleasedReturnValue();
    givenNameFieldConfiguration = v5->_givenNameFieldConfiguration;
    v5->_givenNameFieldConfiguration = (PKContactFieldConfiguration *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("familyName"));
    v8 = objc_claimAutoreleasedReturnValue();
    familyNameFieldConfiguration = v5->_familyNameFieldConfiguration;
    v5->_familyNameFieldConfiguration = (PKContactFieldConfiguration *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneticGivenName"));
    v10 = objc_claimAutoreleasedReturnValue();
    phoneticGivenNameFieldConfiguration = v5->_phoneticGivenNameFieldConfiguration;
    v5->_phoneticGivenNameFieldConfiguration = (PKContactFieldConfiguration *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneticFamilyName"));
    v12 = objc_claimAutoreleasedReturnValue();
    phoneticFamilyNameFieldConfiguration = v5->_phoneticFamilyNameFieldConfiguration;
    v5->_phoneticFamilyNameFieldConfiguration = (PKContactFieldConfiguration *)v12;

  }
  return v5;
}

- (PKContactFieldConfiguration)givenNameFieldConfiguration
{
  return self->_givenNameFieldConfiguration;
}

- (PKContactFieldConfiguration)familyNameFieldConfiguration
{
  return self->_familyNameFieldConfiguration;
}

- (PKContactFieldConfiguration)phoneticGivenNameFieldConfiguration
{
  return self->_phoneticGivenNameFieldConfiguration;
}

- (PKContactFieldConfiguration)phoneticFamilyNameFieldConfiguration
{
  return self->_phoneticFamilyNameFieldConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneticFamilyNameFieldConfiguration, 0);
  objc_storeStrong((id *)&self->_phoneticGivenNameFieldConfiguration, 0);
  objc_storeStrong((id *)&self->_familyNameFieldConfiguration, 0);
  objc_storeStrong((id *)&self->_givenNameFieldConfiguration, 0);
}

@end
