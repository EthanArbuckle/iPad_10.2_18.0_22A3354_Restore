@implementation TUPrivacyRule

- (id)initForPhoneNumber:(id)a3
{
  id v5;
  TUPrivacyRule *v6;
  TUPrivacyRule *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUPrivacyRule;
  v6 = -[TUPrivacyRule init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 0;
    objc_storeStrong((id *)&v6->_phoneNumber, a3);
    if (!v7->_phoneNumber)
    {

      v7 = 0;
    }
  }

  return v7;
}

- (id)initForEmail:(id)a3
{
  id v5;
  TUPrivacyRule *v6;
  TUPrivacyRule *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUPrivacyRule;
  v6 = -[TUPrivacyRule init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 1;
    objc_storeStrong((id *)&v6->_email, a3);
    if (!v7->_email)
    {

      v7 = 0;
    }
  }

  return v7;
}

- (id)initForBusinessID:(id)a3
{
  id v5;
  TUPrivacyRule *v6;
  TUPrivacyRule *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUPrivacyRule;
  v6 = -[TUPrivacyRule init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 2;
    objc_storeStrong((id *)&v6->_businessID, a3);
    if (!v7->_businessID)
    {

      v7 = 0;
    }
  }

  return v7;
}

+ (id)ruleForPhoneNumber:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[TUPrivacyRule initForPhoneNumber:]([TUPrivacyRule alloc], "initForPhoneNumber:", v3);

  return v4;
}

+ (id)ruleForEmail:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[TUPrivacyRule initForEmail:]([TUPrivacyRule alloc], "initForEmail:", v3);

  return v4;
}

+ (id)ruleForBusinessID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[TUPrivacyRule initForBusinessID:]([TUPrivacyRule alloc], "initForBusinessID:", v3);

  return v4;
}

- (TUPrivacyRule)initWithCoder:(id)a3
{
  id v4;
  TUPrivacyRule *v5;
  int v6;
  uint64_t v7;
  TUPhoneNumber *businessID;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUPrivacyRule;
  v5 = -[TUPrivacyRule init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("Type"));
    v5->_type = v6;
    switch(v6)
    {
      case 2:
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BusinessID"));
        v9 = objc_claimAutoreleasedReturnValue();
        businessID = (TUPhoneNumber *)v5->_businessID;
        v5->_businessID = (NSString *)v9;
        goto LABEL_8;
      case 1:
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Email"));
        v10 = objc_claimAutoreleasedReturnValue();
        businessID = (TUPhoneNumber *)v5->_email;
        v5->_email = (NSString *)v10;
        goto LABEL_8;
      case 0:
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PhoneNumber"));
        v7 = objc_claimAutoreleasedReturnValue();
        businessID = v5->_phoneNumber;
        v5->_phoneNumber = (TUPhoneNumber *)v7;
LABEL_8:

        break;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t type;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", self->_type, CFSTR("Type"));
  type = self->_type;
  if (type <= 2)
    objc_msgSend(v5, "encodeObject:forKey:", *((_QWORD *)&self->_phoneNumber + type), off_1E38A39C0[(int)type]);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int type;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[TUPrivacyRule type](self, "type");
    if (v6 == objc_msgSend(v5, "type"))
    {
      type = self->_type;
      switch(type)
      {
        case 2:
          -[TUPrivacyRule businessID](self, "businessID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "businessID");
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        case 1:
          -[TUPrivacyRule email](self, "email");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "email");
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        case 0:
          -[TUPrivacyRule phoneNumber](self, "phoneNumber");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "phoneNumber");
          v9 = objc_claimAutoreleasedReturnValue();
LABEL_11:
          v11 = (void *)v9;
          v10 = objc_msgSend(v8, "isEqual:", v9);

          goto LABEL_12;
      }
    }
    v10 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (int)type
{
  return self->_type;
}

- (TUPhoneNumber)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)email
{
  return self->_email;
}

- (NSString)businessID
{
  return self->_businessID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessID, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end
