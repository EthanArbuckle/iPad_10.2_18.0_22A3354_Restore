@implementation PKPaymentSetupProductConfiguration

- (PKPaymentSetupProductConfiguration)initWithProductDictionary:(id)a3
{
  id v4;
  PKPaymentSetupProductConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *productIdentifier;
  void *v11;
  uint64_t v12;
  NSString *partnerIdentifier;
  uint64_t v14;
  NSString *notificationTitle;
  uint64_t v16;
  NSString *notificationMessage;
  uint64_t v18;
  NSString *discoveryCardIdentifier;
  void *v20;
  void *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentSetupProductConfiguration;
  v5 = -[PKPaymentSetupProductConfiguration init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKPaymentSetupProductTypeFromString(v6);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("state"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = PKPaymentSetupProductStateFromString(v7);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("productIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    productIdentifier = v5->_productIdentifier;
    v5->_productIdentifier = (NSString *)v9;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    partnerIdentifier = v5->_partnerIdentifier;
    v5->_partnerIdentifier = (NSString *)v12;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedNotificationTitle"));
    v14 = objc_claimAutoreleasedReturnValue();
    notificationTitle = v5->_notificationTitle;
    v5->_notificationTitle = (NSString *)v14;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedNotificationMessage"));
    v16 = objc_claimAutoreleasedReturnValue();
    notificationMessage = v5->_notificationMessage;
    v5->_notificationMessage = (NSString *)v16;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("discoveryCardIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    discoveryCardIdentifier = v5->_discoveryCardIdentifier;
    v5->_discoveryCardIdentifier = (NSString *)v18;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("featureIdentifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
      v5->_featureIdentifier = PKFeatureIdentifierFromString(v20);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentSetupProductConfiguration *v5;
  uint64_t v6;
  NSString *productIdentifier;
  uint64_t v8;
  NSString *partnerIdentifier;
  uint64_t v10;
  NSString *dirtyStateIdentifier;
  uint64_t v12;
  NSDate *lastUpdated;
  uint64_t v14;
  NSString *notificationTitle;
  uint64_t v16;
  NSString *notificationMessage;
  uint64_t v18;
  NSString *discoveryCardIdentifier;

  v5 = -[PKPaymentSetupProductConfiguration init](+[PKPaymentSetupProductConfiguration allocWithZone:](PKPaymentSetupProductConfiguration, "allocWithZone:"), "init");
  v5->_type = self->_type;
  v5->_state = self->_state;
  v6 = -[NSString copyWithZone:](self->_productIdentifier, "copyWithZone:", a3);
  productIdentifier = v5->_productIdentifier;
  v5->_productIdentifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_partnerIdentifier, "copyWithZone:", a3);
  partnerIdentifier = v5->_partnerIdentifier;
  v5->_partnerIdentifier = (NSString *)v8;

  v5->_featureIdentifier = self->_featureIdentifier;
  v10 = -[NSString copyWithZone:](self->_dirtyStateIdentifier, "copyWithZone:", a3);
  dirtyStateIdentifier = v5->_dirtyStateIdentifier;
  v5->_dirtyStateIdentifier = (NSString *)v10;

  v12 = -[NSDate copyWithZone:](self->_lastUpdated, "copyWithZone:", a3);
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v12;

  v14 = -[NSString copyWithZone:](self->_notificationTitle, "copyWithZone:", a3);
  notificationTitle = v5->_notificationTitle;
  v5->_notificationTitle = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_notificationMessage, "copyWithZone:", a3);
  notificationMessage = v5->_notificationMessage;
  v5->_notificationMessage = (NSString *)v16;

  v18 = -[NSString copyWithZone:](self->_discoveryCardIdentifier, "copyWithZone:", a3);
  discoveryCardIdentifier = v5->_discoveryCardIdentifier;
  v5->_discoveryCardIdentifier = (NSString *)v18;

  return v5;
}

- (unint64_t)featureIdentifier
{
  unint64_t result;
  void *v4;
  void *v5;
  int v6;

  result = self->_featureIdentifier;
  if (!result)
  {
    if (-[NSString hasSuffix:](self->_productIdentifier, "hasSuffix:", CFSTR("3-argon-CCS")))
    {
      result = 2;
    }
    else
    {
      -[NSString lowercaseString](self->_productIdentifier, "lowercaseString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("4-argon-FPS"), "lowercaseString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "hasSuffix:", v5);

      if (v6)
      {
        result = 3;
      }
      else
      {
        if (!-[NSString hasSuffix:](self->_productIdentifier, "hasSuffix:", CFSTR("appleBalance")))
          return self->_featureIdentifier;
        result = 4;
      }
    }
    self->_featureIdentifier = result;
  }
  return result;
}

- (NSString)productIdentifier
{
  NSString *productIdentifier;
  void *v4;
  NSString *v5;
  NSString *v6;

  productIdentifier = self->_productIdentifier;
  if (!productIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_productIdentifier;
    self->_productIdentifier = v5;

    productIdentifier = self->_productIdentifier;
  }
  return productIdentifier;
}

- (NSString)partnerIdentifier
{
  return self->_partnerIdentifier;
}

- (void)setPartnerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setProductIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)dirtyStateIdentifier
{
  return self->_dirtyStateIdentifier;
}

- (void)setDirtyStateIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdated, a3);
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_featureIdentifier = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)notificationTitle
{
  return self->_notificationTitle;
}

- (void)setNotificationTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)notificationMessage
{
  return self->_notificationMessage;
}

- (void)setNotificationMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)discoveryCardIdentifier
{
  return self->_discoveryCardIdentifier;
}

- (void)setDiscoveryCardIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryCardIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationMessage, 0);
  objc_storeStrong((id *)&self->_notificationTitle, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_dirtyStateIdentifier, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerIdentifier, 0);
}

@end
