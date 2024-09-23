@implementation PKServiceProviderPurchase

+ (PKServiceProviderPurchase)purchaseWithDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v4);

  return (PKServiceProviderPurchase *)v5;
}

- (PKServiceProviderPurchase)initWithDictionary:(id)a3
{
  id v4;
  PKServiceProviderPurchase *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSString *visibleTransactionIdentifier;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *deviceIdentifier;
  void *v16;
  uint64_t v17;
  NSString *serviceProviderIdentifier;
  void *v19;
  uint64_t v20;
  PKServiceProviderPurchaseData *serviceProviderData;
  void *v22;
  uint64_t v23;
  NSString *signature;
  void *v25;
  uint64_t v26;
  NSDate *purchaseDate;
  void *v28;
  uint64_t v29;
  NSString *partnerMetadata;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSArray *actions;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PKServiceProviderPurchase;
  v5 = -[PKServiceProviderPurchase init](&v45, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("visibleTransactionIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    visibleTransactionIdentifier = v5->_visibleTransactionIdentifier;
    v5->_visibleTransactionIdentifier = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("state"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = PKServiceProviderPurchaseStateFromString(v12);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("deviceIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v14;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("serviceProviderIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    serviceProviderIdentifier = v5->_serviceProviderIdentifier;
    v5->_serviceProviderIdentifier = (NSString *)v17;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("serviceProviderData"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (PKServiceProviderPurchaseData *)v20;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("signature"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    signature = v5->_signature;
    v5->_signature = (NSString *)v23;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("datePurchased"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    purchaseDate = v5->_purchaseDate;
    v5->_purchaseDate = (NSDate *)v26;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("partnerMetadata"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    partnerMetadata = v5->_partnerMetadata;
    v5->_partnerMetadata = (NSString *)v29;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("actions"), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v42;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v42 != v35)
            objc_enumerationMutation(v32);
          +[PKServiceProviderPurchaseAction actionWithDictionary:](PKServiceProviderPurchaseAction, "actionWithDictionary:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v36));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
            objc_msgSend(v31, "addObject:", v37);

          ++v36;
        }
        while (v34 != v36);
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v34);
    }

    v38 = objc_msgSend(v31, "copy");
    actions = v5->_actions;
    v5->_actions = (NSArray *)v38;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKServiceProviderPurchase)initWithCoder:(id)a3
{
  id v4;
  PKServiceProviderPurchase *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSString *visibleTransactionIdentifier;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *deviceIdentifier;
  void *v16;
  uint64_t v17;
  NSString *regionIdentifier;
  void *v19;
  uint64_t v20;
  NSString *serviceProviderIdentifier;
  void *v22;
  uint64_t v23;
  PKServiceProviderPurchaseData *serviceProviderData;
  void *v25;
  uint64_t v26;
  NSString *signature;
  void *v28;
  uint64_t v29;
  NSDate *purchaseDate;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSArray *actions;
  void *v37;
  uint64_t v38;
  NSString *partnerMetadata;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)PKServiceProviderPurchase;
  v5 = -[PKServiceProviderPurchase init](&v41, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("visibleTransactionIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    visibleTransactionIdentifier = v5->_visibleTransactionIdentifier;
    v5->_visibleTransactionIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = PKServiceProviderPurchaseStateFromString(v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("regionIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    regionIdentifier = v5->_regionIdentifier;
    v5->_regionIdentifier = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceProviderIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    serviceProviderIdentifier = v5->_serviceProviderIdentifier;
    v5->_serviceProviderIdentifier = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceProviderData"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (PKServiceProviderPurchaseData *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    signature = v5->_signature;
    v5->_signature = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("datePurchased"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    purchaseDate = v5->_purchaseDate;
    v5->_purchaseDate = (NSDate *)v29;

    v31 = (void *)MEMORY[0x1E0C99E60];
    v32 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("actions"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "copy");
    actions = v5->_actions;
    v5->_actions = (NSArray *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partnerMetadata"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "copy");
    partnerMetadata = v5->_partnerMetadata;
    v5->_partnerMetadata = (NSString *)v38;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4;
  const __CFString *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_visibleTransactionIdentifier, CFSTR("visibleTransactionIdentifier"));
  v4 = self->_state - 1;
  if (v4 > 2)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2ACBD28[v4];
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("identifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_deviceIdentifier, CFSTR("deviceIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_regionIdentifier, CFSTR("regionIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_serviceProviderIdentifier, CFSTR("serviceProviderIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_serviceProviderData, CFSTR("serviceProviderData"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_signature, CFSTR("signature"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_purchaseDate, CFSTR("datePurchased"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_actions, CFSTR("actions"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_partnerMetadata, CFSTR("partnerMetadata"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_visibleTransactionIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_deviceIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_regionIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_serviceProviderIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_serviceProviderData);
  objc_msgSend(v3, "safelyAddObject:", self->_purchaseDate);
  objc_msgSend(v3, "safelyAddObject:", self->_signature);
  objc_msgSend(v3, "safelyAddObject:", self->_actions);
  objc_msgSend(v3, "safelyAddObject:", self->_partnerMetadata);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_state - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[PKServiceProviderPurchase isEqualToServiceProviderPurchase:](self, "isEqualToServiceProviderPurchase:", v4);

  return v5;
}

- (BOOL)isEqualToServiceProviderPurchase:(id)a3
{
  PKServiceProviderPurchase *v4;
  NSString *identifier;
  NSString *v6;
  BOOL v7;
  BOOL v8;
  NSString *visibleTransactionIdentifier;
  NSString *v10;
  NSString *deviceIdentifier;
  NSString *v12;
  NSString *regionIdentifier;
  NSString *v14;
  NSString *serviceProviderIdentifier;
  NSString *v16;
  PKServiceProviderPurchaseData *serviceProviderData;
  PKServiceProviderPurchaseData *v18;
  NSDate *purchaseDate;
  NSDate *v20;
  NSString *signature;
  NSString *v22;
  NSArray *actions;
  NSArray *v24;
  NSString *partnerMetadata;
  NSString *v26;

  v4 = (PKServiceProviderPurchase *)a3;
  if (self != v4)
  {
    identifier = self->_identifier;
    v6 = v4->_identifier;
    if (identifier)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (v7)
    {
      if (identifier != v6)
        goto LABEL_56;
    }
    else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
    {
      goto LABEL_56;
    }
    visibleTransactionIdentifier = self->_visibleTransactionIdentifier;
    v10 = v4->_visibleTransactionIdentifier;
    if (visibleTransactionIdentifier && v10)
    {
      if ((-[NSString isEqual:](visibleTransactionIdentifier, "isEqual:") & 1) == 0)
        goto LABEL_56;
    }
    else if (visibleTransactionIdentifier != v10)
    {
      goto LABEL_56;
    }
    deviceIdentifier = self->_deviceIdentifier;
    v12 = v4->_deviceIdentifier;
    if (deviceIdentifier && v12)
    {
      if ((-[NSString isEqual:](deviceIdentifier, "isEqual:") & 1) == 0)
        goto LABEL_56;
    }
    else if (deviceIdentifier != v12)
    {
      goto LABEL_56;
    }
    regionIdentifier = self->_regionIdentifier;
    v14 = v4->_regionIdentifier;
    if (regionIdentifier && v14)
    {
      if ((-[NSString isEqual:](regionIdentifier, "isEqual:") & 1) == 0)
        goto LABEL_56;
    }
    else if (regionIdentifier != v14)
    {
      goto LABEL_56;
    }
    serviceProviderIdentifier = self->_serviceProviderIdentifier;
    v16 = v4->_serviceProviderIdentifier;
    if (serviceProviderIdentifier && v16)
    {
      if ((-[NSString isEqual:](serviceProviderIdentifier, "isEqual:") & 1) == 0)
        goto LABEL_56;
    }
    else if (serviceProviderIdentifier != v16)
    {
      goto LABEL_56;
    }
    serviceProviderData = self->_serviceProviderData;
    v18 = v4->_serviceProviderData;
    if (serviceProviderData && v18)
    {
      if (!-[PKServiceProviderPurchaseData isEqual:](serviceProviderData, "isEqual:"))
        goto LABEL_56;
    }
    else if (serviceProviderData != v18)
    {
      goto LABEL_56;
    }
    purchaseDate = self->_purchaseDate;
    v20 = v4->_purchaseDate;
    if (purchaseDate && v20)
    {
      if ((-[NSDate isEqual:](purchaseDate, "isEqual:") & 1) == 0)
        goto LABEL_56;
    }
    else if (purchaseDate != v20)
    {
      goto LABEL_56;
    }
    signature = self->_signature;
    v22 = v4->_signature;
    if (signature && v22)
    {
      if ((-[NSString isEqual:](signature, "isEqual:") & 1) == 0)
        goto LABEL_56;
    }
    else if (signature != v22)
    {
      goto LABEL_56;
    }
    actions = self->_actions;
    v24 = v4->_actions;
    if (actions && v24)
    {
      if ((-[NSArray isEqual:](actions, "isEqual:") & 1) == 0)
        goto LABEL_56;
    }
    else if (actions != v24)
    {
      goto LABEL_56;
    }
    partnerMetadata = self->_partnerMetadata;
    v26 = v4->_partnerMetadata;
    if (partnerMetadata && v26)
    {
      if ((-[NSString isEqual:](partnerMetadata, "isEqual:") & 1) != 0)
      {
LABEL_54:
        v8 = self->_state == v4->_state;
        goto LABEL_57;
      }
    }
    else if (partnerMetadata == v26)
    {
      goto LABEL_54;
    }
LABEL_56:
    v8 = 0;
    goto LABEL_57;
  }
  v8 = 1;
LABEL_57:

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  NSDate *purchaseDate;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_identifier)
    objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  if (self->_visibleTransactionIdentifier)
    objc_msgSend(v4, "appendFormat:", CFSTR("visibleOrderIdentifier: '%@'; "), self->_visibleTransactionIdentifier);
  if (self->_deviceIdentifier)
    objc_msgSend(v4, "appendFormat:", CFSTR("deviceIdentifier: '%@'; "), self->_deviceIdentifier);
  if (self->_regionIdentifier)
    objc_msgSend(v4, "appendFormat:", CFSTR("regionIdentifier: '%@'; "), self->_regionIdentifier);
  if (self->_serviceProviderIdentifier)
    objc_msgSend(v4, "appendFormat:", CFSTR("serviceProviderIdentifier: '%@'; "), self->_serviceProviderIdentifier);
  if (self->_serviceProviderData)
    objc_msgSend(v4, "appendFormat:", CFSTR("serviceProviderData: '%@'; "), self->_serviceProviderData);
  purchaseDate = self->_purchaseDate;
  if (purchaseDate)
  {
    PKShortDateString((uint64_t)purchaseDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("purchaseDate: %@;"), v6);

  }
  if (self->_signature)
    objc_msgSend(v4, "appendFormat:", CFSTR("signature: '%@'; "), self->_signature);
  if (self->_actions)
    objc_msgSend(v4, "appendFormat:", CFSTR("_actions: '%@'; "), self->_actions);
  if (self->_partnerMetadata)
    objc_msgSend(v4, "appendFormat:", CFSTR("partnerMetadata: '%@'; "), self->_partnerMetadata);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)visibleTransactionIdentifier
{
  return self->_visibleTransactionIdentifier;
}

- (void)setVisibleTransactionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)regionIdentifier
{
  return self->_regionIdentifier;
}

- (void)setRegionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)serviceProviderIdentifier
{
  return self->_serviceProviderIdentifier;
}

- (void)setServiceProviderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (PKServiceProviderPurchaseData)serviceProviderData
{
  return self->_serviceProviderData;
}

- (void)setServiceProviderData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)purchaseDate
{
  return self->_purchaseDate;
}

- (void)setPurchaseDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)partnerMetadata
{
  return self->_partnerMetadata;
}

- (void)setPartnerMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_partnerMetadata, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_serviceProviderData, 0);
  objc_storeStrong((id *)&self->_serviceProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_regionIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_visibleTransactionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
