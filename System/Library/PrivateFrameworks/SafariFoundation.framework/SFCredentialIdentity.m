@implementation SFCredentialIdentity

- (SFCredentialIdentity)init
{

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCredentialIdentity)initWithRowIdentifier:(int64_t)a3 serviceIdentifier:(id)a4 serviceIdentifierType:(int64_t)a5 externalRecordIdentifier:(id)a6 user:(id)a7 rank:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  SFCredentialIdentity *v17;
  SFCredentialIdentity *v18;
  uint64_t v19;
  NSString *serviceIdentifier;
  uint64_t v21;
  NSString *externalRecordIdentifier;
  uint64_t v23;
  NSString *user;
  SFCredentialIdentity *v25;
  objc_super v27;

  v14 = a4;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)SFCredentialIdentity;
  v17 = -[SFCredentialIdentity init](&v27, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_rowIdentifier = a3;
    v19 = objc_msgSend(v14, "copy");
    serviceIdentifier = v18->_serviceIdentifier;
    v18->_serviceIdentifier = (NSString *)v19;

    v18->_serviceIdentifierType = a5;
    v21 = objc_msgSend(v15, "copy");
    externalRecordIdentifier = v18->_externalRecordIdentifier;
    v18->_externalRecordIdentifier = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    user = v18->_user;
    v18->_user = (NSString *)v23;

    v18->_rank = a8;
    v25 = v18;
  }

  return v18;
}

- (SFCredentialIdentity)initWithServiceIdentifier:(id)a3 serviceIdentifierType:(int64_t)a4 externalRecordIdentifier:(id)a5 user:(id)a6 rank:(int64_t)a7
{
  return -[SFCredentialIdentity initWithRowIdentifier:serviceIdentifier:serviceIdentifierType:externalRecordIdentifier:user:rank:](self, "initWithRowIdentifier:serviceIdentifier:serviceIdentifierType:externalRecordIdentifier:user:rank:", -1, a3, a4, a5, a6, a7);
}

- (SFCredentialIdentity)initWithRowIdentifier:(int64_t)a3 serviceIdentifier:(id)a4 serviceIdentifierType:(int64_t)a5 externalRecordIdentifier:(id)a6 user:(id)a7 rank:(int64_t)a8 owningExtensionState:(id)a9
{
  id v16;
  SFCredentialIdentity *v17;
  SFCredentialIdentity *v18;
  SFCredentialIdentity *v19;

  v16 = a9;
  v17 = -[SFCredentialIdentity initWithRowIdentifier:serviceIdentifier:serviceIdentifierType:externalRecordIdentifier:user:rank:](self, "initWithRowIdentifier:serviceIdentifier:serviceIdentifierType:externalRecordIdentifier:user:rank:", a3, a4, a5, a6, a7, a8);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_owningExtensionState, a9);
    v19 = v18;
  }

  return v18;
}

- (int64_t)type
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t rowIdentifier;
  id v5;

  rowIdentifier = self->_rowIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", rowIdentifier, CFSTR("rowIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceIdentifier, CFSTR("serviceIdentifier"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_serviceIdentifierType, CFSTR("serviceIdentifierType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalRecordIdentifier, CFSTR("externalRecordIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_user, CFSTR("user"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_rank, CFSTR("rank"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_owningExtensionState, CFSTR("owningExtensionState"));

}

- (SFCredentialIdentity)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  SFCredentialIdentity *v23;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("rowIdentifier"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("serviceIdentifier"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (__CFString *)v7;
  else
    v9 = &stru_24C9367F0;
  v10 = v9;

  v11 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("serviceIdentifierType"));
  if (v11 >= 2)
    v12 = 0;
  else
    v12 = v11;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("externalRecordIdentifier"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (__CFString *)v13;
  else
    v15 = &stru_24C9367F0;
  v16 = v15;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("user"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (__CFString *)v17;
  else
    v19 = &stru_24C9367F0;
  v20 = v19;

  v21 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("rank"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("owningExtensionState"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[SFCredentialIdentity initWithRowIdentifier:serviceIdentifier:serviceIdentifierType:externalRecordIdentifier:user:rank:owningExtensionState:](self, "initWithRowIdentifier:serviceIdentifier:serviceIdentifierType:externalRecordIdentifier:user:rank:owningExtensionState:", v6, v10, v12, v16, v20, v21, v22);
  return v23;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = self->_serviceIdentifierType ^ -[NSString hash](self->_serviceIdentifier, "hash");
  v4 = -[NSString hash](self->_user, "hash");
  return v3 ^ v4 ^ -[NSString hash](self->_externalRecordIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SFCredentialIdentity *v4;
  SFCredentialIdentity *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  int64_t serviceIdentifierType;
  NSString *serviceIdentifier;
  NSString *user;
  NSString *externalRecordIdentifier;
  char v13;

  v4 = (SFCredentialIdentity *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SFCredentialIdentity serviceIdentifier](v5, "serviceIdentifier");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      -[SFCredentialIdentity user](v5, "user");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      -[SFCredentialIdentity externalRecordIdentifier](v5, "externalRecordIdentifier");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      serviceIdentifierType = self->_serviceIdentifierType;
      if (serviceIdentifierType == -[SFCredentialIdentity serviceIdentifierType](v5, "serviceIdentifierType")
        && ((serviceIdentifier = self->_serviceIdentifier, serviceIdentifier == v6)
         || -[NSString isEqualToString:](serviceIdentifier, "isEqualToString:", v6))
        && ((user = self->_user, user == v7) || -[NSString isEqualToString:](user, "isEqualToString:", v7)))
      {
        externalRecordIdentifier = self->_externalRecordIdentifier;
        if (externalRecordIdentifier == v8)
          v13 = 1;
        else
          v13 = -[NSString isEqualToString:](externalRecordIdentifier, "isEqualToString:", v8);
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)_domainWithoutWWWDot
{
  NSString *domainWithoutWWWDot;
  int64_t serviceIdentifierType;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;

  domainWithoutWWWDot = self->_domainWithoutWWWDot;
  if (!domainWithoutWWWDot)
  {
    serviceIdentifierType = self->_serviceIdentifierType;
    if (serviceIdentifierType == 1)
    {
      objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", self->_serviceIdentifier);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "host");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "safari_stringByRemovingWwwDotPrefix");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = self->_domainWithoutWWWDot;
      self->_domainWithoutWWWDot = v8;

    }
    else
    {
      if (serviceIdentifierType)
      {
LABEL_7:
        domainWithoutWWWDot = self->_domainWithoutWWWDot;
        return domainWithoutWWWDot;
      }
      -[NSString safari_stringByRemovingWwwDotPrefix](self->_serviceIdentifier, "safari_stringByRemovingWwwDotPrefix");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      v6 = self->_domainWithoutWWWDot;
      self->_domainWithoutWWWDot = v5;
    }

    goto LABEL_7;
  }
  return domainWithoutWWWDot;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRowIdentifier:serviceIdentifier:serviceIdentifierType:externalRecordIdentifier:user:rank:", self->_rowIdentifier, self->_serviceIdentifier, self->_serviceIdentifierType, self->_externalRecordIdentifier, self->_user, self->_rank);
}

- (int64_t)compareForQuickTypeBar:(id)a3
{
  id v4;
  int64_t v5;
  int64_t serviceIdentifierType;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  int64_t rank;
  BOOL v16;
  BOOL v17;
  uint64_t v18;

  v4 = a3;
  if (-[SFCredentialIdentity type](self, "type") == 2 && objc_msgSend(v4, "type") != 2)
  {
    v5 = -1;
  }
  else if (-[SFCredentialIdentity type](self, "type") == 2 || objc_msgSend(v4, "type") != 2)
  {
    serviceIdentifierType = self->_serviceIdentifierType;
    if (serviceIdentifierType == objc_msgSend(v4, "serviceIdentifierType"))
    {
      -[SFCredentialIdentity _domainWithoutWWWDot](self, "_domainWithoutWWWDot");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_domainWithoutWWWDot");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "safari_isCaseInsensitiveEqualToString:", v8);

      if ((v9 & 1) != 0)
        goto LABEL_12;
    }
    -[SFCredentialIdentity _domainWithoutWWWDot](self, "_domainWithoutWWWDot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "safari_countOfString:", CFSTR("."));

    objc_msgSend(v4, "_domainWithoutWWWDot");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "safari_countOfString:", CFSTR("."));

    v5 = v11 < v13 ? -1 : 1;
    if (v11 == v13)
    {
LABEL_12:
      v14 = objc_msgSend(v4, "rank");
      rank = self->_rank;
      v16 = rank == v14;
      v17 = rank <= v14;
      v18 = -1;
      if (v17)
        v18 = 1;
      if (v16)
        v5 = 0;
      else
        v5 = v18;
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (NSString)site
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[SFCredentialIdentity serviceIdentifierType](self, "serviceIdentifierType") == 1)
  {
    v3 = (void *)MEMORY[0x24BDD1808];
    -[SFCredentialIdentity serviceIdentifier](self, "serviceIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SFCredentialIdentity serviceIdentifier](self, "serviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (NSString)password
{
  return 0;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
}

- (BOOL)isExternal
{
  return 1;
}

- (int64_t)rowIdentifier
{
  return self->_rowIdentifier;
}

- (void)setRowIdentifier:(int64_t)a3
{
  self->_rowIdentifier = a3;
}

- (int64_t)serviceIdentifierType
{
  return self->_serviceIdentifierType;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSString)externalRecordIdentifier
{
  return self->_externalRecordIdentifier;
}

- (NSString)user
{
  return self->_user;
}

- (int64_t)rank
{
  return self->_rank;
}

- (SFCredentialProviderExtensionState)owningExtensionState
{
  return self->_owningExtensionState;
}

- (void)setOwningExtensionState:(id)a3
{
  objc_storeStrong((id *)&self->_owningExtensionState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owningExtensionState, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_externalRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_domainWithoutWWWDot, 0);
}

@end
