@implementation TUCTCapabilityInfo

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[TUCTCapabilityInfo provisioningStatus](self, "provisioningStatus");
  -[TUCTCapabilityInfo provisioningURL](self, "provisioningURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCTCapabilityInfo provisioningPostData](self, "provisioningPostData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p provisioningStatus=%d provisioningURL=%@ provisioningPostData=%p canEnable=%d isEnabled=%d>"), v4, self, v5, v6, v7, -[TUCTCapabilityInfo canEnable](self, "canEnable"), -[TUCTCapabilityInfo isEnabled](self, "isEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)isProvisioningURLInvalid
{
  void *v2;
  void *v3;
  char v4;

  -[TUCTCapabilityInfo provisioningURL](self, "provisioningURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("__INVALID_PROVISIONING_URL__"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (void)invalidateProvisioningURL
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("__INVALID_PROVISIONING_URL__"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[TUCTCapabilityInfo setProvisioningURL:](self, "setProvisioningURL:", v3);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUCTCapabilityInfo)initWithCoder:(id)a3
{
  id v4;
  TUCTCapabilityInfo *v5;
  uint64_t v6;
  NSURL *provisioningURL;
  uint64_t v8;
  NSData *provisioningPostData;

  v4 = a3;
  v5 = -[TUCTCapabilityInfo init](self, "init");
  if (v5)
  {
    v5->_provisioningStatus = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("provisioningStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provisioningURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    provisioningURL = v5->_provisioningURL;
    v5->_provisioningURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provisioningPostData"));
    v8 = objc_claimAutoreleasedReturnValue();
    provisioningPostData = v5->_provisioningPostData;
    v5->_provisioningPostData = (NSData *)v8;

    v5->_canEnable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canEnable"));
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled"));
    v5->_roamingEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("roamingEnabled"));
    v5->_canEnableRoaming = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canEnableRoaming"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInt32:forKey:", -[TUCTCapabilityInfo provisioningStatus](self, "provisioningStatus"), CFSTR("provisioningStatus"));
  -[TUCTCapabilityInfo provisioningURL](self, "provisioningURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("provisioningURL"));

  -[TUCTCapabilityInfo provisioningPostData](self, "provisioningPostData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("provisioningPostData"));

  objc_msgSend(v6, "encodeBool:forKey:", -[TUCTCapabilityInfo canEnable](self, "canEnable"), CFSTR("canEnable"));
  objc_msgSend(v6, "encodeBool:forKey:", -[TUCTCapabilityInfo isEnabled](self, "isEnabled"), CFSTR("enabled"));
  objc_msgSend(v6, "encodeBool:forKey:", -[TUCTCapabilityInfo isRoamingEnabled](self, "isRoamingEnabled"), CFSTR("roamingEnabled"));
  objc_msgSend(v6, "encodeBool:forKey:", -[TUCTCapabilityInfo canEnableRoaming](self, "canEnableRoaming"), CFSTR("canEnableRoaming"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[TUCTCapabilityInfo publiclyAccessibleCopyWithZone:](self, "publiclyAccessibleCopyWithZone:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProvisioningStatus:", -[TUCTCapabilityInfo provisioningStatus](self, "provisioningStatus"));
  -[TUCTCapabilityInfo provisioningURL](self, "provisioningURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProvisioningURL:", v5);

  -[TUCTCapabilityInfo provisioningPostData](self, "provisioningPostData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProvisioningPostData:", v6);

  objc_msgSend(v4, "setEnabled:", -[TUCTCapabilityInfo isEnabled](self, "isEnabled"));
  objc_msgSend(v4, "setCanEnable:", -[TUCTCapabilityInfo canEnable](self, "canEnable"));
  return v4;
}

- (id)publiclyAccessibleCopy
{
  return -[TUCTCapabilityInfo publiclyAccessibleCopyWithZone:](self, "publiclyAccessibleCopyWithZone:", 0);
}

- (id)publiclyAccessibleCopyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setCanEnable:", -[TUCTCapabilityInfo canEnable](self, "canEnable"));
  objc_msgSend(v4, "setEnabled:", -[TUCTCapabilityInfo isEnabled](self, "isEnabled"));
  objc_msgSend(v4, "setRoamingEnabled:", -[TUCTCapabilityInfo isRoamingEnabled](self, "isRoamingEnabled"));
  objc_msgSend(v4, "setCanEnableRoaming:", -[TUCTCapabilityInfo canEnableRoaming](self, "canEnableRoaming"));
  return v4;
}

- (int)provisioningStatus
{
  return self->_provisioningStatus;
}

- (void)setProvisioningStatus:(int)a3
{
  self->_provisioningStatus = a3;
}

- (NSURL)provisioningURL
{
  return self->_provisioningURL;
}

- (void)setProvisioningURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)provisioningPostData
{
  return self->_provisioningPostData;
}

- (void)setProvisioningPostData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)canEnable
{
  return self->_canEnable;
}

- (void)setCanEnable:(BOOL)a3
{
  self->_canEnable = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)canEnableRoaming
{
  return self->_canEnableRoaming;
}

- (void)setCanEnableRoaming:(BOOL)a3
{
  self->_canEnableRoaming = a3;
}

- (BOOL)isRoamingEnabled
{
  return self->_roamingEnabled;
}

- (void)setRoamingEnabled:(BOOL)a3
{
  self->_roamingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningPostData, 0);
  objc_storeStrong((id *)&self->_provisioningURL, 0);
}

@end
