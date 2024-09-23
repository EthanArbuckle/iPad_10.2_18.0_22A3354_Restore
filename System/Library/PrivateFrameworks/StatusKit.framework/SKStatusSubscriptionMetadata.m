@implementation SKStatusSubscriptionMetadata

- (SKStatusSubscriptionMetadata)initWithSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 isPersonalStatusSubscription:(BOOL)a5 currentStatus:(id)a6 ownerHandles:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  SKStatusSubscriptionMetadata *v16;
  uint64_t v17;
  NSString *subscriptionIdentifier;
  uint64_t v19;
  NSString *statusTypeIdentifier;
  uint64_t v21;
  NSArray *ownerHandles;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SKStatusSubscriptionMetadata;
  v16 = -[SKStatusSubscriptionMetadata init](&v24, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    subscriptionIdentifier = v16->_subscriptionIdentifier;
    v16->_subscriptionIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    statusTypeIdentifier = v16->_statusTypeIdentifier;
    v16->_statusTypeIdentifier = (NSString *)v19;

    v16->_personalStatusSubscription = a5;
    objc_storeStrong((id *)&v16->_currentStatus, a6);
    v21 = objc_msgSend(v15, "copy");
    ownerHandles = v16->_ownerHandles;
    v16->_ownerHandles = (NSArray *)v21;

  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *subscriptionIdentifier;
  id v5;

  subscriptionIdentifier = self->_subscriptionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", subscriptionIdentifier, CFSTR("subscriptionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_statusTypeIdentifier, CFSTR("statusTypeIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_personalStatusSubscription, CFSTR("isPersonalStatusSubscription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentStatus, CFSTR("currentStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerHandles, CFSTR("ownerHandles"));

}

- (SKStatusSubscriptionMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SKStatusSubscriptionMetadata *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subscriptionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statusTypeIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPersonalStatusSubscription"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("ownerHandles"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SKStatusSubscriptionMetadata initWithSubscriptionIdentifier:statusTypeIdentifier:isPersonalStatusSubscription:currentStatus:ownerHandles:](self, "initWithSubscriptionIdentifier:statusTypeIdentifier:isPersonalStatusSubscription:currentStatus:ownerHandles:", v5, v6, v7, v8, v12);
  return v13;
}

- (id)description
{
  _BOOL4 personalStatusSubscription;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  personalStatusSubscription = self->_personalStatusSubscription;
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  -[SKStatusSubscriptionMetadata subscriptionIdentifier](self, "subscriptionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (personalStatusSubscription)
  {
    -[SKStatusSubscriptionMetadata currentStatus](self, "currentStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; subscriptionID = \"%@\"; personal = YES; status = \"%@\">"),
      v5,
      self,
      v6,
      v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SKStatusSubscriptionMetadata ownerHandles](self, "ownerHandles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKStatusSubscriptionMetadata currentStatus](self, "currentStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; subscriptionID = \"%@\"; owners = \"%@\"; status = \"%@\">"),
      v5,
      self,
      v6,
      v7,
      v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (NSString)subscriptionIdentifier
{
  return self->_subscriptionIdentifier;
}

- (NSString)statusTypeIdentifier
{
  return self->_statusTypeIdentifier;
}

- (BOOL)isPersonalStatusSubscription
{
  return self->_personalStatusSubscription;
}

- (SKPublishedStatus)currentStatus
{
  return self->_currentStatus;
}

- (NSArray)ownerHandles
{
  return self->_ownerHandles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerHandles, 0);
  objc_storeStrong((id *)&self->_currentStatus, 0);
  objc_storeStrong((id *)&self->_statusTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_subscriptionIdentifier, 0);
}

@end
