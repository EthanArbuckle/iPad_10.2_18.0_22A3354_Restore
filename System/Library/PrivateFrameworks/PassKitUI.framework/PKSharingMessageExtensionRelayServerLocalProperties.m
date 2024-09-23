@implementation PKSharingMessageExtensionRelayServerLocalProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingMessageExtensionRelayServerLocalProperties)initWithCoder:(id)a3
{
  id v4;
  PKSharingMessageExtensionRelayServerLocalProperties *v5;
  uint64_t v6;
  PKPartialShareInvitation *partialInvite;
  void *v8;
  uint64_t v9;
  NSString *passUniqueIdentifier;
  uint64_t v11;
  NSData *analyticsSessionToken;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKSharingMessageExtensionRelayServerLocalProperties;
  v5 = -[PKSharingMessageExtensionRelayServerLocalProperties init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partialInvite"));
    v6 = objc_claimAutoreleasedReturnValue();
    partialInvite = v5->_partialInvite;
    v5->_partialInvite = (PKPartialShareInvitation *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasCheckedStatus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasCheckedStatus = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passUniqueIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("analyticsSessionToken"));
    v11 = objc_claimAutoreleasedReturnValue();
    analyticsSessionToken = v5->_analyticsSessionToken;
    v5->_analyticsSessionToken = (NSData *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKPartialShareInvitation *partialInvite;
  void *v5;
  id v6;

  partialInvite = self->_partialInvite;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", partialInvite, CFSTR("partialInvite"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasCheckedStatus);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("hasCheckedStatus"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_passUniqueIdentifier, CFSTR("passUniqueIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_analyticsSessionToken, CFSTR("analyticsSessionToken"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("partialInvite: '%@'; "), self->_partialInvite);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasCheckedStatus);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("hasCheckedStatus: '%@'; "), v7);

  if (self->_analyticsSessionToken)
    v8 = CFSTR("Yes");
  else
    v8 = CFSTR("No");
  objc_msgSend(v6, "appendFormat:", CFSTR("hasAnalyticsSessionToken: '%@'; "), v8);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_partialInvite);
  objc_msgSend(v3, "safelyAddObject:", self->_analyticsSessionToken);
  PKCombinedHash();
  v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKSharingMessageExtensionRelayServerLocalProperties *v4;
  PKSharingMessageExtensionRelayServerLocalProperties *v5;
  BOOL v6;

  v4 = (PKSharingMessageExtensionRelayServerLocalProperties *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKSharingMessageExtensionRelayServerLocalProperties isEqualToSharingMessageExtensionRelayServerLocalProperties:](self, "isEqualToSharingMessageExtensionRelayServerLocalProperties:", v5);

  return v6;
}

- (BOOL)isEqualToSharingMessageExtensionRelayServerLocalProperties:(id)a3
{
  unsigned __int8 *v4;
  char v5;

  v4 = (unsigned __int8 *)a3;
  if (PKEqualObjects() && self->_hasCheckedStatus == v4[8])
    v5 = PKEqualObjects();
  else
    v5 = 0;

  return v5;
}

- (PKPartialShareInvitation)partialInvite
{
  return self->_partialInvite;
}

- (void)setPartialInvite:(id)a3
{
  objc_storeStrong((id *)&self->_partialInvite, a3);
}

- (BOOL)hasCheckedStatus
{
  return self->_hasCheckedStatus;
}

- (void)setHasCheckedStatus:(BOOL)a3
{
  self->_hasCheckedStatus = a3;
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void)setPassUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passUniqueIdentifier, a3);
}

- (NSData)analyticsSessionToken
{
  return self->_analyticsSessionToken;
}

- (void)setAnalyticsSessionToken:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsSessionToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsSessionToken, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_partialInvite, 0);
}

@end
