@implementation SFAppleIDContactInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAppleIDContactInfo)initWithCoder:(id)a3
{
  id v4;
  SFAppleIDContactInfo *v5;
  uint64_t v6;
  NSString *firstName;
  uint64_t v8;
  NSString *lastName;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  SFAppleIDContactInfo *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFAppleIDContactInfo;
  v5 = -[SFAppleIDContactInfo init](&v20, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("FirstName")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FirstName"));
      v6 = objc_claimAutoreleasedReturnValue();
      firstName = v5->_firstName;
      v5->_firstName = (NSString *)v6;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("LastName")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastName"));
      v8 = objc_claimAutoreleasedReturnValue();
      lastName = v5->_lastName;
      v5->_lastName = (NSString *)v8;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ValidatedEmailAddresses")))
    {
      v10 = (void *)MEMORY[0x1E0C99E60];
      v11 = objc_opt_class();
      objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("ValidatedEmailAddresses"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&v5->_validatedEmailAddresses, v13);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ValidatedPhoneNumbers")))
    {
      v14 = (void *)MEMORY[0x1E0C99E60];
      v15 = objc_opt_class();
      objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("ValidatedPhoneNumbers"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&v5->_validatedPhoneNumbers, v17);

    }
    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *firstName;
  NSString *lastName;
  NSArray *validatedEmailAddresses;
  NSArray *validatedPhoneNumbers;
  id v9;

  v4 = a3;
  firstName = self->_firstName;
  v9 = v4;
  if (firstName)
  {
    objc_msgSend(v4, "encodeObject:forKey:", firstName, CFSTR("FirstName"));
    v4 = v9;
  }
  lastName = self->_lastName;
  if (lastName)
  {
    objc_msgSend(v9, "encodeObject:forKey:", lastName, CFSTR("LastName"));
    v4 = v9;
  }
  validatedEmailAddresses = self->_validatedEmailAddresses;
  if (validatedEmailAddresses)
  {
    objc_msgSend(v9, "encodeObject:forKey:", validatedEmailAddresses, CFSTR("ValidatedEmailAddresses"));
    v4 = v9;
  }
  validatedPhoneNumbers = self->_validatedPhoneNumbers;
  if (validatedPhoneNumbers)
  {
    objc_msgSend(v9, "encodeObject:forKey:", validatedPhoneNumbers, CFSTR("ValidatedPhoneNumbers"));
    v4 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_firstName);
    objc_storeStrong(v5 + 2, self->_lastName);
    objc_storeStrong(v5 + 3, self->_validatedEmailAddresses);
    objc_storeStrong(v5 + 4, self->_validatedPhoneNumbers);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SFAppleIDContactInfo *v4;
  SFAppleIDContactInfo *v5;
  BOOL v6;

  v4 = (SFAppleIDContactInfo *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SFAppleIDContactInfo isEqualToContactInfo:](self, "isEqualToContactInfo:", v5);

  return v6;
}

- (BOOL)isEqualToContactInfo:(id)a3
{
  SFAppleIDContactInfo *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  char v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = (SFAppleIDContactInfo *)a3;
  if (self == v4)
  {
    v23 = 1;
    goto LABEL_18;
  }
  -[SFAppleIDContactInfo firstName](self, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDContactInfo firstName](v4, "firstName");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[SFAppleIDContactInfo firstName](self, "firstName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDContactInfo firstName](v4, "firstName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_12;
  }
  -[SFAppleIDContactInfo lastName](self, "lastName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDContactInfo lastName](v4, "lastName");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

  }
  else
  {
    v13 = (void *)v12;
    -[SFAppleIDContactInfo lastName](self, "lastName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDContactInfo lastName](v4, "lastName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  -[SFAppleIDContactInfo validatedEmailAddresses](self, "validatedEmailAddresses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDContactInfo validatedEmailAddresses](v4, "validatedEmailAddresses");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v17 == (void *)v18)
  {

  }
  else
  {
    v19 = (void *)v18;
    -[SFAppleIDContactInfo validatedEmailAddresses](self, "validatedEmailAddresses");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDContactInfo validatedEmailAddresses](v4, "validatedEmailAddresses");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
    {
LABEL_12:
      v23 = 0;
      goto LABEL_18;
    }
  }
  -[SFAppleIDContactInfo validatedPhoneNumbers](self, "validatedPhoneNumbers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAppleIDContactInfo validatedPhoneNumbers](v4, "validatedPhoneNumbers");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v24 == (void *)v25)
  {
    v23 = 1;
    v26 = v24;
  }
  else
  {
    v26 = (void *)v25;
    -[SFAppleIDContactInfo validatedPhoneNumbers](self, "validatedPhoneNumbers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppleIDContactInfo validatedPhoneNumbers](v4, "validatedPhoneNumbers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v27, "isEqual:", v28);

  }
LABEL_18:

  return v23;
}

- (SFAppleIDContactInfo)initWithDictionary:(id)a3
{
  id v4;
  SFAppleIDContactInfo *v5;
  uint64_t v6;
  NSString *firstName;
  uint64_t v8;
  NSString *lastName;
  uint64_t v10;
  NSArray *validatedEmailAddresses;
  uint64_t v12;
  NSArray *validatedPhoneNumbers;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFAppleIDContactInfo;
  v5 = -[SFAppleIDContactInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FirstName"));
    v6 = objc_claimAutoreleasedReturnValue();
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LastName"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ValidatedEmails"));
    v10 = objc_claimAutoreleasedReturnValue();
    validatedEmailAddresses = v5->_validatedEmailAddresses;
    v5->_validatedEmailAddresses = (NSArray *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ValidatedPhones"));
    v12 = objc_claimAutoreleasedReturnValue();
    validatedPhoneNumbers = v5->_validatedPhoneNumbers;
    v5->_validatedPhoneNumbers = (NSArray *)v12;

  }
  return v5;
}

- (id)description
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;

  NSAppendPrintF();
  v7 = 0;
  NSAppendPrintF();
  v2 = v7;

  NSAppendPrintF();
  v3 = v2;

  NSAppendPrintF();
  v4 = v3;

  NSAppendPrintF();
  v5 = v4;

  return v5;
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

- (NSArray)validatedEmailAddresses
{
  return self->_validatedEmailAddresses;
}

- (void)setValidatedEmailAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_validatedEmailAddresses, a3);
}

- (NSArray)validatedPhoneNumbers
{
  return self->_validatedPhoneNumbers;
}

- (void)setValidatedPhoneNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_validatedPhoneNumbers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validatedPhoneNumbers, 0);
  objc_storeStrong((id *)&self->_validatedEmailAddresses, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end
