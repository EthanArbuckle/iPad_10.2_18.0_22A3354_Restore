@implementation PKContactFormatConfiguration

- (PKContactFormatConfiguration)initWithDictionary:(id)a3
{
  id v4;
  PKContactFormatConfiguration *v5;
  id v6;
  void *v7;
  PKContactFormatConfiguration *v8;
  id v9;
  uint64_t v10;
  NSDictionary *regionalAddressFormatConfigurations;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  PKContactFormatConfiguration *v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKContactFormatConfiguration;
  v5 = -[PKContactFormatConfiguration init](&v19, sel_init);
  if (v5)
  {
    v5->_checkFormatOfPhoneNumber = objc_msgSend(v4, "PKBoolForKey:", CFSTR("checkFormatOfPhoneNumber"));
    v5->_checkFormatOfEmailAddress = objc_msgSend(v4, "PKBoolForKey:", CFSTR("checkFormatOfEmailAddress"));
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("regionalAddressFormatConfigurations"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __51__PKContactFormatConfiguration_initWithDictionary___block_invoke;
    v16 = &unk_1E2AC3240;
    v17 = v6;
    v8 = v5;
    v18 = v8;
    v9 = v6;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v13);
    v10 = objc_msgSend(v9, "copy", v13, v14, v15, v16);
    regionalAddressFormatConfigurations = v8->_regionalAddressFormatConfigurations;
    v8->_regionalAddressFormatConfigurations = (NSDictionary *)v10;

  }
  return v5;
}

void __51__PKContactFormatConfiguration_initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  PKRegionalContactFormatConfiguration *v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = -[PKRegionalContactFormatConfiguration initWithDictionary:]([PKRegionalContactFormatConfiguration alloc], "initWithDictionary:", v6);

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v5);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412802;
      v11 = (id)objc_opt_class();
      v12 = 2112;
      v13 = v5;
      v14 = 2112;
      v15 = 0;
      v9 = v11;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "%@: Failed to parse regional address config for countryCode: %@ from dictionary: %@", (uint8_t *)&v10, 0x20u);

    }
  }

}

- (id)contactFieldConfigurationForCountryCode:(id)a3
{
  return -[NSDictionary objectForKey:](self->_regionalAddressFormatConfigurations, "objectForKey:", a3);
}

- (id)regionalAddressFormatConfigurations
{
  return self->_regionalAddressFormatConfigurations;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  v4 = v3;
  if (self->_checkFormatOfPhoneNumber)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("checkFormatOfPhoneNumber"), v5);
  if (self->_checkFormatOfEmailAddress)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("checkFormatOfEmailAddress"), v6);
  objc_msgSend(v4, "appendFormat:", CFSTR("%@: '%@'; "),
    CFSTR("regionalAddressFormatConfigurations"),
    self->_regionalAddressFormatConfigurations);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 checkFormatOfPhoneNumber;
  id v5;

  checkFormatOfPhoneNumber = self->_checkFormatOfPhoneNumber;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", checkFormatOfPhoneNumber, CFSTR("checkFormatOfPhoneNumber"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_checkFormatOfEmailAddress, CFSTR("checkFormatOfEmailAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_regionalAddressFormatConfigurations, CFSTR("regionalAddressFormatConfigurations"));

}

- (PKContactFormatConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKContactFormatConfiguration *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *regionalAddressFormatConfigurations;
  objc_super v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKContactFormatConfiguration;
  v5 = -[PKContactFormatConfiguration init](&v12, sel_init);
  if (v5)
  {
    v5->_checkFormatOfPhoneNumber = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("checkFormatOfPhoneNumber"));
    v5->_checkFormatOfEmailAddress = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("checkFormatOfEmailAddress"));
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("regionalAddressFormatConfigurations"));
    v9 = objc_claimAutoreleasedReturnValue();
    regionalAddressFormatConfigurations = v5->_regionalAddressFormatConfigurations;
    v5->_regionalAddressFormatConfigurations = (NSDictionary *)v9;

  }
  return v5;
}

- (BOOL)checkFormatOfPhoneNumber
{
  return self->_checkFormatOfPhoneNumber;
}

- (BOOL)checkFormatOfEmailAddress
{
  return self->_checkFormatOfEmailAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionalAddressFormatConfigurations, 0);
}

@end
