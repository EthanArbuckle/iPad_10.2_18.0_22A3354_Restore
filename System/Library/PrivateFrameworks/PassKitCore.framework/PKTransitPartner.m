@implementation PKTransitPartner

- (PKTransitPartner)initWithIdentifier:(id)a3 localizedDisplayName:(id)a4
{
  id v7;
  id v8;
  PKTransitPartner *v9;
  PKTransitPartner *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKTransitPartner;
  v9 = -[PKTransitPartner init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_localizedDisplayName, a4);
    v10->_maxNotificationCount = 3;
  }

  return v10;
}

- (PKTransitPartner)initWithIdentifier:(id)a3 localizedDisplayName:(id)a4 purchaseURL:(id)a5 supportedTransitNetworkIdentifiers:(id)a6
{
  id v11;
  id v12;
  PKTransitPartner *v13;
  PKTransitPartner *v14;

  v11 = a5;
  v12 = a6;
  v13 = -[PKTransitPartner initWithIdentifier:localizedDisplayName:](self, "initWithIdentifier:localizedDisplayName:", a3, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_purchaseURL, a5);
    objc_storeStrong((id *)&v14->_supportedTransitNetworkIdentifiers, a6);
    v14->_maxNotificationCount = 3;
  }

  return v14;
}

- (PKTransitPartner)initWithCoder:(id)a3
{
  id v4;
  PKTransitPartner *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *localizedDisplayName;
  uint64_t v10;
  NSURL *purchaseURL;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSSet *supportedTransitNetworkIdentifiers;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKTransitPartner;
  v5 = -[PKTransitPartner init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDisplayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchaseURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    purchaseURL = v5->_purchaseURL;
    v5->_purchaseURL = (NSURL *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("supportedTransitNetworkIdentifiers"));
    v15 = objc_claimAutoreleasedReturnValue();
    supportedTransitNetworkIdentifiers = v5->_supportedTransitNetworkIdentifiers;
    v5->_supportedTransitNetworkIdentifiers = (NSSet *)v15;

    v5->_maxNotificationCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxNotificationCount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedDisplayName, CFSTR("localizedDisplayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_purchaseURL, CFSTR("purchaseURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedTransitNetworkIdentifiers, CFSTR("supportedTransitNetworkIdentifiers"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maxNotificationCount, CFSTR("maxNotificationCount"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PKTransitPartner identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransitPartner localizedDisplayName](self, "localizedDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransitPartner purchaseURL](self, "purchaseURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransitPartner supportedTransitNetworkIdentifiers](self, "supportedTransitNetworkIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> identifier: %@, localizedDisplayName: %@, purchaseURL: %@, supportedTransitNetworkIdentifiers: %@"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSURL)purchaseURL
{
  return self->_purchaseURL;
}

- (NSSet)supportedTransitNetworkIdentifiers
{
  return self->_supportedTransitNetworkIdentifiers;
}

- (int64_t)maxNotificationCount
{
  return self->_maxNotificationCount;
}

- (void)setMaxNotificationCount:(int64_t)a3
{
  self->_maxNotificationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTransitNetworkIdentifiers, 0);
  objc_storeStrong((id *)&self->_purchaseURL, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
