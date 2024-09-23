@implementation PKPaymentSetupFeature

+ (id)paymentSetupFeatureWithProtobuf:(id)a3
{
  id v3;
  PKPaymentSetupFeature *v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_alloc_init(PKPaymentSetupFeature);
  -[PKPaymentSetupFeature setState:](v4, "setState:", objc_msgSend(v3, "state"));
  v5 = objc_msgSend(v3, "type");

  -[PKPaymentSetupFeature setType:](v4, "setType:", v5);
  return v4;
}

- (id)protobuf
{
  PKProtobufPaymentSetupFeature *v3;

  v3 = objc_alloc_init(PKProtobufPaymentSetupFeature);
  -[PKProtobufPaymentSetupFeature setState:](v3, "setState:", -[PKPaymentSetupFeature state](self, "state"));
  -[PKProtobufPaymentSetupFeature setType:](v3, "setType:", -[PKPaymentSetupFeature state](self, "state"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentSetupFeature)initWithIdentifiers:(id)a3 localizedDisplayName:(id)a4
{
  id v7;
  id v8;
  PKPaymentSetupFeature *v9;
  PKPaymentSetupFeature *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentSetupFeature;
  v9 = -[PKPaymentSetupFeature init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifiers, a3);
    objc_storeStrong((id *)&v10->_localizedDisplayName, a4);
  }

  return v10;
}

- (void)sanitizePaymentSetupFeature
{
  NSString *productIdentifier;
  NSString *partnerIdentifier;
  NSString *dirtyStateIdentifier;
  NSString *notificationTitle;
  NSString *notificationMessage;
  NSString *discoveryCardIdentifier;

  productIdentifier = self->_productIdentifier;
  self->_productIdentifier = 0;

  partnerIdentifier = self->_partnerIdentifier;
  self->_partnerIdentifier = 0;

  dirtyStateIdentifier = self->_dirtyStateIdentifier;
  self->_featureIdentifier = 0;
  self->_dirtyStateIdentifier = 0;

  self->_productType = 0;
  self->_productState = 0;
  notificationTitle = self->_notificationTitle;
  self->_notificationTitle = 0;

  notificationMessage = self->_notificationMessage;
  self->_notificationMessage = 0;

  discoveryCardIdentifier = self->_discoveryCardIdentifier;
  self->_discoveryCardIdentifier = 0;

}

- (PKPaymentSetupFeature)initWithCoder:(id)a3
{
  id v4;
  PKPaymentSetupFeature *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSSet *identifiers;
  uint64_t v11;
  NSString *localizedDisplayName;
  uint64_t v13;
  NSString *productIdentifier;
  uint64_t v15;
  NSString *partnerIdentifier;
  uint64_t v17;
  NSDate *lastUpdated;
  uint64_t v19;
  NSDate *expiry;
  uint64_t v21;
  NSString *notificationTitle;
  uint64_t v23;
  NSString *notificationMessage;
  uint64_t v25;
  NSString *discoveryCardIdentifier;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PKPaymentSetupFeature;
  v5 = -[PKPaymentSetupFeature init](&v28, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("identifiers"));
    v9 = objc_claimAutoreleasedReturnValue();
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSSet *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDisplayName"));
    v11 = objc_claimAutoreleasedReturnValue();
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v11;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    v5->_supportedOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("supportedOptions"));
    v5->_supportedDevices = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("supportedDevices"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    productIdentifier = v5->_productIdentifier;
    v5->_productIdentifier = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partnerIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    partnerIdentifier = v5->_partnerIdentifier;
    v5->_partnerIdentifier = (NSString *)v15;

    v5->_featureIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("featureIdentifier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdated"));
    v17 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiry"));
    v19 = objc_claimAutoreleasedReturnValue();
    expiry = v5->_expiry;
    v5->_expiry = (NSDate *)v19;

    v5->_productType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("productType"));
    v5->_productState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("productState"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notificationTitle"));
    v21 = objc_claimAutoreleasedReturnValue();
    notificationTitle = v5->_notificationTitle;
    v5->_notificationTitle = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notificationMessage"));
    v23 = objc_claimAutoreleasedReturnValue();
    notificationMessage = v5->_notificationMessage;
    v5->_notificationMessage = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("discoveryCardIdentifier"));
    v25 = objc_claimAutoreleasedReturnValue();
    discoveryCardIdentifier = v5->_discoveryCardIdentifier;
    v5->_discoveryCardIdentifier = (NSString *)v25;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *identifiers;
  id v5;

  identifiers = self->_identifiers;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifiers, CFSTR("identifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedDisplayName, CFSTR("localizedDisplayName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_supportedOptions, CFSTR("supportedOptions"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_supportedDevices, CFSTR("supportedDevices"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productIdentifier, CFSTR("productIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_partnerIdentifier, CFSTR("partnerIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_featureIdentifier, CFSTR("featureIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdated, CFSTR("lastUpdated"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expiry, CFSTR("expiry"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_productType, CFSTR("productType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_productState, CFSTR("productState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_notificationTitle, CFSTR("notificationTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_notificationMessage, CFSTR("notificationMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_discoveryCardIdentifier, CFSTR("discoveryCardIdentifier"));

}

- (id)description
{
  void *v3;
  unint64_t type;
  const __CFString *v5;
  unint64_t state;
  const __CFString *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifiers: %@ "), self->_identifiers);
  objc_msgSend(v3, "appendFormat:", CFSTR("productIdentifier: %@ "), self->_productIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("localizedDisplayName: %@ "), self->_localizedDisplayName);
  type = self->_type;
  if (type > 3)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AD9C70[type];
  objc_msgSend(v3, "appendFormat:", CFSTR("type: %@ "), v5);
  state = self->_state;
  if (state > 3)
    v7 = CFSTR("unknown");
  else
    v7 = off_1E2AD9C90[state];
  objc_msgSend(v3, "appendFormat:", CFSTR("state: %@ "), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentSetupFeature *v5;
  uint64_t v6;
  NSSet *identifiers;
  uint64_t v8;
  NSString *localizedDisplayName;
  uint64_t v10;
  NSString *productIdentifier;
  uint64_t v12;
  NSString *partnerIdentifier;
  uint64_t v14;
  NSDate *lastUpdated;
  uint64_t v16;
  NSDate *expiry;
  uint64_t v18;
  NSString *notificationTitle;
  uint64_t v20;
  NSString *notificationMessage;
  uint64_t v22;
  NSString *discoveryCardIdentifier;

  v5 = -[PKPaymentSetupFeature init](+[PKPaymentSetupFeature allocWithZone:](PKPaymentSetupFeature, "allocWithZone:"), "init");
  v6 = -[NSSet copyWithZone:](self->_identifiers, "copyWithZone:", a3);
  identifiers = v5->_identifiers;
  v5->_identifiers = (NSSet *)v6;

  v8 = -[NSString copyWithZone:](self->_localizedDisplayName, "copyWithZone:", a3);
  localizedDisplayName = v5->_localizedDisplayName;
  v5->_localizedDisplayName = (NSString *)v8;

  v5->_type = self->_type;
  v5->_state = self->_state;
  v5->_supportedOptions = self->_supportedOptions;
  v5->_supportedDevices = self->_supportedDevices;
  v10 = -[NSString copyWithZone:](self->_productIdentifier, "copyWithZone:", a3);
  productIdentifier = v5->_productIdentifier;
  v5->_productIdentifier = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_partnerIdentifier, "copyWithZone:", a3);
  partnerIdentifier = v5->_partnerIdentifier;
  v5->_partnerIdentifier = (NSString *)v12;

  v5->_featureIdentifier = self->_featureIdentifier;
  v14 = -[NSDate copyWithZone:](self->_lastUpdated, "copyWithZone:", a3);
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v14;

  v16 = -[NSDate copyWithZone:](self->_expiry, "copyWithZone:", a3);
  expiry = v5->_expiry;
  v5->_expiry = (NSDate *)v16;

  v5->_productType = self->_productType;
  v5->_productState = self->_productState;
  v18 = -[NSString copyWithZone:](self->_notificationTitle, "copyWithZone:", a3);
  notificationTitle = v5->_notificationTitle;
  v5->_notificationTitle = (NSString *)v18;

  v20 = -[NSString copyWithZone:](self->_notificationMessage, "copyWithZone:", a3);
  notificationMessage = v5->_notificationMessage;
  v5->_notificationMessage = (NSString *)v20;

  v22 = -[NSString copyWithZone:](self->_discoveryCardIdentifier, "copyWithZone:", a3);
  discoveryCardIdentifier = v5->_discoveryCardIdentifier;
  v5->_discoveryCardIdentifier = (NSString *)v22;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *identifiers;
  BOOL v7;
  char v8;
  NSString *localizedDisplayName;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  _BOOL4 v13;
  NSString *productIdentifier;
  NSString *v15;
  _BOOL4 v16;
  NSString *partnerIdentifier;
  NSString *v18;
  _BOOL4 v19;
  NSString *notificationTitle;
  NSString *v21;
  _BOOL4 v22;
  NSString *notificationMessage;
  NSString *v24;
  _BOOL4 v25;
  NSString *discoveryCardIdentifier;
  NSString *v27;
  _BOOL4 v28;
  BOOL v29;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_53;
  v5 = (NSSet *)*((_QWORD *)v4 + 1);
  identifiers = self->_identifiers;
  if (v5)
    v7 = identifiers == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (v5 != identifiers)
      goto LABEL_53;
  }
  else
  {
    v8 = -[NSSet isEqual:](v5, "isEqual:");
    if ((v8 & 1) == 0)
      goto LABEL_53;
  }
  localizedDisplayName = self->_localizedDisplayName;
  v10 = (NSString *)*((id *)v4 + 2);
  v11 = localizedDisplayName;
  if (v10 == v11)
  {

  }
  else
  {
    v12 = v11;
    if (!v10 || !v11)
      goto LABEL_52;
    v13 = -[NSString isEqualToString:](v10, "isEqualToString:", v11);

    if (!v13)
      goto LABEL_53;
  }
  if (*((_QWORD *)v4 + 4) != self->_state
    || *((_QWORD *)v4 + 3) != self->_type
    || *((_QWORD *)v4 + 5) != self->_supportedOptions
    || *((_QWORD *)v4 + 6) != self->_supportedDevices)
  {
    goto LABEL_53;
  }
  productIdentifier = self->_productIdentifier;
  v10 = (NSString *)*((id *)v4 + 7);
  v15 = productIdentifier;
  if (v10 == v15)
  {

  }
  else
  {
    v12 = v15;
    if (!v10 || !v15)
      goto LABEL_52;
    v16 = -[NSString isEqualToString:](v10, "isEqualToString:", v15);

    if (!v16)
      goto LABEL_53;
  }
  partnerIdentifier = self->_partnerIdentifier;
  v10 = (NSString *)*((id *)v4 + 8);
  v18 = partnerIdentifier;
  if (v10 == v18)
  {

  }
  else
  {
    v12 = v18;
    if (!v10 || !v18)
      goto LABEL_52;
    v19 = -[NSString isEqualToString:](v10, "isEqualToString:", v18);

    if (!v19)
      goto LABEL_53;
  }
  if (*((_QWORD *)v4 + 9) != self->_featureIdentifier
    || *((_QWORD *)v4 + 13) != self->_productType
    || *((_QWORD *)v4 + 14) != self->_productState)
  {
    goto LABEL_53;
  }
  notificationTitle = self->_notificationTitle;
  v10 = (NSString *)*((id *)v4 + 15);
  v21 = notificationTitle;
  if (v10 == v21)
  {

  }
  else
  {
    v12 = v21;
    if (!v10 || !v21)
      goto LABEL_52;
    v22 = -[NSString isEqualToString:](v10, "isEqualToString:", v21);

    if (!v22)
      goto LABEL_53;
  }
  notificationMessage = self->_notificationMessage;
  v10 = (NSString *)*((id *)v4 + 16);
  v24 = notificationMessage;
  if (v10 == v24)
  {

  }
  else
  {
    v12 = v24;
    if (!v10 || !v24)
      goto LABEL_52;
    v25 = -[NSString isEqualToString:](v10, "isEqualToString:", v24);

    if (!v25)
      goto LABEL_53;
  }
  discoveryCardIdentifier = self->_discoveryCardIdentifier;
  v10 = (NSString *)*((id *)v4 + 17);
  v27 = discoveryCardIdentifier;
  if (v10 != v27)
  {
    v12 = v27;
    if (v10 && v27)
    {
      v28 = -[NSString isEqualToString:](v10, "isEqualToString:", v27);

      if (!v28)
        goto LABEL_53;
      goto LABEL_56;
    }
LABEL_52:

    goto LABEL_53;
  }

LABEL_56:
  if ((NSDate *)*((_QWORD *)v4 + 11) == self->_lastUpdated)
  {
    v29 = (NSDate *)*((_QWORD *)v4 + 12) == self->_expiry;
    goto LABEL_54;
  }
LABEL_53:
  v29 = 0;
LABEL_54:

  return v29;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifiers);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedDisplayName);
  objc_msgSend(v3, "safelyAddObject:", self->_productIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_partnerIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_notificationTitle);
  objc_msgSend(v3, "safelyAddObject:", self->_notificationMessage);
  objc_msgSend(v3, "safelyAddObject:", self->_discoveryCardIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdated);
  objc_msgSend(v3, "safelyAddObject:", self->_expiry);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_state - v5 + 32 * v5;
  v7 = self->_supportedOptions - v6 + 32 * v6;
  v8 = self->_supportedDevices - v7 + 32 * v7;
  v9 = self->_featureIdentifier - v8 + 32 * v8;
  v10 = self->_productType - v9 + 32 * v9;
  v11 = self->_productState - v10 + 32 * v10;

  return v11;
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)supportedOptions
{
  return self->_supportedOptions;
}

- (void)setSupportedOptions:(int64_t)a3
{
  self->_supportedOptions = a3;
}

- (int64_t)supportedDevices
{
  return self->_supportedDevices;
}

- (void)setSupportedDevices:(int64_t)a3
{
  self->_supportedDevices = a3;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)partnerIdentifier
{
  return self->_partnerIdentifier;
}

- (void)setPartnerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_featureIdentifier = a3;
}

- (NSString)dirtyStateIdentifier
{
  return self->_dirtyStateIdentifier;
}

- (void)setDirtyStateIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdated, a3);
}

- (NSDate)expiry
{
  return self->_expiry;
}

- (void)setExpiry:(id)a3
{
  objc_storeStrong((id *)&self->_expiry, a3);
}

- (unint64_t)productType
{
  return self->_productType;
}

- (void)setProductType:(unint64_t)a3
{
  self->_productType = a3;
}

- (unint64_t)productState
{
  return self->_productState;
}

- (void)setProductState:(unint64_t)a3
{
  self->_productState = a3;
}

- (NSString)notificationTitle
{
  return self->_notificationTitle;
}

- (void)setNotificationTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)notificationMessage
{
  return self->_notificationMessage;
}

- (void)setNotificationMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)discoveryCardIdentifier
{
  return self->_discoveryCardIdentifier;
}

- (void)setDiscoveryCardIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryCardIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationMessage, 0);
  objc_storeStrong((id *)&self->_notificationTitle, 0);
  objc_storeStrong((id *)&self->_expiry, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_dirtyStateIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerIdentifier, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
