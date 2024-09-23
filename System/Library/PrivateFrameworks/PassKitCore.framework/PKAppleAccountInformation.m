@implementation PKAppleAccountInformation

- (BOOL)isSandboxAccount
{
  return self->_isSandboxAccount;
}

- (BOOL)isManagedAppleAccount
{
  return self->_isManagedAppleAccount;
}

- (void)setPrimaryEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setIsWalletEnabledOnManagedAppleAccount:(BOOL)a3
{
  self->_isWalletEnabledOnManagedAppleAccount = a3;
}

- (void)setIsSandboxAccount:(BOOL)a3
{
  self->_isSandboxAccount = a3;
}

- (void)setIsManagedAppleAccount:(BOOL)a3
{
  self->_isManagedAppleAccount = a3;
}

- (void)setFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (void)setAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setAidaToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setAidaAlternateDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAaDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setAaAlternateDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_authorizationHeader, 0);
  objc_storeStrong((id *)&self->_primaryEmailAddress, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_aaAlternateDSID, 0);
  objc_storeStrong((id *)&self->_aaDSID, 0);
  objc_storeStrong((id *)&self->_aidaToken, 0);
  objc_storeStrong((id *)&self->_aidaAlternateDSID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppleAccountInformation)initWithCoder:(id)a3
{
  id v4;
  PKAppleAccountInformation *v5;
  uint64_t v6;
  NSString *aidaAlternateDSID;
  uint64_t v8;
  NSString *aidaToken;
  uint64_t v10;
  NSString *aaDSID;
  uint64_t v12;
  NSString *aaAlternateDSID;
  uint64_t v14;
  NSString *appleID;
  uint64_t v16;
  NSString *firstName;
  uint64_t v18;
  NSString *lastName;
  uint64_t v20;
  NSString *primaryEmailAddress;
  uint64_t v22;
  NSDate *creationDate;
  id v24;
  uint64_t v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKAppleAccountInformation;
  v5 = -[PKAppleAccountInformation init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("aidaAlternateDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    aidaAlternateDSID = v5->_aidaAlternateDSID;
    v5->_aidaAlternateDSID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("aidaToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    aidaToken = v5->_aidaToken;
    v5->_aidaToken = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("aaDSID"));
    v10 = objc_claimAutoreleasedReturnValue();
    aaDSID = v5->_aaDSID;
    v5->_aaDSID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("aaAlternateDSID"));
    v12 = objc_claimAutoreleasedReturnValue();
    aaAlternateDSID = v5->_aaAlternateDSID;
    v5->_aaAlternateDSID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleID"));
    v14 = objc_claimAutoreleasedReturnValue();
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v14;

    v5->_isSandboxAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSandboxAccount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstName"));
    v16 = objc_claimAutoreleasedReturnValue();
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastName"));
    v18 = objc_claimAutoreleasedReturnValue();
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("email"));
    v20 = objc_claimAutoreleasedReturnValue();
    primaryEmailAddress = v5->_primaryEmailAddress;
    v5->_primaryEmailAddress = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v22 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v22;

    v5->_isManagedAppleAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isManagedAppleAccount"));
    v5->_isWalletEnabledOnManagedAppleAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isWalletEnabledOnManagedAppleAccount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ageCategory"));
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(CFSTR("under13"), "isEqualToString:", v24) & 1) != 0)
    {
      v25 = 1;
    }
    else if ((objc_msgSend(CFSTR("under18"), "isEqualToString:", v24) & 1) != 0)
    {
      v25 = 2;
    }
    else if ((objc_msgSend(CFSTR("adult"), "isEqualToString:", v24) & 1) != 0)
    {
      v25 = 3;
    }
    else if (objc_msgSend(CFSTR("managedAppleAccount"), "isEqualToString:", v24))
    {
      v25 = 4;
    }
    else
    {
      v25 = 0;
    }

    v5->_ageCategory = v25;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *aidaAlternateDSID;
  unint64_t v5;
  __CFString *v6;
  id v7;

  aidaAlternateDSID = self->_aidaAlternateDSID;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", aidaAlternateDSID, CFSTR("aidaAlternateDSID"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_aidaToken, CFSTR("aidaToken"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_aaDSID, CFSTR("aaDSID"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_aaAlternateDSID, CFSTR("aaAlternateDSID"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_appleID, CFSTR("appleID"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_isSandboxAccount, CFSTR("isSandboxAccount"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_firstName, CFSTR("firstName"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_lastName, CFSTR("lastName"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_primaryEmailAddress, CFSTR("email"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_isManagedAppleAccount, CFSTR("isManagedAppleAccount"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_isWalletEnabledOnManagedAppleAccount, CFSTR("isWalletEnabledOnManagedAppleAccount"));
  v5 = self->_ageCategory - 1;
  if (v5 > 3)
    v6 = 0;
  else
    v6 = off_1E2ACB4B8[v5];
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("ageCategory"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKAppleAccountInformation *v4;

  v4 = -[PKAppleAccountInformation init](+[PKAppleAccountInformation allocWithZone:](PKAppleAccountInformation, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_aidaAlternateDSID, self->_aidaAlternateDSID);
  objc_storeStrong((id *)&v4->_aidaToken, self->_aidaToken);
  objc_storeStrong((id *)&v4->_aaDSID, self->_aaDSID);
  objc_storeStrong((id *)&v4->_aaAlternateDSID, self->_aaAlternateDSID);
  objc_storeStrong((id *)&v4->_appleID, self->_appleID);
  v4->_isSandboxAccount = self->_isSandboxAccount;
  objc_storeStrong((id *)&v4->_lastName, self->_lastName);
  objc_storeStrong((id *)&v4->_firstName, self->_firstName);
  objc_storeStrong((id *)&v4->_primaryEmailAddress, self->_primaryEmailAddress);
  objc_storeStrong((id *)&v4->_creationDate, self->_creationDate);
  v4->_isManagedAppleAccount = self->_isManagedAppleAccount;
  v4->_isWalletEnabledOnManagedAppleAccount = self->_isWalletEnabledOnManagedAppleAccount;
  v4->_ageCategory = self->_ageCategory;
  return v4;
}

- (NSString)authorizationHeader
{
  NSString *authorizationHeader;
  NSString *v4;
  NSString *v5;

  authorizationHeader = self->_authorizationHeader;
  if (!authorizationHeader)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AppleToken %@:%@"), self->_aidaAlternateDSID, self->_aidaToken);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_authorizationHeader;
    self->_authorizationHeader = v4;

    authorizationHeader = self->_authorizationHeader;
  }
  return authorizationHeader;
}

- (id)primaryAppleAccountHash
{
  return _PKAccountHash(self->_appleID);
}

- (id)altDsidAppleAccountHash
{
  return _PKAccountHash(self->_aaAlternateDSID);
}

- (BOOL)aidaAccountAvailable
{
  NSString *aidaAlternateDSID;

  aidaAlternateDSID = self->_aidaAlternateDSID;
  if (aidaAlternateDSID)
  {
    if (self->_aidaToken)
    {
      aidaAlternateDSID = -[NSString length](aidaAlternateDSID, "length");
      if (aidaAlternateDSID)
        LOBYTE(aidaAlternateDSID) = -[NSString length](self->_aidaToken, "length") != 0;
    }
    else
    {
      LOBYTE(aidaAlternateDSID) = 0;
    }
  }
  return (char)aidaAlternateDSID;
}

- (BOOL)aidaAccountRequiresAuthentication
{
  NSString *aidaAlternateDSID;
  BOOL v4;
  NSString *aidaToken;
  BOOL v6;

  aidaAlternateDSID = self->_aidaAlternateDSID;
  if (aidaAlternateDSID)
    v4 = -[NSString length](aidaAlternateDSID, "length") != 0;
  else
    v4 = 0;
  aidaToken = self->_aidaToken;
  if (aidaToken)
    v6 = -[NSString length](aidaToken, "length") == 0;
  else
    v6 = 1;
  return v4 && v6;
}

- (NSString)aidaAlternateDSID
{
  return self->_aidaAlternateDSID;
}

- (NSString)aidaToken
{
  return self->_aidaToken;
}

- (NSString)aaDSID
{
  return self->_aaDSID;
}

- (NSString)aaAlternateDSID
{
  return self->_aaAlternateDSID;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)primaryEmailAddress
{
  return self->_primaryEmailAddress;
}

- (void)setAuthorizationHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)ageCategory
{
  return self->_ageCategory;
}

- (void)setAgeCategory:(int64_t)a3
{
  self->_ageCategory = a3;
}

- (BOOL)isWalletEnabledOnManagedAppleAccount
{
  return self->_isWalletEnabledOnManagedAppleAccount;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

@end
