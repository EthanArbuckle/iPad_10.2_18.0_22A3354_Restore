@implementation PKFeatureApplicationInvitationDetails

- (PKFeatureApplicationInvitationDetails)initWithDictionary:(id)a3
{
  id v4;
  PKFeatureApplicationInvitationDetails *v5;
  uint64_t v6;
  NSString *accountUserAltDSID;
  uint64_t v8;
  NSString *originatorAltDSID;
  void *v10;
  uint64_t v11;
  NSString *originatorFirstName;
  uint64_t v13;
  NSString *originatorLastName;
  uint64_t v15;
  NSString *accountUserFirstName;
  uint64_t v17;
  NSString *accountUserLastName;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKFeatureApplicationInvitationDetails;
  v5 = -[PKFeatureApplicationInvitationDetails init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("accountUserAltDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountUserAltDSID = v5->_accountUserAltDSID;
    v5->_accountUserAltDSID = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("originatorAltDSID"));
    v8 = objc_claimAutoreleasedReturnValue();
    originatorAltDSID = v5->_originatorAltDSID;
    v5->_originatorAltDSID = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("accountUserAccessLevel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_accountUserAccessLevel = PKAccountAccessLevelFromString(v10);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("originatorFirstName"));
    v11 = objc_claimAutoreleasedReturnValue();
    originatorFirstName = v5->_originatorFirstName;
    v5->_originatorFirstName = (NSString *)v11;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("originatorLastName"));
    v13 = objc_claimAutoreleasedReturnValue();
    originatorLastName = v5->_originatorLastName;
    v5->_originatorLastName = (NSString *)v13;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("accountUserFirstName"));
    v15 = objc_claimAutoreleasedReturnValue();
    accountUserFirstName = v5->_accountUserFirstName;
    v5->_accountUserFirstName = (NSString *)v15;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("accountUserLastName"));
    v17 = objc_claimAutoreleasedReturnValue();
    accountUserLastName = v5->_accountUserLastName;
    v5->_accountUserLastName = (NSString *)v17;

  }
  return v5;
}

- (PKFeatureApplicationInvitationDetails)initWithAccountUserAltDSID:(id)a3 accessLevel:(unint64_t)a4
{
  id v6;
  PKFeatureApplicationInvitationDetails *v7;
  uint64_t v8;
  NSString *accountUserAltDSID;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKFeatureApplicationInvitationDetails;
  v7 = -[PKFeatureApplicationInvitationDetails init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    accountUserAltDSID = v7->_accountUserAltDSID;
    v7->_accountUserAltDSID = (NSString *)v8;

    v7->_accountUserAccessLevel = a4;
  }

  return v7;
}

- (id)jsonRepresentation
{
  id v3;
  unint64_t accountUserAccessLevel;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_accountUserAltDSID, CFSTR("accountUserAltDSID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_originatorAltDSID, CFSTR("originatorAltDSID"));
  accountUserAccessLevel = self->_accountUserAccessLevel;
  if (accountUserAccessLevel)
  {
    PKAccountAccessLevelToString(accountUserAccessLevel);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accountUserAccessLevel"));

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_originatorFirstName, CFSTR("originatorFirstName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_originatorLastName, CFSTR("originatorLastName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_accountUserFirstName, CFSTR("accountUserFirstName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_accountUserLastName, CFSTR("accountUserLastName"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (NSPersonNameComponents)originatorNameComponents
{
  id v3;

  if (self->_accountUserFirstName && self->_accountUserLastName)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    objc_msgSend(v3, "setGivenName:", self->_originatorFirstName);
    objc_msgSend(v3, "setFamilyName:", self->_originatorLastName);
  }
  else
  {
    v3 = 0;
  }
  return (NSPersonNameComponents *)v3;
}

- (NSPersonNameComponents)accountUserNameComponents
{
  id v3;

  if (self->_accountUserFirstName && self->_accountUserLastName)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    objc_msgSend(v3, "setGivenName:", self->_accountUserFirstName);
    objc_msgSend(v3, "setFamilyName:", self->_accountUserLastName);
  }
  else
  {
    v3 = 0;
  }
  return (NSPersonNameComponents *)v3;
}

- (BOOL)isEqual:(id)a3
{
  PKFeatureApplicationInvitationDetails *v4;
  PKFeatureApplicationInvitationDetails *v5;
  PKFeatureApplicationInvitationDetails *v6;
  NSString *accountUserAltDSID;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  NSString *originatorAltDSID;
  NSString *v13;
  NSString *originatorFirstName;
  NSString *v15;
  NSString *originatorLastName;
  NSString *v17;
  NSString *accountUserFirstName;
  NSString *v19;
  NSString *accountUserLastName;
  NSString *v21;
  NSString *v22;

  v4 = (PKFeatureApplicationInvitationDetails *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        accountUserAltDSID = v6->_accountUserAltDSID;
        v8 = self->_accountUserAltDSID;
        v9 = accountUserAltDSID;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          LOBYTE(v11) = 0;
          if (!v8 || !v9)
            goto LABEL_43;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_44;
        }
        originatorAltDSID = v6->_originatorAltDSID;
        v8 = self->_originatorAltDSID;
        v13 = originatorAltDSID;
        if (v8 == v13)
        {

        }
        else
        {
          v10 = v13;
          LOBYTE(v11) = 0;
          if (!v8 || !v13)
            goto LABEL_43;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v13);

          if (!v11)
            goto LABEL_44;
        }
        if (self->_accountUserAccessLevel != v6->_accountUserAccessLevel)
        {
          LOBYTE(v11) = 0;
LABEL_44:

          goto LABEL_45;
        }
        originatorFirstName = v6->_originatorFirstName;
        v8 = self->_originatorFirstName;
        v15 = originatorFirstName;
        if (v8 == v15)
        {

        }
        else
        {
          v10 = v15;
          LOBYTE(v11) = 0;
          if (!v8 || !v15)
            goto LABEL_43;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v15);

          if (!v11)
            goto LABEL_44;
        }
        originatorLastName = v6->_originatorLastName;
        v8 = self->_originatorLastName;
        v17 = originatorLastName;
        if (v8 == v17)
        {

        }
        else
        {
          v10 = v17;
          LOBYTE(v11) = 0;
          if (!v8 || !v17)
            goto LABEL_43;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v17);

          if (!v11)
            goto LABEL_44;
        }
        accountUserFirstName = v6->_accountUserFirstName;
        v8 = self->_accountUserFirstName;
        v19 = accountUserFirstName;
        if (v8 == v19)
        {

LABEL_38:
          accountUserLastName = self->_accountUserLastName;
          v21 = v6->_accountUserLastName;
          v8 = accountUserLastName;
          v22 = v21;
          if (v8 == v22)
          {
            LOBYTE(v11) = 1;
            v10 = v8;
          }
          else
          {
            v10 = v22;
            LOBYTE(v11) = 0;
            if (v8 && v22)
              LOBYTE(v11) = -[NSString isEqualToString:](v8, "isEqualToString:", v22);
          }
          goto LABEL_43;
        }
        v10 = v19;
        LOBYTE(v11) = 0;
        if (v8 && v19)
        {
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v19);

          if (!v11)
            goto LABEL_44;
          goto LABEL_38;
        }
LABEL_43:

        goto LABEL_44;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_45:

  return v11;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_accountUserAltDSID);
  objc_msgSend(v3, "safelyAddObject:", self->_originatorAltDSID);
  objc_msgSend(v3, "safelyAddObject:", self->_originatorFirstName);
  objc_msgSend(v3, "safelyAddObject:", self->_originatorLastName);
  objc_msgSend(v3, "safelyAddObject:", self->_accountUserFirstName);
  objc_msgSend(v3, "safelyAddObject:", self->_accountUserLastName);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_accountUserAccessLevel - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountUserAltDSID: '%@'; "), self->_accountUserAltDSID);
  objc_msgSend(v3, "appendFormat:", CFSTR("originatorAltDSID: '%@'; "), self->_originatorAltDSID);
  PKAccountAccessLevelToString(self->_accountUserAccessLevel);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("accountUserAccessLevel: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("originatorFirstName: '%@'; "), self->_originatorFirstName);
  objc_msgSend(v3, "appendFormat:", CFSTR("originatorLastName: '%@'; "), self->_originatorLastName);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountUserFirstName: '%@'; "), self->_accountUserFirstName);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountUserLastName: '%@'; "), self->_accountUserLastName);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFeatureApplicationInvitationDetails)initWithCoder:(id)a3
{
  id v4;
  PKFeatureApplicationInvitationDetails *v5;
  uint64_t v6;
  NSString *accountUserAltDSID;
  uint64_t v8;
  NSString *originatorAltDSID;
  uint64_t v10;
  NSString *originatorFirstName;
  uint64_t v12;
  NSString *originatorLastName;
  uint64_t v14;
  NSString *accountUserFirstName;
  uint64_t v16;
  NSString *accountUserLastName;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKFeatureApplicationInvitationDetails;
  v5 = -[PKFeatureApplicationInvitationDetails init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountUserAltDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountUserAltDSID = v5->_accountUserAltDSID;
    v5->_accountUserAltDSID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatorAltDSID"));
    v8 = objc_claimAutoreleasedReturnValue();
    originatorAltDSID = v5->_originatorAltDSID;
    v5->_originatorAltDSID = (NSString *)v8;

    v5->_accountUserAccessLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("accountUserAccessLevel"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatorFirstName"));
    v10 = objc_claimAutoreleasedReturnValue();
    originatorFirstName = v5->_originatorFirstName;
    v5->_originatorFirstName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatorLastName"));
    v12 = objc_claimAutoreleasedReturnValue();
    originatorLastName = v5->_originatorLastName;
    v5->_originatorLastName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountUserFirstName"));
    v14 = objc_claimAutoreleasedReturnValue();
    accountUserFirstName = v5->_accountUserFirstName;
    v5->_accountUserFirstName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountUserLastName"));
    v16 = objc_claimAutoreleasedReturnValue();
    accountUserLastName = v5->_accountUserLastName;
    v5->_accountUserLastName = (NSString *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *accountUserAltDSID;
  id v5;

  accountUserAltDSID = self->_accountUserAltDSID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accountUserAltDSID, CFSTR("accountUserAltDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originatorAltDSID, CFSTR("originatorAltDSID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_accountUserAccessLevel, CFSTR("accountUserAccessLevel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originatorFirstName, CFSTR("originatorFirstName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originatorLastName, CFSTR("originatorLastName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountUserFirstName, CFSTR("accountUserFirstName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountUserLastName, CFSTR("accountUserLastName"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKFeatureApplicationInvitationDetails *v5;
  uint64_t v6;
  NSString *accountUserAltDSID;
  uint64_t v8;
  NSString *originatorAltDSID;
  uint64_t v10;
  NSString *originatorFirstName;
  uint64_t v12;
  NSString *originatorLastName;
  uint64_t v14;
  NSString *accountUserFirstName;
  uint64_t v16;
  NSString *accountUserLastName;

  v5 = -[PKFeatureApplicationInvitationDetails init](+[PKFeatureApplicationInvitationDetails allocWithZone:](PKFeatureApplicationInvitationDetails, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_accountUserAltDSID, "copyWithZone:", a3);
  accountUserAltDSID = v5->_accountUserAltDSID;
  v5->_accountUserAltDSID = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_originatorAltDSID, "copyWithZone:", a3);
  originatorAltDSID = v5->_originatorAltDSID;
  v5->_originatorAltDSID = (NSString *)v8;

  v5->_accountUserAccessLevel = self->_accountUserAccessLevel;
  v10 = -[NSString copyWithZone:](self->_originatorFirstName, "copyWithZone:", a3);
  originatorFirstName = v5->_originatorFirstName;
  v5->_originatorFirstName = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_originatorLastName, "copyWithZone:", a3);
  originatorLastName = v5->_originatorLastName;
  v5->_originatorLastName = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_accountUserFirstName, "copyWithZone:", a3);
  accountUserFirstName = v5->_accountUserFirstName;
  v5->_accountUserFirstName = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_accountUserLastName, "copyWithZone:", a3);
  accountUserLastName = v5->_accountUserLastName;
  v5->_accountUserLastName = (NSString *)v16;

  return v5;
}

- (NSString)accountUserAltDSID
{
  return self->_accountUserAltDSID;
}

- (void)setAccountUserAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)originatorAltDSID
{
  return self->_originatorAltDSID;
}

- (void)setOriginatorAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)accountUserAccessLevel
{
  return self->_accountUserAccessLevel;
}

- (void)setAccountUserAccessLevel:(unint64_t)a3
{
  self->_accountUserAccessLevel = a3;
}

- (NSString)originatorFirstName
{
  return self->_originatorFirstName;
}

- (void)setOriginatorFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)originatorLastName
{
  return self->_originatorLastName;
}

- (void)setOriginatorLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)accountUserFirstName
{
  return self->_accountUserFirstName;
}

- (void)setAccountUserFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)accountUserLastName
{
  return self->_accountUserLastName;
}

- (void)setAccountUserLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountUserLastName, 0);
  objc_storeStrong((id *)&self->_accountUserFirstName, 0);
  objc_storeStrong((id *)&self->_originatorLastName, 0);
  objc_storeStrong((id *)&self->_originatorFirstName, 0);
  objc_storeStrong((id *)&self->_originatorAltDSID, 0);
  objc_storeStrong((id *)&self->_accountUserAltDSID, 0);
}

@end
