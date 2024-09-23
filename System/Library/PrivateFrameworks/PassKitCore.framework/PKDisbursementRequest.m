@implementation PKDisbursementRequest

- (PKDisbursementRequest)initWithMerchantIdentifier:(NSString *)merchantIdentifier currencyCode:(NSString *)currencyCode regionCode:(NSString *)regionCode supportedNetworks:(NSArray *)supportedNetworks merchantCapabilities:(PKMerchantCapability)merchantCapabilities summaryItems:(NSArray *)summaryItems
{
  NSString *v14;
  NSString *v15;
  NSString *v16;
  NSArray *v17;
  NSArray *v18;
  PKDisbursementRequest *v19;
  uint64_t v20;
  NSString *v21;
  uint64_t v22;
  NSString *v23;
  uint64_t v24;
  NSString *v25;
  uint64_t v26;
  NSArray *v27;
  uint64_t v28;
  NSArray *v29;
  objc_super v31;

  v14 = merchantIdentifier;
  v15 = currencyCode;
  v16 = regionCode;
  v17 = supportedNetworks;
  v18 = summaryItems;
  v31.receiver = self;
  v31.super_class = (Class)PKDisbursementRequest;
  v19 = -[PKDisbursementRequest init](&v31, sel_init);
  if (v19)
  {
    v20 = -[NSString copy](v14, "copy");
    v21 = v19->_merchantIdentifier;
    v19->_merchantIdentifier = (NSString *)v20;

    v22 = -[NSString copy](v15, "copy");
    v23 = v19->_currencyCode;
    v19->_currencyCode = (NSString *)v22;

    v24 = -[NSString copy](v16, "copy");
    v25 = v19->_regionCode;
    v19->_regionCode = (NSString *)v24;

    v26 = -[NSArray copy](v17, "copy");
    v27 = v19->_supportedNetworks;
    v19->_supportedNetworks = (NSArray *)v26;

    v19->_merchantCapabilities = merchantCapabilities;
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v18, 1);
    v29 = v19->_summaryItems;
    v19->_summaryItems = (NSArray *)v28;

  }
  return v19;
}

- (PKDisbursementRequest)init
{
  return -[PKDisbursementRequest initWithMerchantIdentifier:currencyCode:regionCode:supportedNetworks:merchantCapabilities:summaryItems:](self, "initWithMerchantIdentifier:currencyCode:regionCode:supportedNetworks:merchantCapabilities:summaryItems:", &stru_1E2ADF4C0, &stru_1E2ADF4C0, &stru_1E2ADF4C0, MEMORY[0x1E0C9AA60], 0, MEMORY[0x1E0C9AA60]);
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self || -[PKDisbursementRequest isEqualToDisbursementRequest:](self, "isEqualToDisbursementRequest:");
}

- (BOOL)isEqualToDisbursementRequest:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  _BOOL4 v9;
  void *v10;
  NSString *v11;
  _BOOL4 v12;
  NSArray *supportedNetworks;
  NSArray *v14;
  NSArray *summaryItems;
  NSArray *v16;
  void *v17;
  NSString *v18;
  _BOOL4 v19;
  char v20;
  NSArray *requiredRecipientContactFields;
  NSArray *v23;
  PKContact *recipientContact;
  PKContact *v25;
  NSArray *supportedRegions;
  NSArray *v27;
  NSData *applicationData;
  NSData *v29;

  v4 = a3;
  if (!v4)
    goto LABEL_32;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_32;
  v5 = (void *)v4[1];
  v6 = self->_merchantIdentifier;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
      goto LABEL_31;
    v9 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

    if (!v9)
      goto LABEL_32;
  }
  v10 = (void *)v4[2];
  v6 = self->_regionCode;
  v11 = v10;
  if (v6 == v11)
  {

  }
  else
  {
    v8 = v11;
    if (!v6 || !v11)
      goto LABEL_31;
    v12 = -[NSString isEqualToString:](v6, "isEqualToString:", v11);

    if (!v12)
      goto LABEL_32;
  }
  supportedNetworks = self->_supportedNetworks;
  v14 = (NSArray *)v4[3];
  if (supportedNetworks && v14)
  {
    if ((-[NSArray isEqual:](supportedNetworks, "isEqual:") & 1) == 0)
      goto LABEL_32;
  }
  else if (supportedNetworks != v14)
  {
    goto LABEL_32;
  }
  if (self->_merchantCapabilities != v4[4])
    goto LABEL_32;
  summaryItems = self->_summaryItems;
  v16 = (NSArray *)v4[5];
  if (summaryItems && v16)
  {
    if ((-[NSArray isEqual:](summaryItems, "isEqual:") & 1) == 0)
      goto LABEL_32;
  }
  else if (summaryItems != v16)
  {
    goto LABEL_32;
  }
  v17 = (void *)v4[6];
  v6 = self->_currencyCode;
  v18 = v17;
  if (v6 == v18)
  {

    goto LABEL_35;
  }
  v8 = v18;
  if (!v6 || !v18)
  {
LABEL_31:

    goto LABEL_32;
  }
  v19 = -[NSString isEqualToString:](v6, "isEqualToString:", v18);

  if (!v19)
    goto LABEL_32;
LABEL_35:
  requiredRecipientContactFields = self->_requiredRecipientContactFields;
  v23 = (NSArray *)v4[7];
  if (requiredRecipientContactFields && v23)
  {
    if ((-[NSArray isEqual:](requiredRecipientContactFields, "isEqual:") & 1) == 0)
      goto LABEL_32;
  }
  else if (requiredRecipientContactFields != v23)
  {
    goto LABEL_32;
  }
  recipientContact = self->_recipientContact;
  v25 = (PKContact *)v4[8];
  if (recipientContact && v25)
  {
    if (!-[PKContact isEqual:](recipientContact, "isEqual:"))
      goto LABEL_32;
  }
  else if (recipientContact != v25)
  {
    goto LABEL_32;
  }
  supportedRegions = self->_supportedRegions;
  v27 = (NSArray *)v4[9];
  if (supportedRegions && v27)
  {
    if ((-[NSArray isEqual:](supportedRegions, "isEqual:") & 1) != 0)
      goto LABEL_50;
LABEL_32:
    v20 = 0;
    goto LABEL_33;
  }
  if (supportedRegions != v27)
    goto LABEL_32;
LABEL_50:
  applicationData = self->_applicationData;
  v29 = (NSData *)v4[10];
  if (applicationData && v29)
    v20 = -[NSData isEqual:](applicationData, "isEqual:");
  else
    v20 = applicationData == v29;
LABEL_33:

  return v20;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_merchantIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_regionCode);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedNetworks);
  objc_msgSend(v3, "safelyAddObject:", self->_summaryItems);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_requiredRecipientContactFields);
  objc_msgSend(v3, "safelyAddObject:", self->_recipientContact);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedRegions);
  objc_msgSend(v3, "safelyAddObject:", self->_applicationData);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_merchantCapabilities - v4 + 32 * v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKDisbursementRequest *v5;
  uint64_t v6;
  NSString *merchantIdentifier;
  uint64_t v8;
  NSString *regionCode;
  uint64_t v10;
  NSArray *supportedNetworks;
  uint64_t v12;
  NSArray *summaryItems;
  uint64_t v14;
  NSString *currencyCode;
  uint64_t v16;
  NSArray *requiredRecipientContactFields;
  PKContact *v18;
  PKContact *recipientContact;
  uint64_t v20;
  NSArray *supportedRegions;
  uint64_t v22;
  NSData *applicationData;

  v5 = -[PKDisbursementRequest init](+[PKDisbursementRequest allocWithZone:](PKDisbursementRequest, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_merchantIdentifier, "copyWithZone:", a3);
  merchantIdentifier = v5->_merchantIdentifier;
  v5->_merchantIdentifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_regionCode, "copyWithZone:", a3);
  regionCode = v5->_regionCode;
  v5->_regionCode = (NSString *)v8;

  v10 = -[NSArray copyWithZone:](self->_supportedNetworks, "copyWithZone:", a3);
  supportedNetworks = v5->_supportedNetworks;
  v5->_supportedNetworks = (NSArray *)v10;

  v5->_merchantCapabilities = self->_merchantCapabilities;
  v12 = -[NSArray copyWithZone:](self->_summaryItems, "copyWithZone:", a3);
  summaryItems = v5->_summaryItems;
  v5->_summaryItems = (NSArray *)v12;

  v14 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  currencyCode = v5->_currencyCode;
  v5->_currencyCode = (NSString *)v14;

  v16 = -[NSArray copyWithZone:](self->_requiredRecipientContactFields, "copyWithZone:", a3);
  requiredRecipientContactFields = v5->_requiredRecipientContactFields;
  v5->_requiredRecipientContactFields = (NSArray *)v16;

  v18 = -[PKContact copyWithZone:](self->_recipientContact, "copyWithZone:", a3);
  recipientContact = v5->_recipientContact;
  v5->_recipientContact = v18;

  v20 = -[NSArray copyWithZone:](self->_supportedRegions, "copyWithZone:", a3);
  supportedRegions = v5->_supportedRegions;
  v5->_supportedRegions = (NSArray *)v20;

  v22 = -[NSData copyWithZone:](self->_applicationData, "copyWithZone:", a3);
  applicationData = v5->_applicationData;
  v5->_applicationData = (NSData *)v22;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDisbursementRequest)initWithCoder:(id)a3
{
  id v4;
  PKDisbursementRequest *v5;
  uint64_t v6;
  NSString *merchantIdentifier;
  uint64_t v8;
  NSString *regionCode;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *supportedNetworks;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *summaryItems;
  uint64_t v20;
  NSString *currencyCode;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSArray *requiredRecipientContactFields;
  uint64_t v27;
  PKContact *recipientContact;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSArray *supportedRegions;
  uint64_t v34;
  NSData *applicationData;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PKDisbursementRequest;
  v5 = -[PKDisbursementRequest init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("regionCode"));
    v8 = objc_claimAutoreleasedReturnValue();
    regionCode = v5->_regionCode;
    v5->_regionCode = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("supportedNetworks"));
    v13 = objc_claimAutoreleasedReturnValue();
    supportedNetworks = v5->_supportedNetworks;
    v5->_supportedNetworks = (NSArray *)v13;

    v5->_merchantCapabilities = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("merchantCapabilities"));
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("summaryItems"));
    v18 = objc_claimAutoreleasedReturnValue();
    summaryItems = v5->_summaryItems;
    v5->_summaryItems = (NSArray *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v20 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("requiredRecipientContactFields"));
    v25 = objc_claimAutoreleasedReturnValue();
    requiredRecipientContactFields = v5->_requiredRecipientContactFields;
    v5->_requiredRecipientContactFields = (NSArray *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientContact"));
    v27 = objc_claimAutoreleasedReturnValue();
    recipientContact = v5->_recipientContact;
    v5->_recipientContact = (PKContact *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("supportedRegions"));
    v32 = objc_claimAutoreleasedReturnValue();
    supportedRegions = v5->_supportedRegions;
    v5->_supportedRegions = (NSArray *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationData"));
    v34 = objc_claimAutoreleasedReturnValue();
    applicationData = v5->_applicationData;
    v5->_applicationData = (NSData *)v34;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *merchantIdentifier;
  id v5;

  merchantIdentifier = self->_merchantIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", merchantIdentifier, CFSTR("merchantIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_regionCode, CFSTR("regionCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedNetworks, CFSTR("supportedNetworks"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_merchantCapabilities, CFSTR("merchantCapabilities"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_summaryItems, CFSTR("summaryItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requiredRecipientContactFields, CFSTR("requiredRecipientContactFields"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipientContact, CFSTR("recipientContact"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedRegions, CFSTR("supportedRegions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationData, CFSTR("applicationData"));

}

+ (NSError)disbursementContactInvalidErrorWithContactField:(PKContactField)field localizedDescription:(NSString *)localizedDescription
{
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CB35C8];
  v6 = localizedDescription;
  v7 = field;
  v8 = [v5 alloc];
  v13[0] = *MEMORY[0x1E0CB2D50];
  v13[1] = CFSTR("PKDisbursementErrorContactField");
  v9 = &stru_1E2ADF4C0;
  if (v6)
    v9 = (const __CFString *)v6;
  v14[0] = v9;
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("PKDisbursementErrorDomain"), 2, v10);
  return (NSError *)v11;
}

+ (NSError)disbursementCardUnsupportedError
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = &stru_1E2ADF4C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithDomain:code:userInfo:", CFSTR("PKDisbursementErrorDomain"), 1, v3);

  return (NSError *)v4;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(NSString *)merchantIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, merchantIdentifier, 8);
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void)setRegionCode:(NSString *)regionCode
{
  objc_setProperty_nonatomic_copy(self, a2, regionCode, 16);
}

- (NSArray)supportedNetworks
{
  return self->_supportedNetworks;
}

- (void)setSupportedNetworks:(NSArray *)supportedNetworks
{
  objc_setProperty_nonatomic_copy(self, a2, supportedNetworks, 24);
}

- (PKMerchantCapability)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (void)setMerchantCapabilities:(PKMerchantCapability)merchantCapabilities
{
  self->_merchantCapabilities = merchantCapabilities;
}

- (NSArray)summaryItems
{
  return self->_summaryItems;
}

- (void)setSummaryItems:(NSArray *)summaryItems
{
  objc_setProperty_nonatomic_copy(self, a2, summaryItems, 40);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(NSString *)currencyCode
{
  objc_setProperty_nonatomic_copy(self, a2, currencyCode, 48);
}

- (NSArray)requiredRecipientContactFields
{
  return self->_requiredRecipientContactFields;
}

- (void)setRequiredRecipientContactFields:(NSArray *)requiredRecipientContactFields
{
  objc_storeStrong((id *)&self->_requiredRecipientContactFields, requiredRecipientContactFields);
}

- (PKContact)recipientContact
{
  return self->_recipientContact;
}

- (void)setRecipientContact:(PKContact *)recipientContact
{
  objc_storeStrong((id *)&self->_recipientContact, recipientContact);
}

- (NSArray)supportedRegions
{
  return self->_supportedRegions;
}

- (void)setSupportedRegions:(NSArray *)supportedRegions
{
  objc_setProperty_nonatomic_copy(self, a2, supportedRegions, 72);
}

- (NSData)applicationData
{
  return self->_applicationData;
}

- (void)setApplicationData:(NSData *)applicationData
{
  objc_setProperty_nonatomic_copy(self, a2, applicationData, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_supportedRegions, 0);
  objc_storeStrong((id *)&self->_recipientContact, 0);
  objc_storeStrong((id *)&self->_requiredRecipientContactFields, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_summaryItems, 0);
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
}

@end
