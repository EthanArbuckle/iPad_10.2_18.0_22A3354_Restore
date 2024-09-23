@implementation RMManagementChannel

- (RMManagementChannel)initWithType:(int64_t)a3 identifier:(id)a4 accountIdentifier:(id)a5 accountDescription:(id)a6 organizationDescription:(id)a7 enrollmentURL:(id)a8 enrollmentToken:(id)a9 isEnrolled:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  RMManagementChannel *v22;
  RMManagementChannel *v23;
  uint64_t v24;
  NSString *identifier;
  uint64_t v26;
  NSString *accountIdentifier;
  uint64_t v28;
  NSString *accountDescription;
  uint64_t v30;
  NSString *organizationDescription;
  uint64_t v32;
  NSURL *enrollmentURL;
  uint64_t v34;
  NSString *enrollmentToken;
  objc_super v37;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v37.receiver = self;
  v37.super_class = (Class)RMManagementChannel;
  v22 = -[RMManagementChannel init](&v37, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_type = a3;
    v24 = objc_msgSend(v16, "copy");
    identifier = v23->_identifier;
    v23->_identifier = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    accountIdentifier = v23->_accountIdentifier;
    v23->_accountIdentifier = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    accountDescription = v23->_accountDescription;
    v23->_accountDescription = (NSString *)v28;

    v30 = objc_msgSend(v19, "copy");
    organizationDescription = v23->_organizationDescription;
    v23->_organizationDescription = (NSString *)v30;

    v32 = objc_msgSend(v20, "copy");
    enrollmentURL = v23->_enrollmentURL;
    v23->_enrollmentURL = (NSURL *)v32;

    v34 = objc_msgSend(v21, "copy");
    enrollmentToken = v23->_enrollmentToken;
    v23->_enrollmentToken = (NSString *)v34;

    v23->_isEnrolled = a10;
  }

  return v23;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMManagementChannel identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { identifier = %@, type = %ld }>"), v5, self, v6, -[RMManagementChannel type](self, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMManagementChannel)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  RMManagementChannel *v13;
  uint64_t v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("account-identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("account-description"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("organization-description"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enrollment-url"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enrollment-token"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("is-enrolled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v12, "BOOLValue");
  LOBYTE(v15) = (_BYTE)v4;
  v13 = -[RMManagementChannel initWithType:identifier:accountIdentifier:accountDescription:organizationDescription:enrollmentURL:enrollmentToken:isEnrolled:](self, "initWithType:identifier:accountIdentifier:accountDescription:organizationDescription:enrollmentURL:enrollmentToken:isEnrolled:", v5, v6, v7, v8, v9, v10, v11, v15);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[RMManagementChannel type](self, "type"), CFSTR("type"));
  -[RMManagementChannel identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[RMManagementChannel accountIdentifier](self, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("account-identifier"));

  -[RMManagementChannel accountDescription](self, "accountDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("account-description"));

  -[RMManagementChannel organizationDescription](self, "organizationDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("organization-description"));

  -[RMManagementChannel enrollmentURL](self, "enrollmentURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("enrollment-url"));

  -[RMManagementChannel enrollmentToken](self, "enrollmentToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("enrollment-token"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[RMManagementChannel isEnrolled](self, "isEnrolled"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("is-enrolled"));

}

- (BOOL)isEqual:(id)a3
{
  RMManagementChannel *v4;
  BOOL v5;

  v4 = (RMManagementChannel *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[RMManagementChannel isEqualToChannel:](self, "isEqualToChannel:", v4);
  }

  return v5;
}

- (BOOL)isEqualToChannel:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  BOOL v11;

  v4 = a3;
  v5 = -[RMManagementChannel hash](self, "hash");
  if (v5 == objc_msgSend(v4, "hash"))
  {
    -[RMManagementChannel identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[RMManagementChannel enrollmentToken](self, "enrollmentToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "enrollmentToken");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        v10 = -[RMManagementChannel type](self, "type");
        v11 = v10 == objc_msgSend(v4, "type");
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[RMManagementChannel identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RMManagementChannel enrollmentToken](self, "enrollmentToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[RMManagementChannel type](self, "type");

  return v7;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)accountDescription
{
  return self->_accountDescription;
}

- (NSString)organizationDescription
{
  return self->_organizationDescription;
}

- (NSURL)enrollmentURL
{
  return self->_enrollmentURL;
}

- (NSString)enrollmentToken
{
  return self->_enrollmentToken;
}

- (BOOL)isEnrolled
{
  return self->_isEnrolled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentToken, 0);
  objc_storeStrong((id *)&self->_enrollmentURL, 0);
  objc_storeStrong((id *)&self->_organizationDescription, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
