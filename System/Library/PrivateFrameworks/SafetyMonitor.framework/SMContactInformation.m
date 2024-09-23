@implementation SMContactInformation

- (SMContactInformation)initWithEmail:(id)a3 phoneNumber:(id)a4
{
  id v7;
  id v8;
  SMContactInformation *v9;
  SMContactInformation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SMContactInformation;
  v9 = -[SMContactInformation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_email, a3);
    objc_storeStrong((id *)&v10->_phoneNumber, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMContactInformation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SMContactInformation *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Email"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PhoneNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SMContactInformation initWithEmail:phoneNumber:](self, "initWithEmail:phoneNumber:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *email;
  id v5;

  email = self->_email;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", email, CFSTR("Email"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumber, CFSTR("PhoneNumber"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SMContactInformation email](self, "email");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SMContactInformation phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SMContactInformation *v5;
  SMContactInformation *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (SMContactInformation *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[SMContactInformation email](self, "email");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMContactInformation email](v6, "email");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[SMContactInformation email](self, "email");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMContactInformation email](v6, "email");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:", v3))
        {
          v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      -[SMContactInformation phoneNumber](self, "phoneNumber");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMContactInformation phoneNumber](v6, "phoneNumber");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[SMContactInformation phoneNumber](self, "phoneNumber");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMContactInformation phoneNumber](v6, "phoneNumber");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v13, "isEqual:", v14);

      }
      v9 = v16;
      if (v7 == v8)
        goto LABEL_14;
      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SMContactInformation phoneNumber](self, "phoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMContactInformation email](self, "email");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("phone number, %@, email, %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)email
{
  return self->_email;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_email, 0);
}

@end
