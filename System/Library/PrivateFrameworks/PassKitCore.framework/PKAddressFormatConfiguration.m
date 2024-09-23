@implementation PKAddressFormatConfiguration

- (PKAddressFormatConfiguration)initWithDictionary:(id)a3
{
  id v4;
  PKAddressFormatConfiguration *v5;
  void *v6;
  uint64_t v7;
  PKContactFieldConfiguration *streetFieldConfiguration;
  void *v9;
  uint64_t v10;
  PKContactFieldConfiguration *subLocalityFieldConfiguration;
  void *v12;
  uint64_t v13;
  PKContactFieldConfiguration *cityFieldConfiguration;
  void *v15;
  uint64_t v16;
  PKContactFieldConfiguration *subAdministrativeAreaFieldConfiguration;
  void *v18;
  uint64_t v19;
  PKContactFieldConfiguration *stateFieldConfiguration;
  void *v21;
  uint64_t v22;
  PKContactFieldConfiguration *postalCodeFieldConfiguration;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKAddressFormatConfiguration;
  v5 = -[PKAddressFormatConfiguration init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("street"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKContactFieldConfiguration contactFieldConfigurationWithDictionary:](PKContactFieldConfiguration, "contactFieldConfigurationWithDictionary:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    streetFieldConfiguration = v5->_streetFieldConfiguration;
    v5->_streetFieldConfiguration = (PKContactFieldConfiguration *)v7;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("subLocality"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKContactFieldConfiguration contactFieldConfigurationWithDictionary:](PKContactFieldConfiguration, "contactFieldConfigurationWithDictionary:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    subLocalityFieldConfiguration = v5->_subLocalityFieldConfiguration;
    v5->_subLocalityFieldConfiguration = (PKContactFieldConfiguration *)v10;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("city"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKContactFieldConfiguration contactFieldConfigurationWithDictionary:](PKContactFieldConfiguration, "contactFieldConfigurationWithDictionary:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    cityFieldConfiguration = v5->_cityFieldConfiguration;
    v5->_cityFieldConfiguration = (PKContactFieldConfiguration *)v13;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("subAdministrativeArea"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKContactFieldConfiguration contactFieldConfigurationWithDictionary:](PKContactFieldConfiguration, "contactFieldConfigurationWithDictionary:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    subAdministrativeAreaFieldConfiguration = v5->_subAdministrativeAreaFieldConfiguration;
    v5->_subAdministrativeAreaFieldConfiguration = (PKContactFieldConfiguration *)v16;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("state"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKContactFieldConfiguration contactFieldConfigurationWithDictionary:](PKContactFieldConfiguration, "contactFieldConfigurationWithDictionary:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    stateFieldConfiguration = v5->_stateFieldConfiguration;
    v5->_stateFieldConfiguration = (PKContactFieldConfiguration *)v19;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("postalCode"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKContactFieldConfiguration contactFieldConfigurationWithDictionary:](PKContactFieldConfiguration, "contactFieldConfigurationWithDictionary:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    postalCodeFieldConfiguration = v5->_postalCodeFieldConfiguration;
    v5->_postalCodeFieldConfiguration = (PKContactFieldConfiguration *)v22;

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
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("street"), self->_streetFieldConfiguration);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("subLocality"), self->_subLocalityFieldConfiguration);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("city"), self->_cityFieldConfiguration);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "),
    CFSTR("subAdministrativeArea"),
    self->_subAdministrativeAreaFieldConfiguration);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("state"), self->_stateFieldConfiguration);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("postalCode"), self->_postalCodeFieldConfiguration);
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
  PKContactFieldConfiguration *streetFieldConfiguration;
  id v5;

  streetFieldConfiguration = self->_streetFieldConfiguration;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", streetFieldConfiguration, CFSTR("street"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subLocalityFieldConfiguration, CFSTR("subLocality"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cityFieldConfiguration, CFSTR("city"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subAdministrativeAreaFieldConfiguration, CFSTR("subAdministrativeArea"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stateFieldConfiguration, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_postalCodeFieldConfiguration, CFSTR("postalCode"));

}

- (PKAddressFormatConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKAddressFormatConfiguration *v5;
  uint64_t v6;
  PKContactFieldConfiguration *streetFieldConfiguration;
  uint64_t v8;
  PKContactFieldConfiguration *subLocalityFieldConfiguration;
  uint64_t v10;
  PKContactFieldConfiguration *cityFieldConfiguration;
  uint64_t v12;
  PKContactFieldConfiguration *subAdministrativeAreaFieldConfiguration;
  uint64_t v14;
  PKContactFieldConfiguration *stateFieldConfiguration;
  uint64_t v16;
  PKContactFieldConfiguration *postalCodeFieldConfiguration;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKAddressFormatConfiguration;
  v5 = -[PKAddressFormatConfiguration init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("street"));
    v6 = objc_claimAutoreleasedReturnValue();
    streetFieldConfiguration = v5->_streetFieldConfiguration;
    v5->_streetFieldConfiguration = (PKContactFieldConfiguration *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subLocality"));
    v8 = objc_claimAutoreleasedReturnValue();
    subLocalityFieldConfiguration = v5->_subLocalityFieldConfiguration;
    v5->_subLocalityFieldConfiguration = (PKContactFieldConfiguration *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("city"));
    v10 = objc_claimAutoreleasedReturnValue();
    cityFieldConfiguration = v5->_cityFieldConfiguration;
    v5->_cityFieldConfiguration = (PKContactFieldConfiguration *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subAdministrativeArea"));
    v12 = objc_claimAutoreleasedReturnValue();
    subAdministrativeAreaFieldConfiguration = v5->_subAdministrativeAreaFieldConfiguration;
    v5->_subAdministrativeAreaFieldConfiguration = (PKContactFieldConfiguration *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v14 = objc_claimAutoreleasedReturnValue();
    stateFieldConfiguration = v5->_stateFieldConfiguration;
    v5->_stateFieldConfiguration = (PKContactFieldConfiguration *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("postalCode"));
    v16 = objc_claimAutoreleasedReturnValue();
    postalCodeFieldConfiguration = v5->_postalCodeFieldConfiguration;
    v5->_postalCodeFieldConfiguration = (PKContactFieldConfiguration *)v16;

  }
  return v5;
}

- (PKContactFieldConfiguration)streetFieldConfiguration
{
  return self->_streetFieldConfiguration;
}

- (PKContactFieldConfiguration)subLocalityFieldConfiguration
{
  return self->_subLocalityFieldConfiguration;
}

- (PKContactFieldConfiguration)cityFieldConfiguration
{
  return self->_cityFieldConfiguration;
}

- (PKContactFieldConfiguration)subAdministrativeAreaFieldConfiguration
{
  return self->_subAdministrativeAreaFieldConfiguration;
}

- (PKContactFieldConfiguration)stateFieldConfiguration
{
  return self->_stateFieldConfiguration;
}

- (PKContactFieldConfiguration)postalCodeFieldConfiguration
{
  return self->_postalCodeFieldConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postalCodeFieldConfiguration, 0);
  objc_storeStrong((id *)&self->_stateFieldConfiguration, 0);
  objc_storeStrong((id *)&self->_subAdministrativeAreaFieldConfiguration, 0);
  objc_storeStrong((id *)&self->_cityFieldConfiguration, 0);
  objc_storeStrong((id *)&self->_subLocalityFieldConfiguration, 0);
  objc_storeStrong((id *)&self->_streetFieldConfiguration, 0);
}

@end
