@implementation RTContact

- (RTContact)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_givenName_middleName_familyName_postalAddresses_);
}

- (RTContact)initWithIdentifier:(id)a3 givenName:(id)a4 middleName:(id)a5 familyName:(id)a6 postalAddresses:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  RTContact *v17;
  uint64_t v18;
  NSString *identifier;
  uint64_t v20;
  NSString *givenName;
  uint64_t v22;
  NSString *middleName;
  uint64_t v24;
  NSString *familyName;
  uint64_t v26;
  NSArray *postalAddresses;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)RTContact;
  v17 = -[RTContact init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    givenName = v17->_givenName;
    v17->_givenName = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    middleName = v17->_middleName;
    v17->_middleName = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    familyName = v17->_familyName;
    v17->_familyName = (NSString *)v24;

    v26 = objc_msgSend(v16, "copy");
    postalAddresses = v17->_postalAddresses;
    v17->_postalAddresses = (NSArray *)v26;

  }
  return v17;
}

- (RTContact)initWithIdentifier:(id)a3 givenName:(id)a4 middleName:(id)a5 familyName:(id)a6 postalAddresses:(id)a7 phoneNumbers:(id)a8 emailAddresses:(id)a9
{
  id v15;
  id v16;
  RTContact *v17;
  uint64_t v18;
  NSArray *phoneNumbers;
  uint64_t v20;
  NSArray *emailAddresses;

  v15 = a8;
  v16 = a9;
  v17 = -[RTContact initWithIdentifier:givenName:middleName:familyName:postalAddresses:](self, "initWithIdentifier:givenName:middleName:familyName:postalAddresses:", a3, a4, a5, a6, a7);
  if (v17)
  {
    v18 = objc_msgSend(v15, "copy");
    phoneNumbers = v17->_phoneNumbers;
    v17->_phoneNumbers = (NSArray *)v18;

    v20 = objc_msgSend(v16, "copy");
    emailAddresses = v17->_emailAddresses;
    v17->_emailAddresses = (NSArray *)v20;

  }
  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v44;

  v3 = (void *)objc_opt_new();
  -[RTContact identifier](self, "identifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTContact givenName](self, "givenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTContact middleName](self, "middleName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTContact familyName](self, "familyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTContact postalAddresses](self, "postalAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[RTContact phoneNumbers](self, "phoneNumbers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  -[RTContact emailAddresses](self, "emailAddresses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier, %@, givenName, %@, middleName, %@, familyName, %@, postalAddresses count, %lu, phoneNumbers count, %lu, emailAddresses count, %lu, "), v44, v4, v5, v6, v8, v10, objc_msgSend(v11, "count"));

  -[RTContact postalAddresses](self, "postalAddresses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = 0;
    do
    {
      v15 = (void *)MEMORY[0x1D8231EA8]();
      v16 = v14 + 1;
      -[RTContact postalAddresses](self, "postalAddresses");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTContactPostalAddress labelTypeToString:](RTContactPostalAddress, "labelTypeToString:", objc_msgSend(v18, "labelType"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTContact postalAddresses](self, "postalAddresses");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "thoroughfare");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("postalAddress %lu, labelType, %@, thoroughfare, %@, "), v16, v19, v22);

      objc_autoreleasePoolPop(v15);
      -[RTContact postalAddresses](self, "postalAddresses");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

      v14 = v16;
    }
    while (v24 > v16);
  }
  -[RTContact phoneNumbers](self, "phoneNumbers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (v26)
  {
    v27 = 0;
    do
    {
      v28 = (void *)MEMORY[0x1D8231EA8]();
      v29 = v27 + 1;
      -[RTContact phoneNumbers](self, "phoneNumbers");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("phoneNumber %lu, %@, "), v29, v31);

      objc_autoreleasePoolPop(v28);
      -[RTContact phoneNumbers](self, "phoneNumbers");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");

      v27 = v29;
    }
    while (v33 > v29);
  }
  -[RTContact emailAddresses](self, "emailAddresses");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");

  if (v35)
  {
    v36 = 0;
    do
    {
      v37 = (void *)MEMORY[0x1D8231EA8]();
      v38 = v36 + 1;
      -[RTContact emailAddresses](self, "emailAddresses");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectAtIndexedSubscript:", v36);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("emailAddress %lu, %@, "), v38, v40);

      objc_autoreleasePoolPop(v37);
      -[RTContact emailAddresses](self, "emailAddresses");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "count");

      v36 = v38;
    }
    while (v42 > v38);
  }
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSArray)postalAddresses
{
  return self->_postalAddresses;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
