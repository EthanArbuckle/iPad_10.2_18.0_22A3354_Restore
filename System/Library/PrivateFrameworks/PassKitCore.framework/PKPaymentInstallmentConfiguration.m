@implementation PKPaymentInstallmentConfiguration

- (void)encodeToBodyDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isInstallment"));
  -[PKPaymentInstallmentConfiguration openToBuyThresholdAmount](self, "openToBuyThresholdAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("installmentAmount"));

  -[PKPaymentInstallmentConfiguration currencyCode](self, "currencyCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("installmentCurrencyCode"));

  PKInstallmentRetailChannelToString(-[PKPaymentInstallmentConfiguration retailChannel](self, "retailChannel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("installmentChannel"));

  -[PKPaymentInstallmentConfiguration installmentItems](self, "installmentItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "pk_arrayByApplyingBlock:", &__block_literal_global_1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("installmentItems"));

  }
  -[PKPaymentInstallmentConfiguration applicationMetadata](self, "applicationMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v11, 0, &v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15;
    if (v12)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("installmentMetadata"));
    }
    else
    {
      PKLogFacilityTypeGetObject(0xDuLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v13;
        _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Invalid JSON data with PKPaymentInstallmentConfiguration: %@", buf, 0xCu);
      }

    }
  }

}

id __86__PKPaymentInstallmentConfiguration_PKApplyWebServiceRequest__encodeToBodyDictionary___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v2 = (objc_class *)MEMORY[0x1E0C99E08];
  v3 = a2;
  v4 = objc_alloc_init(v2);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "installmentItemType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("installmentItemType"));

  objc_msgSend(v3, "amount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("amount"));

  objc_msgSend(v3, "currencyCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("currencyCode"));

  objc_msgSend(v3, "programIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("programIdentifier"));

  objc_msgSend(v3, "apr");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("apr"));

  objc_msgSend(v3, "programTerms");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("terms"));
  v14 = (void *)objc_msgSend(v4, "copy");

  return v14;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  unint64_t v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_merchandisingImageData);
  objc_msgSend(v3, "safelyAddObject:", self->_openToBuyThresholdAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_bindingTotalAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_installmentMerchantIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_referrerIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_applicationMetadata);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_inStorePurchase - v4 + 32 * v4;
  v6 = self->_feature - v5 + 32 * v5;
  v7 = self->_retailChannel - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentInstallmentConfiguration *v4;
  PKPaymentInstallmentConfiguration *v5;
  BOOL v6;

  v4 = (PKPaymentInstallmentConfiguration *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentInstallmentConfiguration isEqualToInstallmentConfiguration:](self, "isEqualToInstallmentConfiguration:", v5);

  return v6;
}

- (BOOL)isEqualToInstallmentConfiguration:(id)a3
{
  _QWORD *v4;
  NSData *merchandisingImageData;
  NSData *v6;
  BOOL v7;
  NSDecimalNumber *openToBuyThresholdAmount;
  NSDecimalNumber *v9;
  NSDecimalNumber *bindingTotalAmount;
  NSDecimalNumber *v11;
  NSString *currencyCode;
  NSString *v13;
  NSString *installmentMerchantIdentifier;
  NSString *v15;
  NSString *referrerIdentifier;
  NSString *v17;
  NSArray *installmentItems;
  NSArray *v19;
  NSDictionary *applicationMetadata;
  NSDictionary *v21;
  BOOL v22;

  v4 = a3;
  if (!v4)
    goto LABEL_47;
  merchandisingImageData = self->_merchandisingImageData;
  v6 = (NSData *)v4[3];
  if (merchandisingImageData)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (merchandisingImageData != v6)
      goto LABEL_47;
  }
  else if ((-[NSData isEqual:](merchandisingImageData, "isEqual:") & 1) == 0)
  {
    goto LABEL_47;
  }
  if (self->_feature != v4[2])
    goto LABEL_47;
  openToBuyThresholdAmount = self->_openToBuyThresholdAmount;
  v9 = (NSDecimalNumber *)v4[4];
  if (openToBuyThresholdAmount && v9)
  {
    if ((-[NSDecimalNumber isEqual:](openToBuyThresholdAmount, "isEqual:") & 1) == 0)
      goto LABEL_47;
  }
  else if (openToBuyThresholdAmount != v9)
  {
    goto LABEL_47;
  }
  bindingTotalAmount = self->_bindingTotalAmount;
  v11 = (NSDecimalNumber *)v4[5];
  if (bindingTotalAmount && v11)
  {
    if ((-[NSDecimalNumber isEqual:](bindingTotalAmount, "isEqual:") & 1) == 0)
      goto LABEL_47;
  }
  else if (bindingTotalAmount != v11)
  {
    goto LABEL_47;
  }
  currencyCode = self->_currencyCode;
  v13 = (NSString *)v4[6];
  if (currencyCode && v13)
  {
    if ((-[NSString isEqual:](currencyCode, "isEqual:") & 1) == 0)
      goto LABEL_47;
  }
  else if (currencyCode != v13)
  {
    goto LABEL_47;
  }
  if (self->_inStorePurchase != *((unsigned __int8 *)v4 + 8))
    goto LABEL_47;
  installmentMerchantIdentifier = self->_installmentMerchantIdentifier;
  v15 = (NSString *)v4[7];
  if (installmentMerchantIdentifier && v15)
  {
    if ((-[NSString isEqual:](installmentMerchantIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_47;
  }
  else if (installmentMerchantIdentifier != v15)
  {
    goto LABEL_47;
  }
  referrerIdentifier = self->_referrerIdentifier;
  v17 = (NSString *)v4[8];
  if (referrerIdentifier && v17)
  {
    if ((-[NSString isEqual:](referrerIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_47;
  }
  else if (referrerIdentifier != v17)
  {
    goto LABEL_47;
  }
  installmentItems = self->_installmentItems;
  v19 = (NSArray *)v4[9];
  if (installmentItems && v19)
  {
    if ((-[NSArray isEqual:](installmentItems, "isEqual:") & 1) == 0)
      goto LABEL_47;
  }
  else if (installmentItems != v19)
  {
    goto LABEL_47;
  }
  applicationMetadata = self->_applicationMetadata;
  v21 = (NSDictionary *)v4[10];
  if (!applicationMetadata || !v21)
  {
    if (applicationMetadata == v21)
      goto LABEL_45;
LABEL_47:
    v22 = 0;
    goto LABEL_48;
  }
  if ((-[NSDictionary isEqual:](applicationMetadata, "isEqual:") & 1) == 0)
    goto LABEL_47;
LABEL_45:
  v22 = self->_retailChannel == v4[11];
LABEL_48:

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentInstallmentConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKPaymentInstallmentConfiguration *v5;
  uint64_t v6;
  NSData *merchandisingImageData;
  uint64_t v8;
  NSDecimalNumber *openToBuyThresholdAmount;
  uint64_t v10;
  NSDecimalNumber *bindingTotalAmount;
  uint64_t v12;
  NSString *currencyCode;
  uint64_t v14;
  NSString *installmentMerchantIdentifier;
  uint64_t v16;
  NSString *referrerIdentifier;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *installmentItems;
  void *v23;
  uint64_t v24;
  NSDictionary *applicationMetadata;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKPaymentInstallmentConfiguration;
  v5 = -[PKPaymentInstallmentConfiguration init](&v27, sel_init);
  if (v5)
  {
    v5->_feature = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("feature"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchandisingImageData"));
    v6 = objc_claimAutoreleasedReturnValue();
    merchandisingImageData = v5->_merchandisingImageData;
    v5->_merchandisingImageData = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("openToBuyThresholdAmount"));
    v8 = objc_claimAutoreleasedReturnValue();
    openToBuyThresholdAmount = v5->_openToBuyThresholdAmount;
    v5->_openToBuyThresholdAmount = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bindingTotalAmount"));
    v10 = objc_claimAutoreleasedReturnValue();
    bindingTotalAmount = v5->_bindingTotalAmount;
    v5->_bindingTotalAmount = (NSDecimalNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v12;

    v5->_inStorePurchase = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inStorePurchase"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentMerchantIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    installmentMerchantIdentifier = v5->_installmentMerchantIdentifier;
    v5->_installmentMerchantIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referrerIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    referrerIdentifier = v5->_referrerIdentifier;
    v5->_referrerIdentifier = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("installmentItems"));
    v21 = objc_claimAutoreleasedReturnValue();
    installmentItems = v5->_installmentItems;
    v5->_installmentItems = (NSArray *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationMetadata"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v23, 0, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      applicationMetadata = v5->_applicationMetadata;
      v5->_applicationMetadata = (NSDictionary *)v24;

    }
    v5->_retailChannel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("retailChannel"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *applicationMetadata;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", self->_feature, CFSTR("feature"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_merchandisingImageData, CFSTR("merchandisingImageData"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_openToBuyThresholdAmount, CFSTR("openToBuyThresholdAmount"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bindingTotalAmount, CFSTR("bindingTotalAmount"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_inStorePurchase, CFSTR("inStorePurchase"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_installmentMerchantIdentifier, CFSTR("installmentMerchantIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_referrerIdentifier, CFSTR("referrerIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_installmentItems, CFSTR("installmentItems"));
  applicationMetadata = self->_applicationMetadata;
  if (applicationMetadata)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", applicationMetadata, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("applicationMetadata"));

  }
  objc_msgSend(v6, "encodeInteger:forKey:", self->_retailChannel, CFSTR("retailChannel"));

}

- (int64_t)feature
{
  return self->_feature;
}

- (void)setFeature:(int64_t)a3
{
  self->_feature = a3;
}

- (NSData)merchandisingImageData
{
  return self->_merchandisingImageData;
}

- (void)setMerchandisingImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDecimalNumber)openToBuyThresholdAmount
{
  return self->_openToBuyThresholdAmount;
}

- (void)setOpenToBuyThresholdAmount:(id)a3
{
  objc_storeStrong((id *)&self->_openToBuyThresholdAmount, a3);
}

- (NSDecimalNumber)bindingTotalAmount
{
  return self->_bindingTotalAmount;
}

- (void)setBindingTotalAmount:(id)a3
{
  objc_storeStrong((id *)&self->_bindingTotalAmount, a3);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isInStorePurchase
{
  return self->_inStorePurchase;
}

- (void)setInStorePurchase:(BOOL)a3
{
  self->_inStorePurchase = a3;
}

- (NSString)installmentMerchantIdentifier
{
  return self->_installmentMerchantIdentifier;
}

- (void)setInstallmentMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)installmentItems
{
  return self->_installmentItems;
}

- (void)setInstallmentItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDictionary)applicationMetadata
{
  return self->_applicationMetadata;
}

- (void)setApplicationMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)retailChannel
{
  return self->_retailChannel;
}

- (void)setRetailChannel:(int64_t)a3
{
  self->_retailChannel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationMetadata, 0);
  objc_storeStrong((id *)&self->_installmentItems, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_installmentMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_bindingTotalAmount, 0);
  objc_storeStrong((id *)&self->_openToBuyThresholdAmount, 0);
  objc_storeStrong((id *)&self->_merchandisingImageData, 0);
}

@end
