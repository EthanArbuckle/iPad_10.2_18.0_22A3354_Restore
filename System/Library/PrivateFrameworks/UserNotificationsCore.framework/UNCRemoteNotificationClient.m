@implementation UNCRemoteNotificationClient

+ (void)initialize
{
  objc_msgSend(MEMORY[0x24BDD1620], "setClass:forClassName:", objc_opt_class(), CFSTR("UNRemoteNotificationClient"));
  objc_msgSend(MEMORY[0x24BDD1620], "setClass:forClassName:", objc_opt_class(), CFSTR("SBRemoteNotificationClient"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UNCRemoteNotificationClient)initWithCoder:(id)a3
{
  id v4;
  UNCRemoteNotificationClient *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UNCRemoteNotificationClient;
  v5 = -[UNCRemoteNotificationClient init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SBEnvironment"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCRemoteNotificationClient setEnvironment:](v5, "setEnvironment:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SBLastKnownDeviceToken"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCRemoteNotificationClient setLastKnownDeviceToken:](v5, "setLastKnownDeviceToken:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SBTokenId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCRemoteNotificationClient setTokenIdentifier:](v5, "setTokenIdentifier:", v8);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[UNCRemoteNotificationClient environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SBEnvironment"));

  -[UNCRemoteNotificationClient lastKnownDeviceToken](self, "lastKnownDeviceToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SBLastKnownDeviceToken"));

  -[UNCRemoteNotificationClient tokenIdentifier](self, "tokenIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("SBTokenId"));

}

- (NSString)tokenIdentifier
{
  return self->_tokenIdentifier;
}

- (void)setTokenIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)lastKnownDeviceToken
{
  return self->_lastKnownDeviceToken;
}

- (void)setLastKnownDeviceToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownDeviceToken, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_tokenIdentifier, 0);
}

@end
