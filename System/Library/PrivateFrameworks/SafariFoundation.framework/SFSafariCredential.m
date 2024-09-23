@implementation SFSafariCredential

- (SFSafariCredential)initWithUser:(id)a3 password:(id)a4 site:(id)a5 creationDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SFSafariCredential *v14;
  uint64_t v15;
  NSString *user;
  uint64_t v17;
  NSString *password;
  uint64_t v19;
  NSString *site;
  SFSafariCredential *v21;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SFSafariCredential;
  v14 = -[SFSafariCredential init](&v23, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    user = v14->_user;
    v14->_user = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    password = v14->_password;
    v14->_password = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    site = v14->_site;
    v14->_site = (NSString *)v19;

    objc_storeStrong((id *)&v14->_creationDate, a6);
    v21 = v14;
  }

  return v14;
}

- (SFSafariCredential)initWithUser:(id)a3 password:(id)a4 site:(id)a5 creationDate:(id)a6 customTitle:(id)a7
{
  id v12;
  SFSafariCredential *v13;
  uint64_t v14;
  NSString *customTitle;
  SFSafariCredential *v16;

  v12 = a7;
  v13 = -[SFSafariCredential initWithUser:password:site:creationDate:](self, "initWithUser:password:site:creationDate:", a3, a4, a5, a6);
  if (v13)
  {
    if (objc_msgSend(v12, "length"))
    {
      v14 = objc_msgSend(v12, "copy");
      customTitle = v13->_customTitle;
      v13->_customTitle = (NSString *)v14;

    }
    v16 = v13;
  }

  return v13;
}

- (SFSafariCredential)initWithUser:(id)a3 password:(id)a4 site:(id)a5 creationDate:(id)a6 groupName:(id)a7
{
  id v12;
  SFSafariCredential *v13;
  uint64_t v14;
  NSString *groupName;
  SFSafariCredential *v16;

  v12 = a7;
  v13 = -[SFSafariCredential initWithUser:password:site:creationDate:](self, "initWithUser:password:site:creationDate:", a3, a4, a5, a6);
  if (v13)
  {
    if (objc_msgSend(v12, "length"))
    {
      v14 = objc_msgSend(v12, "copy");
      groupName = v13->_groupName;
      v13->_groupName = (NSString *)v14;

    }
    v16 = v13;
  }

  return v13;
}

- (SFSafariCredential)initWithUser:(id)a3 password:(id)a4 site:(id)a5 creationDate:(id)a6 customTitle:(id)a7 groupName:(id)a8
{
  id v14;
  id v15;
  SFSafariCredential *v16;
  uint64_t v17;
  NSString *customTitle;
  uint64_t v19;
  NSString *groupName;
  SFSafariCredential *v21;

  v14 = a7;
  v15 = a8;
  v16 = -[SFSafariCredential initWithUser:password:site:creationDate:](self, "initWithUser:password:site:creationDate:", a3, a4, a5, a6);
  if (v16)
  {
    if (objc_msgSend(v14, "length"))
    {
      v17 = objc_msgSend(v14, "copy");
      customTitle = v16->_customTitle;
      v16->_customTitle = (NSString *)v17;

    }
    if (objc_msgSend(v15, "length"))
    {
      v19 = objc_msgSend(v15, "copy");
      groupName = v16->_groupName;
      v16->_groupName = (NSString *)v19;

    }
    v21 = v16;
  }

  return v16;
}

- (SFSafariCredential)initWithOneTimeCode:(id)a3
{
  id v4;
  SFSafariCredential *v5;
  uint64_t v6;
  NSString *oneTimeCode;
  SFSafariCredential *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFSafariCredential;
  v5 = -[SFSafariCredential init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    oneTimeCode = v5->_oneTimeCode;
    v5->_oneTimeCode = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (SFSafariCredential)initWithExternalCredential:(id)a3
{
  id v5;
  SFSafariCredential *v6;
  SFSafariCredential *v7;
  uint64_t v8;
  NSString *user;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  NSString *site;
  void *v15;
  void *v16;
  NSDate *v17;
  NSDate *creationDate;
  SFSafariCredential *v19;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SFSafariCredential;
  v6 = -[SFSafariCredential init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_externalCredential, a3);
    -[SFSafariPasswordCredential user](v7->_externalCredential, "user");
    v8 = objc_claimAutoreleasedReturnValue();
    user = v7->_user;
    v7->_user = (NSString *)v8;

    -[SFSafariPasswordCredential password](v7->_externalCredential, "password");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (__CFString *)v10;
    else
      v12 = &stru_24C9367F0;
    objc_storeStrong((id *)&v7->_password, v12);

    -[SFSafariPasswordCredential site](v7->_externalCredential, "site");
    v13 = objc_claimAutoreleasedReturnValue();
    site = v7->_site;
    v7->_site = (NSString *)v13;

    -[SFSafariPasswordCredential creationDate](v7->_externalCredential, "creationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    creationDate = v7->_creationDate;
    v7->_creationDate = v17;

    objc_opt_class();
    v7->_isExternalPasskey = objc_opt_isKindOfClass() & 1;
    v19 = v7;
  }

  return v7;
}

- (BOOL)isExternal
{
  return -[SFSafariPasswordCredential isExternal](self->_externalCredential, "isExternal");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; site = %@; user = %@; date = %@"),
               objc_opt_class(),
               self,
               self->_site,
               self->_user,
               self->_creationDate);
}

- (BOOL)isEqual:(id)a3
{
  SFSafariCredential *v4;
  SFSafariCredential *v5;
  SFSafariCredential *v6;
  SFSafariPasswordCredential *externalCredential;
  void *v8;
  char v9;
  NSString *user;
  NSString *password;
  void *v12;
  NSString *site;
  void *v14;
  NSDate *creationDate;
  void *v16;

  v4 = (SFSafariCredential *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      externalCredential = self->_externalCredential;
      if (externalCredential)
      {
        -[SFSafariCredential externalCredential](v6, "externalCredential");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[SFSafariPasswordCredential isEqual:](externalCredential, "isEqual:", v8);
      }
      else
      {
        user = self->_user;
        -[SFSafariCredential user](v6, "user");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqual:](user, "isEqual:", v8))
        {
          password = self->_password;
          -[SFSafariCredential password](v6, "password");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSString isEqual:](password, "isEqual:", v12))
          {
            site = self->_site;
            -[SFSafariCredential site](v6, "site");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSString isEqual:](site, "isEqual:", v14))
            {
              creationDate = self->_creationDate;
              -[SFSafariCredential creationDate](v6, "creationDate");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = -[NSDate isEqual:](creationDate, "isEqual:", v16);

            }
            else
            {
              v9 = 0;
            }

          }
          else
          {
            v9 = 0;
          }

        }
        else
        {
          v9 = 0;
        }
      }

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  SFSafariPasswordCredential *externalCredential;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  externalCredential = self->_externalCredential;
  if (externalCredential)
    return -[SFSafariPasswordCredential hash](externalCredential, "hash");
  v5 = -[NSString hash](self->_user, "hash");
  v6 = -[NSString hash](self->_password, "hash") ^ v5;
  v7 = -[NSString hash](self->_site, "hash");
  return v6 ^ v7 ^ -[NSDate hash](self->_creationDate, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSafariCredential)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SFSafariCredential *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SFSafariCredential *v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("externalCredential"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[SFSafariCredential initWithExternalCredential:](self, "initWithExternalCredential:", v6);
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("user"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("password"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("site"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customTitle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("oneTimeCode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = -[SFSafariCredential initWithOneTimeCode:](self, "initWithOneTimeCode:", v14);
    else
      v15 = -[SFSafariCredential initWithUser:password:site:creationDate:customTitle:groupName:](self, "initWithUser:password:site:creationDate:customTitle:groupName:", v8, v9, v10, v11, v12, v13);
    v7 = v15;

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  SFSafariPasswordCredential *externalCredential;
  id v4;
  const __CFString *v5;
  NSString *oneTimeCode;
  NSString *user;
  id v9;

  externalCredential = self->_externalCredential;
  if (externalCredential)
  {
    v4 = a3;
    v5 = CFSTR("externalCredential");
    oneTimeCode = (NSString *)externalCredential;
  }
  else
  {
    user = self->_user;
    v9 = a3;
    objc_msgSend(v9, "encodeObject:forKey:", user, CFSTR("user"));
    objc_msgSend(v9, "encodeObject:forKey:", self->_password, CFSTR("password"));
    objc_msgSend(v9, "encodeObject:forKey:", self->_site, CFSTR("site"));
    objc_msgSend(v9, "encodeObject:forKey:", self->_creationDate, CFSTR("date"));
    objc_msgSend(v9, "encodeObject:forKey:", self->_customTitle, CFSTR("customTitle"));
    objc_msgSend(v9, "encodeObject:forKey:", self->_groupName, CFSTR("groupName"));
    oneTimeCode = self->_oneTimeCode;
    v5 = CFSTR("oneTimeCode");
    v4 = v9;
  }
  objc_msgSend(v4, "encodeObject:forKey:", oneTimeCode, v5);

}

- (NSString)user
{
  return self->_user;
}

- (NSString)password
{
  return self->_password;
}

- (NSString)site
{
  return self->_site;
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (void)setLastUsedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsedDate, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (BOOL)isExternalPasskey
{
  return self->_isExternalPasskey;
}

- (NSString)oneTimeCode
{
  return self->_oneTimeCode;
}

- (SFSafariPasswordCredential)externalCredential
{
  return self->_externalCredential;
}

- (BOOL)isDefaultForAnAssociatedDomain
{
  return self->_isDefaultForAnAssociatedDomain;
}

- (void)setIsDefaultForAnAssociatedDomain:(BOOL)a3
{
  self->_isDefaultForAnAssociatedDomain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalCredential, 0);
  objc_storeStrong((id *)&self->_oneTimeCode, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_site, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

@end
