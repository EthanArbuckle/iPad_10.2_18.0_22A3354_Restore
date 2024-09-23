@implementation PKAddSecureElementPassConfiguration

- (void)updateAllowManagedAppleIDWithEntitlements:(id)a3
{
  unint64_t v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "secureElementPassProvisioningForMAIDs") & 1) != 0)
  {
    v4 = 1;
    v5 = v7;
LABEL_5:
    self->_allowManagedAppleID = v4;
    goto LABEL_6;
  }
  v6 = objc_msgSend(v7, "passesAllAccess");
  v5 = v7;
  if ((v6 & 1) == 0)
  {
    v4 = 2;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)encodeWithCoder:(id)a3
{
  int64_t configurationType;
  unint64_t allowManagedAppleID;
  const __CFString *v6;
  const __CFString *v7;
  id v8;

  configurationType = self->_configurationType;
  v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", configurationType, CFSTR("configurationType"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_issuerIdentifier, CFSTR("issuerIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_localizedDescription, CFSTR("localizedDescription"));
  allowManagedAppleID = self->_allowManagedAppleID;
  v6 = CFSTR("true");
  if (allowManagedAppleID != 1)
    v6 = 0;
  if (allowManagedAppleID == 2)
    v7 = CFSTR("false");
  else
    v7 = v6;
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("allowManagedAppleID"));

}

- (int64_t)configurationType
{
  return self->_configurationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsArchivedParentToken, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);
}

- (PKAddSecureElementPassConfiguration)initWithType:(int64_t)a3
{
  PKAddSecureElementPassConfiguration *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAddSecureElementPassConfiguration;
  result = -[PKAddSecureElementPassConfiguration init](&v5, sel_init);
  if (result)
    result->_configurationType = a3;
  return result;
}

- (PKAddSecureElementPassConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKAddSecureElementPassConfiguration *v5;
  uint64_t v6;
  NSString *issuerIdentifier;
  uint64_t v8;
  NSString *localizedDescription;
  void *v10;
  uint64_t v11;
  int v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKAddSecureElementPassConfiguration;
  v5 = -[PKAddSecureElementPassConfiguration init](&v14, sel_init);
  if (v5)
  {
    v5->_configurationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("configurationType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("issuerIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    issuerIdentifier = v5->_issuerIdentifier;
    v5->_issuerIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDescription"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowManagedAppleID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("true")) & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      v12 = objc_msgSend(v10, "isEqualToString:", CFSTR("false"));
      v11 = 2;
      if (!v12)
        v11 = 0;
    }
    v5->_allowManagedAppleID = v11;

  }
  return v5;
}

- (BOOL)hasRequiredDataForProvisioning
{
  return 1;
}

- (void)updateAllowManagedAppleIDWithConfiguration:(id)a3
{
  self->_allowManagedAppleID = objc_msgSend(a3, "allowManagedAppleID");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddSecureElementPassConfiguration _extendableDescription:](self, "_extendableDescription:", v3);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (void)_extendableDescription:(id)a3
{
  int64_t configurationType;
  unint64_t allowManagedAppleID;
  const __CFString *v6;
  const __CFString *v7;
  id v8;

  configurationType = self->_configurationType;
  v8 = a3;
  objc_msgSend(v8, "appendFormat:", CFSTR("configurationType: '%lu'; "), configurationType);
  objc_msgSend(v8, "appendFormat:", CFSTR("issuerIdentifier: '%@'; "), self->_issuerIdentifier);
  objc_msgSend(v8, "appendFormat:", CFSTR("localizedDescription: '%@'; "), self->_localizedDescription);
  allowManagedAppleID = self->_allowManagedAppleID;
  v6 = CFSTR("true");
  if (allowManagedAppleID != 1)
    v6 = 0;
  if (allowManagedAppleID == 2)
    v7 = CFSTR("false");
  else
    v7 = v6;
  objc_msgSend(v8, "appendFormat:", CFSTR("allowManagedAppleID: '%@'; "), v7);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[3] = self->_configurationType;
  v6 = -[NSString copyWithZone:](self->_issuerIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_localizedDescription, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v5[4] = self->_allowManagedAppleID;
  return v5;
}

- (NSString)issuerIdentifier
{
  return self->_issuerIdentifier;
}

- (void)setIssuerIdentifier:(NSString *)issuerIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, issuerIdentifier, 8);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
  objc_setProperty_nonatomic_copy(self, a2, localizedDescription, 16);
}

- (unint64_t)allowManagedAppleID
{
  return self->_allowManagedAppleID;
}

- (NSData)analyticsArchivedParentToken
{
  return self->_analyticsArchivedParentToken;
}

- (void)setAnalyticsArchivedParentToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
