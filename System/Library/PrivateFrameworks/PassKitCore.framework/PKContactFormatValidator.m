@implementation PKContactFormatValidator

- (PKContactFormatValidator)initWithConfiguration:(id)a3
{
  id v5;
  PKContactFormatValidator *v6;
  PKContactFormatValidator *v7;
  PKContactFormatValidator *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKContactFormatValidator;
    v6 = -[PKContactFormatValidator init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_configuration, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)hasFormatValidationConfigurationForCountryCode:(id)a3
{
  void *v3;
  BOOL v4;

  -[PKContactFormatConfiguration contactFieldConfigurationForCountryCode:](self->_configuration, "contactFieldConfigurationForCountryCode:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (unint64_t)checkNameFormat:(id)a3 forCountryCode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  unint64_t v24;

  v6 = a3;
  -[PKContactFormatConfiguration contactFieldConfigurationForCountryCode:](self->_configuration, "contactFieldConfigurationForCountryCode:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nameComponentFormatConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "phoneticRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "givenName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "givenNameFieldConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKContactFormatValidator _isFieldEntry:validForContactFieldConfiguration:](self, "_isFieldEntry:validForContactFieldConfiguration:", v10, v11);

    v13 = !v12;
    objc_msgSend(v6, "familyName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "familyNameFieldConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PKContactFormatValidator _isFieldEntry:validForContactFieldConfiguration:](self, "_isFieldEntry:validForContactFieldConfiguration:", v14, v15);

    if (!v16)
      v13 |= 2uLL;
    objc_msgSend(v9, "givenName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "phoneticGivenNameFieldConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[PKContactFormatValidator _isFieldEntry:validForContactFieldConfiguration:](self, "_isFieldEntry:validForContactFieldConfiguration:", v17, v18);

    if (v19)
      v20 = v13;
    else
      v20 = v13 | 4;
    objc_msgSend(v9, "familyName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "phoneticFamilyNameFieldConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[PKContactFormatValidator _isFieldEntry:validForContactFieldConfiguration:](self, "_isFieldEntry:validForContactFieldConfiguration:", v21, v22);

    if (v23)
      v24 = v20;
    else
      v24 = v20 | 8;

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BOOL)isGivenName:(id)a3 validFormatForCountryCode:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PKContactFormatValidator contactFieldConfigurationForGivenNameForCountryCode:](self, "contactFieldConfigurationForGivenNameForCountryCode:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PKContactFormatValidator _isFieldEntry:validForContactFieldConfiguration:](self, "_isFieldEntry:validForContactFieldConfiguration:", v6, v7);

  return (char)self;
}

- (BOOL)isFamilyName:(id)a3 validFormatForCountryCode:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PKContactFormatValidator contactFieldConfigurationForFamilyNameForCountryCode:](self, "contactFieldConfigurationForFamilyNameForCountryCode:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PKContactFormatValidator _isFieldEntry:validForContactFieldConfiguration:](self, "_isFieldEntry:validForContactFieldConfiguration:", v6, v7);

  return (char)self;
}

- (BOOL)isPhoneticGivenName:(id)a3 validFormatForCountryCode:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PKContactFormatValidator contactFieldConfigurationForPhoneticGivenNameForCountryCode:](self, "contactFieldConfigurationForPhoneticGivenNameForCountryCode:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PKContactFormatValidator _isFieldEntry:validForContactFieldConfiguration:](self, "_isFieldEntry:validForContactFieldConfiguration:", v6, v7);

  return (char)self;
}

- (BOOL)isPhoneticFamilyName:(id)a3 validFormatForCountryCode:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PKContactFormatValidator contactFieldConfigurationForPhoneticFamilyNameForCountryCode:](self, "contactFieldConfigurationForPhoneticFamilyNameForCountryCode:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PKContactFormatValidator _isFieldEntry:validForContactFieldConfiguration:](self, "_isFieldEntry:validForContactFieldConfiguration:", v6, v7);

  return (char)self;
}

- (unint64_t)checkPostalAddressFormat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  unint64_t v28;

  v4 = a3;
  objc_msgSend(v4, "ISOCountryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[PKContactFormatConfiguration contactFieldConfigurationForCountryCode:](self->_configuration, "contactFieldConfigurationForCountryCode:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addressFormatConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "street");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "streetFieldConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PKContactFormatValidator _isFieldEntry:validForContactFieldConfiguration:](self, "_isFieldEntry:validForContactFieldConfiguration:", v8, v9);

      v11 = !v10;
      objc_msgSend(v4, "subLocality");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "subLocalityFieldConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PKContactFormatValidator _isFieldEntry:validForContactFieldConfiguration:](self, "_isFieldEntry:validForContactFieldConfiguration:", v12, v13);

      if (!v14)
        v11 |= 2uLL;
      objc_msgSend(v4, "city");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cityFieldConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[PKContactFormatValidator _isFieldEntry:validForContactFieldConfiguration:](self, "_isFieldEntry:validForContactFieldConfiguration:", v15, v16);

      if (!v17)
        v11 |= 4uLL;
      objc_msgSend(v4, "subAdministrativeArea");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "subAdministrativeAreaFieldConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[PKContactFormatValidator _isFieldEntry:validForContactFieldConfiguration:](self, "_isFieldEntry:validForContactFieldConfiguration:", v18, v19);

      if (!v20)
        v11 |= 8uLL;
      objc_msgSend(v4, "state");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stateFieldConfiguration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[PKContactFormatValidator _isFieldEntry:validForContactFieldConfiguration:](self, "_isFieldEntry:validForContactFieldConfiguration:", v21, v22);

      if (v23)
        v24 = v11;
      else
        v24 = v11 | 0x10;
      objc_msgSend(v4, "postalCode");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postalCodeFieldConfiguration");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[PKContactFormatValidator _isFieldEntry:validForContactFieldConfiguration:](self, "_isFieldEntry:validForContactFieldConfiguration:", v25, v26);

      if (v27)
        v28 = v24;
      else
        v28 = v24 | 0x20;
    }
    else
    {
      v28 = 0;
    }

  }
  else
  {
    v28 = 64;
  }

  return v28;
}

- (BOOL)isPostalAddressFieldEntry:(id)a3 validForPostalFieldKey:(id)a4 forCountryCode:(id)a5
{
  id v8;
  void *v9;

  if (!a3 || !a4 || !a5)
    return 0;
  v8 = a3;
  -[PKContactFormatValidator contactFieldConfigurationForPostalField:forCountryCode:](self, "contactFieldConfigurationForPostalField:forCountryCode:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PKContactFormatValidator _isFieldEntry:validForContactFieldConfiguration:](self, "_isFieldEntry:validForContactFieldConfiguration:", v8, v9);

  return (char)self;
}

- (id)formatPostalAddress:(id)a3
{
  id v4;
  void *v5;
  PKContactFormatConfiguration *configuration;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v24;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  configuration = self->_configuration;
  objc_msgSend(v4, "ISOCountryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKContactFormatConfiguration contactFieldConfigurationForCountryCode:](configuration, "contactFieldConfigurationForCountryCode:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addressFormatConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  if (v9)
  {
    objc_msgSend(v4, "city");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cityFieldConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContactFormatValidator _formattedFieldEntry:forFieldConfiguration:](self, "_formattedFieldEntry:forFieldConfiguration:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v5, "setCity:", v13);
    objc_msgSend(v4, "state");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stateFieldConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContactFormatValidator _formattedFieldEntry:forFieldConfiguration:](self, "_formattedFieldEntry:forFieldConfiguration:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v5, "setState:", v16);
      v24 = 1;
    }
    else
    {
      v24 = v13 != 0;
    }
    objc_msgSend(v4, "subAdministrativeArea");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subAdministrativeAreaFieldConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContactFormatValidator _formattedFieldEntry:forFieldConfiguration:](self, "_formattedFieldEntry:forFieldConfiguration:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v5, "setSubAdministrativeArea:", v19);
      v24 = 1;
    }
    objc_msgSend(v4, "postalCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postalCodeFieldConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContactFormatValidator _formattedFieldEntry:forFieldConfiguration:](self, "_formattedFieldEntry:forFieldConfiguration:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v5, "setPostalCode:", v22);

LABEL_12:
      v10 = (void *)objc_msgSend(v5, "copy");

      goto LABEL_13;
    }

    v10 = v4;
    if (v24)
      goto LABEL_12;
  }
LABEL_13:

  return v10;
}

- (BOOL)phoneNumberIsValid:(id)a3 forCountryCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const void *v9;
  char valid;

  v6 = a3;
  v7 = a4;
  if (-[PKContactFormatConfiguration checkFormatOfPhoneNumber](self->_configuration, "checkFormatOfPhoneNumber"))
  {
    objc_msgSend(v6, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v8, "length") > 0x22)
    {
      valid = 0;
    }
    else
    {
      v9 = (const void *)PNCopyBestGuessCountryCodeForNumber();
      if (v9 || (v9 = v7) != 0)
      {
        valid = PNIsValidPhoneNumberForCountry();
      }
      else
      {
        v9 = PKCurrentRegion();
        valid = PNIsValidPhoneNumberForCountry();
        if (!v9)
          goto LABEL_9;
      }
      CFRelease(v9);
    }
LABEL_9:

    goto LABEL_10;
  }
  valid = 1;
LABEL_10:

  return valid;
}

- (BOOL)emailAddressIsValid:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (-[PKContactFormatConfiguration checkFormatOfEmailAddress](self->_configuration, "checkFormatOfEmailAddress"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", v4);
    v6 = v5 != 0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)contactFieldConfigurationForPostalField:(id)a3 forCountryCode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  -[PKContactFormatConfiguration contactFieldConfigurationForCountryCode:](self->_configuration, "contactFieldConfigurationForCountryCode:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addressFormatConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C970C8]))
  {
    objc_msgSend(v8, "streetFieldConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C970D8]))
  {
    objc_msgSend(v8, "subLocalityFieldConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C97098]))
  {
    objc_msgSend(v8, "cityFieldConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C970D0]))
  {
    objc_msgSend(v8, "subAdministrativeAreaFieldConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C970C0]))
  {
    objc_msgSend(v8, "stateFieldConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C970B0]))
    {
      v10 = 0;
      goto LABEL_14;
    }
    objc_msgSend(v8, "postalCodeFieldConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_14:

  return v10;
}

- (id)contactFieldConfigurationForGivenNameForCountryCode:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PKContactFormatConfiguration contactFieldConfigurationForCountryCode:](self->_configuration, "contactFieldConfigurationForCountryCode:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nameComponentFormatConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "givenNameFieldConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contactFieldConfigurationForFamilyNameForCountryCode:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PKContactFormatConfiguration contactFieldConfigurationForCountryCode:](self->_configuration, "contactFieldConfigurationForCountryCode:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nameComponentFormatConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "familyNameFieldConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contactFieldConfigurationForPhoneticGivenNameForCountryCode:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PKContactFormatConfiguration contactFieldConfigurationForCountryCode:](self->_configuration, "contactFieldConfigurationForCountryCode:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nameComponentFormatConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticGivenNameFieldConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contactFieldConfigurationForPhoneticFamilyNameForCountryCode:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PKContactFormatConfiguration contactFieldConfigurationForCountryCode:](self->_configuration, "contactFieldConfigurationForCountryCode:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nameComponentFormatConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticFamilyNameFieldConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_isFieldEntry:(id)a3 validForContactFieldConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
    goto LABEL_9;
  v9 = objc_msgSend(v7, "type");
  if (v9 == 2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[PKContactFormatValidator _isFieldEntry:validForPickerContactFieldConfiguration:](self, "_isFieldEntry:validForPickerContactFieldConfiguration:", v6, v8);
      goto LABEL_8;
    }
LABEL_9:
    v11 = 1;
    goto LABEL_10;
  }
  if (v9 != 1)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  v10 = -[PKContactFormatValidator _isFieldEntry:validForTextContactFieldConfiguration:](self, "_isFieldEntry:validForTextContactFieldConfiguration:", v6, v8);
LABEL_8:
  v11 = v10;
LABEL_10:

  return v11;
}

- (BOOL)_isFieldEntry:(id)a3 validForTextContactFieldConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  unint64_t v14;
  int v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "minLength");
    if (v8)
      v9 = objc_msgSend(v5, "length") >= v8;
    else
      v9 = 1;
    v10 = objc_msgSend(v7, "maxLength");
    if (v9 && v10)
      v9 = objc_msgSend(v5, "length") <= v10;
    objc_msgSend(v7, "characterSet");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v9 && v11)
    {
      v13 = objc_msgSend(v7, "isValidCharacterSet");
      if (objc_msgSend(v5, "length"))
      {
        v14 = 0;
        do
        {
          v15 = v13 ^ objc_msgSend(v12, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", v14));
          if (v15 == 1)
            break;
          ++v14;
        }
        while (v14 < objc_msgSend(v5, "length"));
        v9 = v15 ^ 1;
      }
      else
      {
        v9 = 1;
      }
    }
    objc_msgSend(v7, "validRegex");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v9 && v16)
      LOBYTE(v9) = objc_msgSend(v16, "numberOfMatchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length")) != 0;

  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (BOOL)_isFieldEntry:(id)a3 validForPickerContactFieldConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    objc_msgSend(v6, "pickerItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __82__PKContactFormatValidator__isFieldEntry_validForPickerContactFieldConfiguration___block_invoke;
    v11[3] = &unk_1E2ACF4E8;
    v12 = v5;
    v13 = &v14;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

    v9 = *((_BYTE *)v15 + 24) != 0;
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

uint64_t __82__PKContactFormatValidator__isFieldEntry_validForPickerContactFieldConfiguration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isValueAccepted:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)_formattedFieldEntry:(id)a3 forFieldConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "type") == 2)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v7, "pickerItems", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v13, "isValueAccepted:", v5))
          {
            objc_msgSend(v13, "submissionValue");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v5, "isEqualToString:", v14))
              goto LABEL_14;

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }
    v14 = 0;
LABEL_14:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
