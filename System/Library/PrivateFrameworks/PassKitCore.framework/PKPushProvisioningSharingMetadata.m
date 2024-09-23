@implementation PKPushProvisioningSharingMetadata

- (BOOL)allowProvisioningOnLockedDevice
{
  return self->_securityOptions & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPushProvisioningSharingMetadata)initWithCoder:(id)a3
{
  id v4;
  PKPushProvisioningSharingMetadata *v5;
  uint64_t v6;
  NSString *sharingInstanceIdentifier;
  uint64_t v8;
  NSString *provisioningCredentialHash;
  uint64_t v10;
  NSString *credentialAuthorityIdentifier;
  uint64_t v12;
  NSDate *createdAt;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPushProvisioningSharingMetadata;
  v5 = -[PKPushProvisioningSharingMetadata init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingInstanceIdentifierKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    sharingInstanceIdentifier = v5->_sharingInstanceIdentifier;
    v5->_sharingInstanceIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialHash"));
    v8 = objc_claimAutoreleasedReturnValue();
    provisioningCredentialHash = v5->_provisioningCredentialHash;
    v5->_provisioningCredentialHash = (NSString *)v8;

    v5->_sharingStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    v5->_source = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialAuthorityIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    credentialAuthorityIdentifier = v5->_credentialAuthorityIdentifier;
    v5->_credentialAuthorityIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("createdAt"));
    v12 = objc_claimAutoreleasedReturnValue();
    createdAt = v5->_createdAt;
    v5->_createdAt = (NSDate *)v12;

    v5->_securityOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("securityOptions"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sharingInstanceIdentifier;
  id v5;

  sharingInstanceIdentifier = self->_sharingInstanceIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sharingInstanceIdentifier, CFSTR("sharingInstanceIdentifierKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_provisioningCredentialHash, CFSTR("credentialHash"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sharingStatus, CFSTR("status"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialAuthorityIdentifier, CFSTR("credentialAuthorityIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_createdAt, CFSTR("createdAt"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_securityOptions, CFSTR("securityOptions"));

}

- (BOOL)isEqual:(id)a3
{
  PKPushProvisioningSharingMetadata *v4;
  PKPushProvisioningSharingMetadata *v5;
  BOOL v6;

  v4 = (PKPushProvisioningSharingMetadata *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPushProvisioningSharingMetadata isEqualToEncryptedProvisioningTarget:](self, "isEqualToEncryptedProvisioningTarget:", v5);

  return v6;
}

- (BOOL)isEqualToEncryptedProvisioningTarget:(id)a3
{
  NSString *sharingInstanceIdentifier;
  NSString *v4;
  BOOL v5;

  if (!a3)
    return 0;
  sharingInstanceIdentifier = self->_sharingInstanceIdentifier;
  v4 = (NSString *)*((_QWORD *)a3 + 1);
  if (sharingInstanceIdentifier)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
    return sharingInstanceIdentifier == v4;
  else
    return -[NSString isEqual:](sharingInstanceIdentifier, "isEqual:");
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_sharingInstanceIdentifier);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("sharingIdentifier: '%@'; "), self->_sharingInstanceIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("provisioningCredentialHash: '%@'; "), self->_provisioningCredentialHash);
  objc_msgSend(v3, "appendFormat:", CFSTR("sharingStatus: '%lu'; "), self->_sharingStatus);
  objc_msgSend(v3, "appendFormat:", CFSTR("source: '%lu'; "), self->_source);
  objc_msgSend(v3, "appendFormat:", CFSTR("credentialAuthority: '%@'; "), self->_credentialAuthorityIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("createdAt: '%@'; "), self->_createdAt);
  objc_msgSend(v3, "appendFormat:", CFSTR("securityOptions: '%lu'; "), self->_securityOptions);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_sharingInstanceIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_provisioningCredentialHash, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v5[3] = self->_sharingStatus;
  v5[4] = self->_source;
  v10 = -[NSString copyWithZone:](self->_credentialAuthorityIdentifier, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v12 = -[NSDate copy](self->_createdAt, "copy");
  v13 = (void *)v5[7];
  v5[7] = v12;

  v5[6] = self->_securityOptions;
  return v5;
}

- (NSString)sharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier;
}

- (void)setSharingInstanceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)provisioningCredentialHash
{
  return self->_provisioningCredentialHash;
}

- (void)setProvisioningCredentialHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)sharingStatus
{
  return self->_sharingStatus;
}

- (void)setSharingStatus:(unint64_t)a3
{
  self->_sharingStatus = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (NSString)credentialAuthorityIdentifier
{
  return self->_credentialAuthorityIdentifier;
}

- (void)setCredentialAuthorityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_credentialAuthorityIdentifier, a3);
}

- (unint64_t)securityOptions
{
  return self->_securityOptions;
}

- (void)setSecurityOptions:(unint64_t)a3
{
  self->_securityOptions = a3;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void)setCreatedAt:(id)a3
{
  objc_storeStrong((id *)&self->_createdAt, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_credentialAuthorityIdentifier, 0);
  objc_storeStrong((id *)&self->_provisioningCredentialHash, 0);
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
}

@end
