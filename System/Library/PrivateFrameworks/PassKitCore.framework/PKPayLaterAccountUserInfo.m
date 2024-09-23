@implementation PKPayLaterAccountUserInfo

- (PKPayLaterAccountUserInfo)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterAccountUserInfo *v5;
  void *v6;
  PKPayLaterAccountUserInfoValue *v7;
  PKPayLaterAccountUserInfoValue *emailAddress;
  void *v9;
  PKPayLaterAccountUserInfoValue *v10;
  PKPayLaterAccountUserInfoValue *firstName;
  void *v12;
  PKPayLaterAccountUserInfoValue *v13;
  PKPayLaterAccountUserInfoValue *lastName;
  void *v15;
  PKPayLaterAccountUserInfoValue *v16;
  PKPayLaterAccountUserInfoValue *dateOfBirth;
  void *v18;
  PKPayLaterAccountUserInfoValue *v19;
  PKPayLaterAccountUserInfoValue *phoneNumber;
  void *v21;
  PKPayLaterAccountUserInfoValue *v22;
  PKPayLaterAccountUserInfoValue *street1;
  void *v24;
  PKPayLaterAccountUserInfoValue *v25;
  PKPayLaterAccountUserInfoValue *street2;
  void *v27;
  PKPayLaterAccountUserInfoValue *v28;
  PKPayLaterAccountUserInfoValue *city;
  void *v30;
  PKPayLaterAccountUserInfoValue *v31;
  PKPayLaterAccountUserInfoValue *state;
  void *v33;
  PKPayLaterAccountUserInfoValue *v34;
  PKPayLaterAccountUserInfoValue *postalCode;
  void *v36;
  PKPayLaterAccountUserInfoValue *v37;
  PKPayLaterAccountUserInfoValue *ssn;
  void *v39;
  PKPayLaterAccountUserInfoValue *v40;
  PKPayLaterAccountUserInfoValue *yearlyIncome;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PKPayLaterAccountUserInfo;
  v5 = -[PKPayLaterAccountUserInfo init](&v43, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("emailAddress"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v7 = -[PKPayLaterAccountUserInfoValue initWithDictionary:]([PKPayLaterAccountUserInfoValue alloc], "initWithDictionary:", v6);
      emailAddress = v5->_emailAddress;
      v5->_emailAddress = v7;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("firstName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      v10 = -[PKPayLaterAccountUserInfoValue initWithDictionary:]([PKPayLaterAccountUserInfoValue alloc], "initWithDictionary:", v9);
      firstName = v5->_firstName;
      v5->_firstName = v10;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("lastName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      v13 = -[PKPayLaterAccountUserInfoValue initWithDictionary:]([PKPayLaterAccountUserInfoValue alloc], "initWithDictionary:", v12);
      lastName = v5->_lastName;
      v5->_lastName = v13;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("dateOfBirth"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "count"))
    {
      v16 = -[PKPayLaterAccountUserInfoValue initWithDictionary:]([PKPayLaterAccountUserInfoValue alloc], "initWithDictionary:", v15);
      dateOfBirth = v5->_dateOfBirth;
      v5->_dateOfBirth = v16;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("phoneNumber"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "count"))
    {
      v19 = -[PKPayLaterAccountUserInfoValue initWithDictionary:]([PKPayLaterAccountUserInfoValue alloc], "initWithDictionary:", v18);
      phoneNumber = v5->_phoneNumber;
      v5->_phoneNumber = v19;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("street1"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "count"))
    {
      v22 = -[PKPayLaterAccountUserInfoValue initWithDictionary:]([PKPayLaterAccountUserInfoValue alloc], "initWithDictionary:", v21);
      street1 = v5->_street1;
      v5->_street1 = v22;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("street2"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v24, "count"))
    {
      v25 = -[PKPayLaterAccountUserInfoValue initWithDictionary:]([PKPayLaterAccountUserInfoValue alloc], "initWithDictionary:", v24);
      street2 = v5->_street2;
      v5->_street2 = v25;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("city"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v27, "count"))
    {
      v28 = -[PKPayLaterAccountUserInfoValue initWithDictionary:]([PKPayLaterAccountUserInfoValue alloc], "initWithDictionary:", v27);
      city = v5->_city;
      v5->_city = v28;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("state"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v30, "count"))
    {
      v31 = -[PKPayLaterAccountUserInfoValue initWithDictionary:]([PKPayLaterAccountUserInfoValue alloc], "initWithDictionary:", v30);
      state = v5->_state;
      v5->_state = v31;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("postalCode"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v33, "count"))
    {
      v34 = -[PKPayLaterAccountUserInfoValue initWithDictionary:]([PKPayLaterAccountUserInfoValue alloc], "initWithDictionary:", v33);
      postalCode = v5->_postalCode;
      v5->_postalCode = v34;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("ssn"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v36, "count"))
    {
      v37 = -[PKPayLaterAccountUserInfoValue initWithDictionary:]([PKPayLaterAccountUserInfoValue alloc], "initWithDictionary:", v36);
      ssn = v5->_ssn;
      v5->_ssn = v37;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("yearlyIncome"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v39, "count"))
    {
      v40 = -[PKPayLaterAccountUserInfoValue initWithDictionary:]([PKPayLaterAccountUserInfoValue alloc], "initWithDictionary:", v39);
      yearlyIncome = v5->_yearlyIncome;
      v5->_yearlyIncome = v40;

    }
  }

  return v5;
}

- (id)contact
{
  CNContact *contact;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
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
  id v34;
  void *v35;
  void *v36;
  void *v37;
  CNContact *v38;
  CNContact *v39;
  CNContact *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  contact = self->_contact;
  if (contact)
    return contact;
  v5 = objc_alloc_init(MEMORY[0x1E0C97360]);
  -[PKPayLaterAccountUserInfoValue text](self->_firstName, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGivenName:", v6);

  -[PKPayLaterAccountUserInfoValue text](self->_lastName, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFamilyName:", v7);

  -[PKPayLaterAccountUserInfoValue text](self->_emailAddress, "text");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0C97338]);
    v10 = (void *)objc_msgSend(v9, "initWithLabel:value:", *MEMORY[0x1E0C96FF0], v8);
    v45[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEmailAddresses:", v11);

  }
  v42 = (void *)v8;
  -[PKPayLaterAccountUserInfoValue text](self->_street1, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterAccountUserInfoValue text](self->_street2, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterAccountUserInfoValue text](self->_city, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterAccountUserInfoValue text](self->_state, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterAccountUserInfoValue text](self->_postalCode, "text");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v12 || v13 || v14 || v15 || v16)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C97378]);
    if (objc_msgSend(v13, "length"))
    {
      objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("\n%@"), v13);
      v19 = v17;
      v20 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v20;
      v17 = v19;
    }
    if (v12)
      objc_msgSend(v18, "setStreet:", v12);
    objc_msgSend(v18, "setCity:", v14);
    objc_msgSend(v18, "setState:", v15);
    objc_msgSend(v18, "setPostalCode:", v17);
    if (v18)
    {
      v21 = objc_alloc(MEMORY[0x1E0C97338]);
      v22 = v13;
      v23 = v15;
      v24 = v17;
      v25 = (void *)objc_msgSend(v21, "initWithLabel:value:", *MEMORY[0x1E0C96FF8], v18);
      v44 = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPostalAddresses:", v26);

      v17 = v24;
      v15 = v23;
      v13 = v22;
    }

  }
  -[PKPayLaterAccountUserInfoValue date](self->_dateOfBirth, "date");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "components:fromDate:", 254, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
      objc_msgSend(v5, "setBirthday:", v29);

  }
  -[PKPayLaterAccountUserInfoValue text](self->_phoneNumber, "text");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v41 = v13;
    v31 = v15;
    v32 = v17;
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:", v30);
    if (v33)
    {
      v34 = objc_alloc(MEMORY[0x1E0C97338]);
      v35 = (void *)objc_msgSend(v34, "initWithLabel:value:", *MEMORY[0x1E0C96FF8], v33);
      v43 = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
      v36 = v14;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPhoneNumbers:", v37);

      v14 = v36;
    }

    v17 = v32;
    v15 = v31;
    v13 = v41;
  }
  v38 = (CNContact *)objc_msgSend(v5, "copy");
  v39 = self->_contact;
  self->_contact = v38;

  v40 = self->_contact;
  return v40;
}

- (BOOL)hasUserInfo
{
  void *v2;
  BOOL v3;

  -[PKPayLaterAccountUserInfo contact](self, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterAccountUserInfo)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterAccountUserInfo *v5;
  uint64_t v6;
  PKPayLaterAccountUserInfoValue *emailAddress;
  uint64_t v8;
  PKPayLaterAccountUserInfoValue *firstName;
  uint64_t v10;
  PKPayLaterAccountUserInfoValue *lastName;
  uint64_t v12;
  PKPayLaterAccountUserInfoValue *dateOfBirth;
  uint64_t v14;
  PKPayLaterAccountUserInfoValue *phoneNumber;
  uint64_t v16;
  PKPayLaterAccountUserInfoValue *street1;
  uint64_t v18;
  PKPayLaterAccountUserInfoValue *street2;
  uint64_t v20;
  PKPayLaterAccountUserInfoValue *city;
  uint64_t v22;
  PKPayLaterAccountUserInfoValue *state;
  uint64_t v24;
  PKPayLaterAccountUserInfoValue *postalCode;
  uint64_t v26;
  PKPayLaterAccountUserInfoValue *ssn;
  uint64_t v28;
  PKPayLaterAccountUserInfoValue *yearlyIncome;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKPayLaterAccountUserInfo;
  v5 = -[PKPayLaterAccountUserInfo init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("emailAddress"));
    v6 = objc_claimAutoreleasedReturnValue();
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (PKPayLaterAccountUserInfoValue *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstName"));
    v8 = objc_claimAutoreleasedReturnValue();
    firstName = v5->_firstName;
    v5->_firstName = (PKPayLaterAccountUserInfoValue *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastName"));
    v10 = objc_claimAutoreleasedReturnValue();
    lastName = v5->_lastName;
    v5->_lastName = (PKPayLaterAccountUserInfoValue *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateOfBirth"));
    v12 = objc_claimAutoreleasedReturnValue();
    dateOfBirth = v5->_dateOfBirth;
    v5->_dateOfBirth = (PKPayLaterAccountUserInfoValue *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v14 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (PKPayLaterAccountUserInfoValue *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("street1"));
    v16 = objc_claimAutoreleasedReturnValue();
    street1 = v5->_street1;
    v5->_street1 = (PKPayLaterAccountUserInfoValue *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("street2"));
    v18 = objc_claimAutoreleasedReturnValue();
    street2 = v5->_street2;
    v5->_street2 = (PKPayLaterAccountUserInfoValue *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("city"));
    v20 = objc_claimAutoreleasedReturnValue();
    city = v5->_city;
    v5->_city = (PKPayLaterAccountUserInfoValue *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v22 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (PKPayLaterAccountUserInfoValue *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("postalCode"));
    v24 = objc_claimAutoreleasedReturnValue();
    postalCode = v5->_postalCode;
    v5->_postalCode = (PKPayLaterAccountUserInfoValue *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ssn"));
    v26 = objc_claimAutoreleasedReturnValue();
    ssn = v5->_ssn;
    v5->_ssn = (PKPayLaterAccountUserInfoValue *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("yearlyIncome"));
    v28 = objc_claimAutoreleasedReturnValue();
    yearlyIncome = v5->_yearlyIncome;
    v5->_yearlyIncome = (PKPayLaterAccountUserInfoValue *)v28;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKPayLaterAccountUserInfoValue *emailAddress;
  id v5;

  emailAddress = self->_emailAddress;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", emailAddress, CFSTR("emailAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstName, CFSTR("firstName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastName, CFSTR("lastName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateOfBirth, CFSTR("dateOfBirth"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumber, CFSTR("phoneNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_street1, CFSTR("street1"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_street2, CFSTR("street2"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_city, CFSTR("city"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_postalCode, CFSTR("postalCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ssn, CFSTR("ssn"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_yearlyIncome, CFSTR("yearlyIncome"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PKPayLaterAccountUserInfoValue *emailAddress;
  PKPayLaterAccountUserInfoValue *v6;
  PKPayLaterAccountUserInfoValue *firstName;
  PKPayLaterAccountUserInfoValue *v8;
  PKPayLaterAccountUserInfoValue *lastName;
  PKPayLaterAccountUserInfoValue *v10;
  PKPayLaterAccountUserInfoValue *dateOfBirth;
  PKPayLaterAccountUserInfoValue *v12;
  PKPayLaterAccountUserInfoValue *phoneNumber;
  PKPayLaterAccountUserInfoValue *v14;
  PKPayLaterAccountUserInfoValue *street1;
  PKPayLaterAccountUserInfoValue *v16;
  PKPayLaterAccountUserInfoValue *street2;
  PKPayLaterAccountUserInfoValue *v18;
  PKPayLaterAccountUserInfoValue *city;
  PKPayLaterAccountUserInfoValue *v20;
  PKPayLaterAccountUserInfoValue *state;
  PKPayLaterAccountUserInfoValue *v22;
  PKPayLaterAccountUserInfoValue *postalCode;
  PKPayLaterAccountUserInfoValue *v24;
  PKPayLaterAccountUserInfoValue *ssn;
  PKPayLaterAccountUserInfoValue *v26;
  PKPayLaterAccountUserInfoValue *yearlyIncome;
  PKPayLaterAccountUserInfoValue *v28;
  BOOL v29;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_59;
  emailAddress = self->_emailAddress;
  v6 = (PKPayLaterAccountUserInfoValue *)v4[2];
  if (emailAddress && v6)
  {
    if (!-[PKPayLaterAccountUserInfoValue isEqual:](emailAddress, "isEqual:"))
      goto LABEL_59;
  }
  else if (emailAddress != v6)
  {
    goto LABEL_59;
  }
  firstName = self->_firstName;
  v8 = (PKPayLaterAccountUserInfoValue *)v4[3];
  if (firstName && v8)
  {
    if (!-[PKPayLaterAccountUserInfoValue isEqual:](firstName, "isEqual:"))
      goto LABEL_59;
  }
  else if (firstName != v8)
  {
    goto LABEL_59;
  }
  lastName = self->_lastName;
  v10 = (PKPayLaterAccountUserInfoValue *)v4[4];
  if (lastName && v10)
  {
    if (!-[PKPayLaterAccountUserInfoValue isEqual:](lastName, "isEqual:"))
      goto LABEL_59;
  }
  else if (lastName != v10)
  {
    goto LABEL_59;
  }
  dateOfBirth = self->_dateOfBirth;
  v12 = (PKPayLaterAccountUserInfoValue *)v4[5];
  if (dateOfBirth && v12)
  {
    if (!-[PKPayLaterAccountUserInfoValue isEqual:](dateOfBirth, "isEqual:"))
      goto LABEL_59;
  }
  else if (dateOfBirth != v12)
  {
    goto LABEL_59;
  }
  phoneNumber = self->_phoneNumber;
  v14 = (PKPayLaterAccountUserInfoValue *)v4[6];
  if (phoneNumber && v14)
  {
    if (!-[PKPayLaterAccountUserInfoValue isEqual:](phoneNumber, "isEqual:"))
      goto LABEL_59;
  }
  else if (phoneNumber != v14)
  {
    goto LABEL_59;
  }
  street1 = self->_street1;
  v16 = (PKPayLaterAccountUserInfoValue *)v4[7];
  if (street1 && v16)
  {
    if (!-[PKPayLaterAccountUserInfoValue isEqual:](street1, "isEqual:"))
      goto LABEL_59;
  }
  else if (street1 != v16)
  {
    goto LABEL_59;
  }
  street2 = self->_street2;
  v18 = (PKPayLaterAccountUserInfoValue *)v4[8];
  if (street2 && v18)
  {
    if (!-[PKPayLaterAccountUserInfoValue isEqual:](street2, "isEqual:"))
      goto LABEL_59;
  }
  else if (street2 != v18)
  {
    goto LABEL_59;
  }
  city = self->_city;
  v20 = (PKPayLaterAccountUserInfoValue *)v4[9];
  if (city && v20)
  {
    if (!-[PKPayLaterAccountUserInfoValue isEqual:](city, "isEqual:"))
      goto LABEL_59;
  }
  else if (city != v20)
  {
    goto LABEL_59;
  }
  state = self->_state;
  v22 = (PKPayLaterAccountUserInfoValue *)v4[10];
  if (state && v22)
  {
    if (!-[PKPayLaterAccountUserInfoValue isEqual:](state, "isEqual:"))
      goto LABEL_59;
  }
  else if (state != v22)
  {
    goto LABEL_59;
  }
  postalCode = self->_postalCode;
  v24 = (PKPayLaterAccountUserInfoValue *)v4[11];
  if (postalCode && v24)
  {
    if (!-[PKPayLaterAccountUserInfoValue isEqual:](postalCode, "isEqual:"))
      goto LABEL_59;
  }
  else if (postalCode != v24)
  {
    goto LABEL_59;
  }
  ssn = self->_ssn;
  v26 = (PKPayLaterAccountUserInfoValue *)v4[12];
  if (!ssn || !v26)
  {
    if (ssn == v26)
      goto LABEL_55;
LABEL_59:
    v29 = 0;
    goto LABEL_60;
  }
  if (!-[PKPayLaterAccountUserInfoValue isEqual:](ssn, "isEqual:"))
    goto LABEL_59;
LABEL_55:
  yearlyIncome = self->_yearlyIncome;
  v28 = (PKPayLaterAccountUserInfoValue *)v4[13];
  if (yearlyIncome && v28)
    v29 = -[PKPayLaterAccountUserInfoValue isEqual:](yearlyIncome, "isEqual:");
  else
    v29 = yearlyIncome == v28;
LABEL_60:

  return v29;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_emailAddress);
  objc_msgSend(v3, "safelyAddObject:", self->_firstName);
  objc_msgSend(v3, "safelyAddObject:", self->_lastName);
  objc_msgSend(v3, "safelyAddObject:", self->_dateOfBirth);
  objc_msgSend(v3, "safelyAddObject:", self->_phoneNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_street1);
  objc_msgSend(v3, "safelyAddObject:", self->_street2);
  objc_msgSend(v3, "safelyAddObject:", self->_city);
  objc_msgSend(v3, "safelyAddObject:", self->_state);
  objc_msgSend(v3, "safelyAddObject:", self->_postalCode);
  objc_msgSend(v3, "safelyAddObject:", self->_ssn);
  objc_msgSend(v3, "safelyAddObject:", self->_yearlyIncome);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("emailAddress: '%@'; "), self->_emailAddress);
  objc_msgSend(v3, "appendFormat:", CFSTR("firstName: '%@'; "), self->_firstName);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastName: '%@'; "), self->_lastName);
  objc_msgSend(v3, "appendFormat:", CFSTR("dateOfBirth: '%@'; "), self->_dateOfBirth);
  objc_msgSend(v3, "appendFormat:", CFSTR("phoneNumber: '%@'; "), self->_phoneNumber);
  objc_msgSend(v3, "appendFormat:", CFSTR("street1: '%@'; "), self->_street1);
  objc_msgSend(v3, "appendFormat:", CFSTR("street2: '%@'; "), self->_street2);
  objc_msgSend(v3, "appendFormat:", CFSTR("city: '%@'; "), self->_city);
  objc_msgSend(v3, "appendFormat:", CFSTR("state: '%@'; "), self->_state);
  objc_msgSend(v3, "appendFormat:", CFSTR("postalCode: '%@'; "), self->_postalCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("ssn: '%@'; "), self->_ssn);
  objc_msgSend(v3, "appendFormat:", CFSTR("yearlyIncome: '%@'; "), self->_yearlyIncome);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterAccountUserInfo *v5;
  PKPayLaterAccountUserInfoValue *v6;
  PKPayLaterAccountUserInfoValue *emailAddress;
  PKPayLaterAccountUserInfoValue *v8;
  PKPayLaterAccountUserInfoValue *firstName;
  PKPayLaterAccountUserInfoValue *v10;
  PKPayLaterAccountUserInfoValue *lastName;
  PKPayLaterAccountUserInfoValue *v12;
  PKPayLaterAccountUserInfoValue *dateOfBirth;
  PKPayLaterAccountUserInfoValue *v14;
  PKPayLaterAccountUserInfoValue *phoneNumber;
  PKPayLaterAccountUserInfoValue *v16;
  PKPayLaterAccountUserInfoValue *street1;
  PKPayLaterAccountUserInfoValue *v18;
  PKPayLaterAccountUserInfoValue *street2;
  PKPayLaterAccountUserInfoValue *v20;
  PKPayLaterAccountUserInfoValue *city;
  PKPayLaterAccountUserInfoValue *v22;
  PKPayLaterAccountUserInfoValue *state;
  PKPayLaterAccountUserInfoValue *v24;
  PKPayLaterAccountUserInfoValue *postalCode;
  PKPayLaterAccountUserInfoValue *v26;
  PKPayLaterAccountUserInfoValue *ssn;
  PKPayLaterAccountUserInfoValue *v28;
  PKPayLaterAccountUserInfoValue *yearlyIncome;

  v5 = -[PKPayLaterAccountUserInfo init](+[PKPayLaterAccountUserInfo allocWithZone:](PKPayLaterAccountUserInfo, "allocWithZone:"), "init");
  v6 = -[PKPayLaterAccountUserInfoValue copyWithZone:](self->_emailAddress, "copyWithZone:", a3);
  emailAddress = v5->_emailAddress;
  v5->_emailAddress = v6;

  v8 = -[PKPayLaterAccountUserInfoValue copyWithZone:](self->_firstName, "copyWithZone:", a3);
  firstName = v5->_firstName;
  v5->_firstName = v8;

  v10 = -[PKPayLaterAccountUserInfoValue copyWithZone:](self->_lastName, "copyWithZone:", a3);
  lastName = v5->_lastName;
  v5->_lastName = v10;

  v12 = -[PKPayLaterAccountUserInfoValue copyWithZone:](self->_dateOfBirth, "copyWithZone:", a3);
  dateOfBirth = v5->_dateOfBirth;
  v5->_dateOfBirth = v12;

  v14 = -[PKPayLaterAccountUserInfoValue copyWithZone:](self->_phoneNumber, "copyWithZone:", a3);
  phoneNumber = v5->_phoneNumber;
  v5->_phoneNumber = v14;

  v16 = -[PKPayLaterAccountUserInfoValue copyWithZone:](self->_street1, "copyWithZone:", a3);
  street1 = v5->_street1;
  v5->_street1 = v16;

  v18 = -[PKPayLaterAccountUserInfoValue copyWithZone:](self->_street2, "copyWithZone:", a3);
  street2 = v5->_street2;
  v5->_street2 = v18;

  v20 = -[PKPayLaterAccountUserInfoValue copyWithZone:](self->_city, "copyWithZone:", a3);
  city = v5->_city;
  v5->_city = v20;

  v22 = -[PKPayLaterAccountUserInfoValue copyWithZone:](self->_state, "copyWithZone:", a3);
  state = v5->_state;
  v5->_state = v22;

  v24 = -[PKPayLaterAccountUserInfoValue copyWithZone:](self->_postalCode, "copyWithZone:", a3);
  postalCode = v5->_postalCode;
  v5->_postalCode = v24;

  v26 = -[PKPayLaterAccountUserInfoValue copyWithZone:](self->_ssn, "copyWithZone:", a3);
  ssn = v5->_ssn;
  v5->_ssn = v26;

  v28 = -[PKPayLaterAccountUserInfoValue copyWithZone:](self->_yearlyIncome, "copyWithZone:", a3);
  yearlyIncome = v5->_yearlyIncome;
  v5->_yearlyIncome = v28;

  return v5;
}

- (PKPayLaterAccountUserInfoValue)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddress, a3);
}

- (PKPayLaterAccountUserInfoValue)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (PKPayLaterAccountUserInfoValue)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (PKPayLaterAccountUserInfoValue)dateOfBirth
{
  return self->_dateOfBirth;
}

- (void)setDateOfBirth:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfBirth, a3);
}

- (PKPayLaterAccountUserInfoValue)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (PKPayLaterAccountUserInfoValue)street1
{
  return self->_street1;
}

- (void)setStreet1:(id)a3
{
  objc_storeStrong((id *)&self->_street1, a3);
}

- (PKPayLaterAccountUserInfoValue)street2
{
  return self->_street2;
}

- (void)setStreet2:(id)a3
{
  objc_storeStrong((id *)&self->_street2, a3);
}

- (PKPayLaterAccountUserInfoValue)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
  objc_storeStrong((id *)&self->_city, a3);
}

- (PKPayLaterAccountUserInfoValue)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (PKPayLaterAccountUserInfoValue)postalCode
{
  return self->_postalCode;
}

- (void)setPostalCode:(id)a3
{
  objc_storeStrong((id *)&self->_postalCode, a3);
}

- (PKPayLaterAccountUserInfoValue)ssn
{
  return self->_ssn;
}

- (void)setSsn:(id)a3
{
  objc_storeStrong((id *)&self->_ssn, a3);
}

- (PKPayLaterAccountUserInfoValue)yearlyIncome
{
  return self->_yearlyIncome;
}

- (void)setYearlyIncome:(id)a3
{
  objc_storeStrong((id *)&self->_yearlyIncome, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yearlyIncome, 0);
  objc_storeStrong((id *)&self->_ssn, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_street2, 0);
  objc_storeStrong((id *)&self->_street1, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_dateOfBirth, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
