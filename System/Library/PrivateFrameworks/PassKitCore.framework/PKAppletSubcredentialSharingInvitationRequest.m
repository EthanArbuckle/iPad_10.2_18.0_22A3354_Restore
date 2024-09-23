@implementation PKAppletSubcredentialSharingInvitationRequest

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; credential: %@; shared credential: %@; sharing session: %@; device type: %ld >"),
               objc_opt_class(),
               self,
               self->_credentialIdentifier,
               self->_sharedCredentialIdentifier,
               self->_sharingSessionIdentifier,
               self->_deviceType);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *credentialIdentifier;
  id v5;

  credentialIdentifier = self->_credentialIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", credentialIdentifier, CFSTR("credentialIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedCredentialIdentifier, CFSTR("sharedCredentialIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharingSessionIdentifier, CFSTR("sharingSessionIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_deviceType, CFSTR("deviceType"));

}

- (PKAppletSubcredentialSharingInvitationRequest)initWithCoder:(id)a3
{
  id v4;
  PKAppletSubcredentialSharingInvitationRequest *v5;
  uint64_t v6;
  NSString *credentialIdentifier;
  uint64_t v8;
  NSString *sharedCredentialIdentifier;
  uint64_t v10;
  NSUUID *sharingSessionIdentifier;

  v4 = a3;
  v5 = -[PKAppletSubcredentialSharingInvitationRequest init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedCredentialIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    sharedCredentialIdentifier = v5->_sharedCredentialIdentifier;
    v5->_sharedCredentialIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharingSessionIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    sharingSessionIdentifier = v5->_sharingSessionIdentifier;
    v5->_sharingSessionIdentifier = (NSUUID *)v10;

    v5->_deviceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("deviceType"));
  }

  return v5;
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)sharedCredentialIdentifier
{
  return self->_sharedCredentialIdentifier;
}

- (void)setSharedCredentialIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)sharingSessionIdentifier
{
  return self->_sharingSessionIdentifier;
}

- (void)setSharingSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sharingSessionIdentifier, a3);
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedCredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
}

@end
