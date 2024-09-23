@implementation PKContact

+ (int64_t)version
{
  return 4;
}

- (PKContact)initWithCNContact:(id)a3
{
  id v4;
  PKContact *v5;
  uint64_t v6;
  NSPersonNameComponents *name;
  void *v8;
  void *v9;
  uint64_t v10;
  CNPostalAddress *postalAddress;
  uint64_t v12;
  NSString *supplementarySubLocality;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *emailAddress;
  void *v18;
  void *v19;
  uint64_t v20;
  CNPhoneNumber *phoneNumber;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKContact;
  v5 = -[PKContact init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "nameComponents");
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSPersonNameComponents *)v6;

    if (objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x1E0C967F0]))
    {
      objc_msgSend(v4, "postalAddresses");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "value");
      v10 = objc_claimAutoreleasedReturnValue();
      postalAddress = v5->_postalAddress;
      v5->_postalAddress = (CNPostalAddress *)v10;

      -[CNPostalAddress subLocality](v5->_postalAddress, "subLocality");
      v12 = objc_claimAutoreleasedReturnValue();
      supplementarySubLocality = v5->_supplementarySubLocality;
      v5->_supplementarySubLocality = (NSString *)v12;

    }
    if (objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x1E0C966A8]))
    {
      objc_msgSend(v4, "emailAddresses");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "value");
      v16 = objc_claimAutoreleasedReturnValue();
      emailAddress = v5->_emailAddress;
      v5->_emailAddress = (NSString *)v16;

    }
    if (objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x1E0C967C0]))
    {
      objc_msgSend(v4, "phoneNumbers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "value");
      v20 = objc_claimAutoreleasedReturnValue();
      phoneNumber = v5->_phoneNumber;
      v5->_phoneNumber = (CNPhoneNumber *)v20;

    }
  }

  return v5;
}

- (PKContact)initWithCoder:(id)a3
{
  id v4;
  PKContact *v5;
  uint64_t v6;
  NSPersonNameComponents *name;
  uint64_t v8;
  NSString *emailAddress;
  uint64_t v10;
  CNPhoneNumber *phoneNumber;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  CNPostalAddress *postalAddress;
  uint64_t v17;
  NSString *supplementarySubLocality;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKContact;
  v5 = -[PKContact init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSPersonNameComponents *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("emailAddress"));
    v8 = objc_claimAutoreleasedReturnValue();
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v10 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (CNPhoneNumber *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("postalAddress"));
    v15 = objc_claimAutoreleasedReturnValue();
    postalAddress = v5->_postalAddress;
    v5->_postalAddress = (CNPostalAddress *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supplementarySublocality"));
    v17 = objc_claimAutoreleasedReturnValue();
    supplementarySubLocality = v5->_supplementarySubLocality;
    v5->_supplementarySubLocality = (NSString *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSPersonNameComponents *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emailAddress, CFSTR("emailAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumber, CFSTR("phoneNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_postalAddress, CFSTR("postalAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supplementarySubLocality, CFSTR("supplementarySublocality"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  PKContact *v4;
  PKContact *v5;
  BOOL v6;

  v4 = (PKContact *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKContact isEqualToContact:](self, "isEqualToContact:", v5);

  return v6;
}

- (BOOL)isEqualToContact:(id)a3
{
  _QWORD *v4;
  NSPersonNameComponents *name;
  NSPersonNameComponents *v6;
  BOOL v7;
  char v8;
  CNPostalAddress *postalAddress;
  CNPostalAddress *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  _BOOL4 v15;
  CNPhoneNumber *phoneNumber;
  CNPhoneNumber *v17;
  char v18;
  NSString *supplementarySubLocality;
  NSString *v21;

  v4 = a3;
  name = self->_name;
  v6 = (NSPersonNameComponents *)v4[1];
  if (name)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (name != v6)
      goto LABEL_26;
  }
  else
  {
    v8 = -[NSPersonNameComponents isEqual:](name, "isEqual:");
    if ((v8 & 1) == 0)
      goto LABEL_26;
  }
  postalAddress = self->_postalAddress;
  v10 = (CNPostalAddress *)v4[2];
  if (postalAddress && v10)
  {
    if ((-[CNPostalAddress isEqual:](postalAddress, "isEqual:") & 1) == 0)
      goto LABEL_26;
  }
  else if (postalAddress != v10)
  {
    goto LABEL_26;
  }
  v11 = (void *)v4[4];
  v12 = self->_emailAddress;
  v13 = v11;
  if (v12 == v13)
  {

  }
  else
  {
    v14 = v13;
    if (!v12 || !v13)
    {

      goto LABEL_26;
    }
    v15 = -[NSString isEqualToString:](v12, "isEqualToString:", v13);

    if (!v15)
      goto LABEL_26;
  }
  phoneNumber = self->_phoneNumber;
  v17 = (CNPhoneNumber *)v4[3];
  if (phoneNumber && v17)
  {
    if ((-[CNPhoneNumber isEqual:](phoneNumber, "isEqual:") & 1) != 0)
      goto LABEL_28;
LABEL_26:
    v18 = 0;
    goto LABEL_27;
  }
  if (phoneNumber != v17)
    goto LABEL_26;
LABEL_28:
  supplementarySubLocality = self->_supplementarySubLocality;
  v21 = (NSString *)v4[5];
  if (supplementarySubLocality && v21)
    v18 = -[NSString isEqual:](supplementarySubLocality, "isEqual:");
  else
    v18 = supplementarySubLocality == v21;
LABEL_27:

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_name);
  objc_msgSend(v3, "safelyAddObject:", self->_emailAddress);
  objc_msgSend(v3, "safelyAddObject:", self->_phoneNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_postalAddress);
  objc_msgSend(v3, "safelyAddObject:", self->_supplementarySubLocality);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKContact *v5;
  uint64_t v6;
  NSPersonNameComponents *name;
  uint64_t v8;
  NSString *emailAddress;
  uint64_t v10;
  NSString *supplementarySubLocality;
  char v12;
  CNPhoneNumber *phoneNumber;
  CNPhoneNumber *v14;
  CNPhoneNumber *v15;
  char v16;
  CNPostalAddress *postalAddress;
  CNPostalAddress *v18;
  CNPostalAddress *v19;

  v5 = -[PKContact init](+[PKContact allocWithZone:](PKContact, "allocWithZone:"), "init");
  v6 = -[NSPersonNameComponents copyWithZone:](self->_name, "copyWithZone:", a3);
  name = v5->_name;
  v5->_name = (NSPersonNameComponents *)v6;

  v8 = -[NSString copyWithZone:](self->_emailAddress, "copyWithZone:", a3);
  emailAddress = v5->_emailAddress;
  v5->_emailAddress = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_supplementarySubLocality, "copyWithZone:", a3);
  supplementarySubLocality = v5->_supplementarySubLocality;
  v5->_supplementarySubLocality = (NSString *)v10;

  v12 = objc_opt_respondsToSelector();
  phoneNumber = self->_phoneNumber;
  if ((v12 & 1) != 0)
    v14 = (CNPhoneNumber *)-[CNPhoneNumber copyWithZone:](phoneNumber, "copyWithZone:", a3);
  else
    v14 = phoneNumber;
  v15 = v5->_phoneNumber;
  v5->_phoneNumber = v14;

  v16 = objc_opt_respondsToSelector();
  postalAddress = self->_postalAddress;
  if ((v16 & 1) != 0)
    v18 = (CNPostalAddress *)-[CNPostalAddress copyWithZone:](postalAddress, "copyWithZone:", a3);
  else
    v18 = postalAddress;
  v19 = v5->_postalAddress;
  v5->_postalAddress = v18;

  return v5;
}

- (id)cnMutableContact
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSPersonNameComponents *name;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C97360]);
  v4 = (_QWORD *)MEMORY[0x1E0C96FF8];
  if (self->_postalAddress)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97338]), "initWithLabel:value:", *MEMORY[0x1E0C96FF8], self->_postalAddress);
    v22[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPostalAddresses:", v6);

  }
  if (self->_emailAddress)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97338]), "initWithLabel:value:", *v4, self->_emailAddress);
    v21 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEmailAddresses:", v8);

  }
  if (self->_phoneNumber)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97338]), "initWithLabel:value:", *v4, self->_phoneNumber);
    v20 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPhoneNumbers:", v10);

  }
  name = self->_name;
  if (name)
  {
    -[NSPersonNameComponents givenName](name, "givenName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setGivenName:", v12);

    -[NSPersonNameComponents familyName](self->_name, "familyName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFamilyName:", v13);

    -[NSPersonNameComponents phoneticRepresentation](self->_name, "phoneticRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[NSPersonNameComponents phoneticRepresentation](self->_name, "phoneticRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "givenName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setPhoneticGivenName:", v16);

      -[NSPersonNameComponents phoneticRepresentation](self->_name, "phoneticRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "familyName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setPhoneticFamilyName:", v18);

    }
  }
  return v3;
}

- (NSString)contactHandle
{
  NSString *emailAddress;

  emailAddress = self->_emailAddress;
  if (emailAddress)
    return emailAddress;
  -[CNPhoneNumber stringValue](self->_phoneNumber, "stringValue");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)sanitizePostalAddressCountry
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKContact sanitizePostalAddressCountryWithLocale:](self, "sanitizePostalAddressCountryWithLocale:", v3);

}

- (void)sanitizePostalAddressCountryWithLocale:(id)a3
{
  id v4;
  CNPostalAddress *postalAddress;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CNPostalAddress *v18;
  __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CNPostalAddress *v26;
  CNPostalAddress *v27;
  void *v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  postalAddress = self->_postalAddress;
  if (postalAddress)
  {
    v28 = v4;
    -[CNPostalAddress ISOCountryCode](postalAddress, "ISOCountryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uppercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "pk_stringIfNotEmpty");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0C973B0], "supportedCountries");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __52__PKContact_sanitizePostalAddressCountryWithLocale___block_invoke;
    v29[3] = &unk_1E2ADA500;
    v10 = v7;
    v30 = v10;
    objc_msgSend(v9, "pk_firstObjectPassingTest:", v29);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[CNPostalAddress country](self->_postalAddress, "country");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pk_stringIfNotEmpty");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
LABEL_11:

        v4 = v28;
        goto LABEL_12;
      }
      v14 = (void *)-[CNPostalAddress mutableCopy](self->_postalAddress, "mutableCopy");
      v15 = (void *)MEMORY[0x1E0C973B0];
      objc_msgSend(v10, "lowercaseString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedCountryNameForISOCountryCode:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCountry:", v17);

      v18 = (CNPostalAddress *)objc_msgSend(v14, "copy");
      v19 = (__CFString *)self->_postalAddress;
      self->_postalAddress = v18;
    }
    else
    {
LABEL_6:
      v14 = (void *)-[CNPostalAddress mutableCopy](self->_postalAddress, "mutableCopy");
      objc_msgSend(v28, "regionCode");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "uppercaseString");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v19)
        v21 = v19;
      else
        v21 = CFSTR("US");
      objc_msgSend(v14, "setISOCountryCode:", v21);
      v22 = (void *)MEMORY[0x1E0C973B0];
      objc_msgSend(v14, "ISOCountryCode");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lowercaseString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedCountryNameForISOCountryCode:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCountry:", v25);

      v26 = (CNPostalAddress *)objc_msgSend(v14, "copy");
      v27 = self->_postalAddress;
      self->_postalAddress = v26;

      v11 = 0;
    }

    goto LABEL_11;
  }
LABEL_12:

}

uint64_t __52__PKContact_sanitizePostalAddressCountryWithLocale___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "isoCountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));
  return v5;
}

- (PKContact)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  PKContact *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSPersonNameComponents *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSPersonNameComponents *name;
  uint64_t v20;
  NSString *emailAddress;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  CNPhoneNumber *phoneNumber;
  void *v27;
  uint64_t v28;
  void *v29;
  CNPostalAddress *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  CNPostalAddress *postalAddress;
  CNPostalAddress *v47;
  PKContact *v48;
  PKContact *v49;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, void *, uint64_t);
  void *v54;
  id v55;
  _QWORD v56[5];
  objc_super v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;

  v6 = a3;
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 1;
  v57.receiver = self;
  v57.super_class = (Class)PKContact;
  v7 = -[PKContact init](&v57, sel_init);
  if (!v7)
    goto LABEL_33;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = MEMORY[0x1E0C809B0];
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __38__PKContact_initWithDictionary_error___block_invoke;
    v56[3] = &unk_1E2ADA598;
    v56[4] = &v58;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v56);
    if (*((_BYTE *)v59 + 24))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("familyName"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {

      }
      else
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("givenName"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
LABEL_15:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("emailAddress"));
          v20 = objc_claimAutoreleasedReturnValue();
          emailAddress = v7->_emailAddress;
          v7->_emailAddress = (NSString *)v20;

          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("phoneNumber"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            v23 = objc_alloc(MEMORY[0x1E0C97398]);
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("phoneNumber"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v23, "initWithStringValue:", v24);
            phoneNumber = v7->_phoneNumber;
            v7->_phoneNumber = (CNPhoneNumber *)v25;

          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("addressLines"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "count");

          if (v28)
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("addressLines"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (CNPostalAddress *)objc_alloc_init(MEMORY[0x1E0C97378]);
            v51 = v8;
            v52 = 3221225472;
            v53 = __38__PKContact_initWithDictionary_error___block_invoke_3;
            v54 = &unk_1E2AC59C0;
            v31 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            v55 = v31;
            objc_msgSend(v29, "enumerateObjectsUsingBlock:", &v51);
            -[CNPostalAddress setStreet:](v30, "setStreet:", v31, v51, v52, v53, v54);
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("locality"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (v32)
            {
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("locality"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[CNPostalAddress setCity:](v30, "setCity:", v33);

            }
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("postalCode"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
            {
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("postalCode"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[CNPostalAddress setPostalCode:](v30, "setPostalCode:", v35);

            }
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("administrativeArea"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
            {
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("administrativeArea"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[CNPostalAddress setState:](v30, "setState:", v37);

            }
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subAdministrativeArea"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v38)
            {
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subAdministrativeArea"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[CNPostalAddress setSubAdministrativeArea:](v30, "setSubAdministrativeArea:", v39);

            }
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("country"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            if (v40)
            {
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("country"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              -[CNPostalAddress setCountry:](v30, "setCountry:", v41);

            }
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("countryCode"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            if (v42)
            {
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("countryCode"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              -[CNPostalAddress setISOCountryCode:](v30, "setISOCountryCode:", v43);

            }
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subLocality"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (v44)
            {
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subLocality"));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              -[CNPostalAddress setSubLocality:](v30, "setSubLocality:", v45);

            }
            postalAddress = v7->_postalAddress;
            v7->_postalAddress = v30;
            v47 = v30;

          }
          goto LABEL_33;
        }
      }
      v11 = (NSPersonNameComponents *)objc_alloc_init(MEMORY[0x1E0CB3850]);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("familyName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSPersonNameComponents setFamilyName:](v11, "setFamilyName:", v12);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("givenName"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSPersonNameComponents setGivenName:](v11, "setGivenName:", v13);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("phoneticGivenName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {

      }
      else
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("phoneticFamilyName"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
LABEL_14:
          name = v7->_name;
          v7->_name = v11;

          goto LABEL_15;
        }
      }
      v16 = objc_alloc_init(MEMORY[0x1E0CB3850]);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("phoneticFamilyName"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFamilyName:", v17);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("phoneticGivenName"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setGivenName:", v18);

      -[NSPersonNameComponents setPhoneticRepresentation:](v7->_name, "setPhoneticRepresentation:", v16);
      goto LABEL_14;
    }
  }
  else
  {
    *((_BYTE *)v59 + 24) = 0;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_33:
  if (*((_BYTE *)v59 + 24))
    v48 = v7;
  else
    v48 = 0;
  v49 = v48;
  _Block_object_dispose(&v58, 8);

  return v49;
}

void __38__PKContact_initWithDictionary_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _QWORD v6[5];

  v5 = a3;
  if (!objc_msgSend(a2, "isEqualToString:", CFSTR("addressLines")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_6;
LABEL_5:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__PKContact_initWithDictionary_error___block_invoke_2;
  v6[3] = &unk_1E2AC1A70;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);
LABEL_6:

}

void __38__PKContact_initWithDictionary_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;

  v3 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

void __38__PKContact_initWithDictionary_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);

}

- (id)dictionaryRepresentation
{
  id v3;
  CNPhoneNumber *phoneNumber;
  void *v5;
  NSString *emailAddress;
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
  CNPostalAddress *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  phoneNumber = self->_phoneNumber;
  if (phoneNumber)
  {
    -[CNPhoneNumber stringValue](phoneNumber, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("phoneNumber"));

  }
  emailAddress = self->_emailAddress;
  if (emailAddress)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", emailAddress, CFSTR("emailAddress"));
  -[NSPersonNameComponents givenName](self->_name, "givenName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSPersonNameComponents givenName](self->_name, "givenName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("givenName"));

  }
  -[NSPersonNameComponents familyName](self->_name, "familyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NSPersonNameComponents familyName](self->_name, "familyName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("familyName"));

  }
  -[NSPersonNameComponents phoneticRepresentation](self->_name, "phoneticRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "givenName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NSPersonNameComponents phoneticRepresentation](self->_name, "phoneticRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "givenName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("phoneticGivenName"));

  }
  -[NSPersonNameComponents phoneticRepresentation](self->_name, "phoneticRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "familyName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[NSPersonNameComponents phoneticRepresentation](self->_name, "phoneticRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "familyName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("phoneticFamilyName"));

  }
  v19 = self->_postalAddress;
  -[CNPostalAddress street](v19, "street");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CNPostalAddress street](v19, "street");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsSeparatedByString:", CFSTR("\n"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("addressLines"));

  }
  -[CNPostalAddress city](v19, "city");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[CNPostalAddress city](v19, "city");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("locality"));

  }
  -[CNPostalAddress postalCode](v19, "postalCode");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[CNPostalAddress postalCode](v19, "postalCode");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("postalCode"));

  }
  -[CNPostalAddress subLocality](v19, "subLocality");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[CNPostalAddress subLocality](v19, "subLocality");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("subLocality"));

  }
  -[CNPostalAddress state](v19, "state");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[CNPostalAddress state](v19, "state");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("administrativeArea"));

  }
  -[CNPostalAddress country](v19, "country");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[CNPostalAddress country](v19, "country");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("country"));

  }
  -[CNPostalAddress ISOCountryCode](v19, "ISOCountryCode");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[CNPostalAddress ISOCountryCode](v19, "ISOCountryCode");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("countryCode"));

  }
  v35 = (void *)objc_msgSend(v3, "copy");

  return v35;
}

- (NSPersonNameComponents)name
{
  return self->_name;
}

- (void)setName:(NSPersonNameComponents *)name
{
  objc_storeStrong((id *)&self->_name, name);
}

- (CNPostalAddress)postalAddress
{
  return self->_postalAddress;
}

- (void)setPostalAddress:(CNPostalAddress *)postalAddress
{
  objc_storeStrong((id *)&self->_postalAddress, postalAddress);
}

- (CNPhoneNumber)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(CNPhoneNumber *)phoneNumber
{
  objc_storeStrong((id *)&self->_phoneNumber, phoneNumber);
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(NSString *)emailAddress
{
  objc_storeStrong((id *)&self->_emailAddress, emailAddress);
}

- (NSString)supplementarySubLocality
{
  return self->_supplementarySubLocality;
}

- (void)setSupplementarySubLocality:(NSString *)supplementarySubLocality
{
  objc_storeStrong((id *)&self->_supplementarySubLocality, supplementarySubLocality);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementarySubLocality, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_postalAddress, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
