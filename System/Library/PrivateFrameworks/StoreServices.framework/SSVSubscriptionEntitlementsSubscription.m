@implementation SSVSubscriptionEntitlementsSubscription

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SSVSubscriptionEntitlementsSubscription appAdamId](self, "appAdamId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAppAdamId:", v5);

  -[SSVSubscriptionEntitlementsSubscription appVersion](self, "appVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAppVersion:", v6);

  -[SSVSubscriptionEntitlementsSubscription chargeCountryCode](self, "chargeCountryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setChargeCountryCode:", v7);

  -[SSVSubscriptionEntitlementsSubscription chargeCurrencyCode](self, "chargeCurrencyCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setChargeCurrencyCode:", v8);

  -[SSVSubscriptionEntitlementsSubscription chargeStoreFrontIdentifier](self, "chargeStoreFrontIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setChargeStoreFrontIdentifier:", v9);

  -[SSVSubscriptionEntitlementsSubscription expireDate](self, "expireDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExpireDate:", v10);

  -[SSVSubscriptionEntitlementsSubscription familyId](self, "familyId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFamilyId:", v11);

  -[SSVSubscriptionEntitlementsSubscription inAppAdamId](self, "inAppAdamId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInAppAdamId:", v12);

  -[SSVSubscriptionEntitlementsSubscription inAppVersion](self, "inAppVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInAppVersion:", v13);

  objc_msgSend(v4, "setNewsAppPurchase:", -[SSVSubscriptionEntitlementsSubscription isNewsAppPurchase](self, "isNewsAppPurchase"));
  -[SSVSubscriptionEntitlementsSubscription offerIdentifier](self, "offerIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOfferIdentifier:", v14);

  -[SSVSubscriptionEntitlementsSubscription originalPurchaseDownloadId](self, "originalPurchaseDownloadId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOriginalPurchaseDownloadId:", v15);

  -[SSVSubscriptionEntitlementsSubscription purchasabilityType](self, "purchasabilityType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPurchasabilityType:", v16);

  -[SSVSubscriptionEntitlementsSubscription purchaseDownloadId](self, "purchaseDownloadId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPurchaseDownloadId:", v17);

  -[SSVSubscriptionEntitlementsSubscription quantity](self, "quantity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQuantity:", v18);

  -[SSVSubscriptionEntitlementsSubscription vendorIdentifier](self, "vendorIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVendorIdentifier:", v19);

  return v4;
}

- (SSVSubscriptionEntitlementsSubscription)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSVSubscriptionEntitlementsSubscription *v6;
  uint64_t v8;
  uint64_t v9;
  NSNumber *appAdamId;
  uint64_t v11;
  uint64_t v12;
  NSNumber *appVersion;
  uint64_t v14;
  uint64_t v15;
  NSString *chargeCountryCode;
  uint64_t v17;
  uint64_t v18;
  NSString *chargeCurrencyCode;
  uint64_t v20;
  uint64_t v21;
  NSNumber *chargeStoreFrontIdentifier;
  uint64_t v23;
  uint64_t v24;
  NSDate *expireDate;
  uint64_t v26;
  uint64_t v27;
  NSNumber *familyId;
  uint64_t v29;
  uint64_t v30;
  NSNumber *inAppAdamId;
  uint64_t v32;
  uint64_t v33;
  NSString *inAppVersion;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSString *offerIdentifier;
  uint64_t v40;
  uint64_t v41;
  NSNumber *originalPurchaseDownloadId;
  uint64_t v43;
  uint64_t v44;
  NSNumber *purchasabilityType;
  uint64_t v46;
  uint64_t v47;
  NSNumber *purchaseDownloadId;
  uint64_t v49;
  uint64_t v50;
  NSNumber *quantity;
  uint64_t v52;
  uint64_t v53;
  NSString *vendorIdentifier;
  objc_super v55;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v55.receiver = self;
    v55.super_class = (Class)SSVSubscriptionEntitlementsSubscription;
    v6 = -[SSVSubscriptionEntitlementsSubscription init](&v55, sel_init);
    if (v6)
    {
      v8 = objc_opt_class();
      v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      appAdamId = v6->_appAdamId;
      v6->_appAdamId = (NSNumber *)v9;

      v11 = objc_opt_class();
      v12 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v11);
      appVersion = v6->_appVersion;
      v6->_appVersion = (NSNumber *)v12;

      v14 = objc_opt_class();
      v15 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v14);
      chargeCountryCode = v6->_chargeCountryCode;
      v6->_chargeCountryCode = (NSString *)v15;

      v17 = objc_opt_class();
      v18 = SSXPCDictionaryCopyObjectWithClass(v5, "14", v17);
      chargeCurrencyCode = v6->_chargeCurrencyCode;
      v6->_chargeCurrencyCode = (NSString *)v18;

      v20 = objc_opt_class();
      v21 = SSXPCDictionaryCopyObjectWithClass(v5, "15", v20);
      chargeStoreFrontIdentifier = v6->_chargeStoreFrontIdentifier;
      v6->_chargeStoreFrontIdentifier = (NSNumber *)v21;

      v23 = objc_opt_class();
      v24 = SSXPCDictionaryCopyObjectWithClass(v5, "3", v23);
      expireDate = v6->_expireDate;
      v6->_expireDate = (NSDate *)v24;

      v26 = objc_opt_class();
      v27 = SSXPCDictionaryCopyObjectWithClass(v5, "4", v26);
      familyId = v6->_familyId;
      v6->_familyId = (NSNumber *)v27;

      v29 = objc_opt_class();
      v30 = SSXPCDictionaryCopyObjectWithClass(v5, "5", v29);
      inAppAdamId = v6->_inAppAdamId;
      v6->_inAppAdamId = (NSNumber *)v30;

      v32 = objc_opt_class();
      v33 = SSXPCDictionaryCopyObjectWithClass(v5, "6", v32);
      inAppVersion = v6->_inAppVersion;
      v6->_inAppVersion = (NSString *)v33;

      v35 = objc_opt_class();
      v36 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "13", v35);
      v6->_newsAppPurchase = objc_msgSend(v36, "BOOLValue");

      v37 = objc_opt_class();
      v38 = SSXPCDictionaryCopyObjectWithClass(v5, "7", v37);
      offerIdentifier = v6->_offerIdentifier;
      v6->_offerIdentifier = (NSString *)v38;

      v40 = objc_opt_class();
      v41 = SSXPCDictionaryCopyObjectWithClass(v5, "8", v40);
      originalPurchaseDownloadId = v6->_originalPurchaseDownloadId;
      v6->_originalPurchaseDownloadId = (NSNumber *)v41;

      v43 = objc_opt_class();
      v44 = SSXPCDictionaryCopyObjectWithClass(v5, "9", v43);
      purchasabilityType = v6->_purchasabilityType;
      v6->_purchasabilityType = (NSNumber *)v44;

      v46 = objc_opt_class();
      v47 = SSXPCDictionaryCopyObjectWithClass(v5, "10", v46);
      purchaseDownloadId = v6->_purchaseDownloadId;
      v6->_purchaseDownloadId = (NSNumber *)v47;

      v49 = objc_opt_class();
      v50 = SSXPCDictionaryCopyObjectWithClass(v5, "11", v49);
      quantity = v6->_quantity;
      v6->_quantity = (NSNumber *)v50;

      v52 = objc_opt_class();
      v53 = SSXPCDictionaryCopyObjectWithClass(v5, "12", v52);
      vendorIdentifier = v6->_vendorIdentifier;
      v6->_vendorIdentifier = (NSString *)v53;

    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  void *v4;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_appAdamId);
  SSXPCDictionarySetObject(v3, "1", self->_appVersion);
  SSXPCDictionarySetObject(v3, "2", self->_chargeCountryCode);
  SSXPCDictionarySetObject(v3, "14", self->_chargeCurrencyCode);
  SSXPCDictionarySetObject(v3, "15", self->_chargeStoreFrontIdentifier);
  SSXPCDictionarySetObject(v3, "3", self->_expireDate);
  SSXPCDictionarySetObject(v3, "4", self->_familyId);
  SSXPCDictionarySetObject(v3, "5", self->_inAppAdamId);
  SSXPCDictionarySetObject(v3, "6", self->_inAppVersion);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_newsAppPurchase);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "13", v4);

  SSXPCDictionarySetObject(v3, "7", self->_offerIdentifier);
  SSXPCDictionarySetObject(v3, "8", self->_originalPurchaseDownloadId);
  SSXPCDictionarySetObject(v3, "9", self->_purchasabilityType);
  SSXPCDictionarySetObject(v3, "10", self->_purchaseDownloadId);
  SSXPCDictionarySetObject(v3, "11", self->_quantity);
  SSXPCDictionarySetObject(v3, "12", self->_vendorIdentifier);
  return v3;
}

- (NSNumber)appAdamId
{
  return self->_appAdamId;
}

- (void)setAppAdamId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)chargeCountryCode
{
  return self->_chargeCountryCode;
}

- (void)setChargeCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)chargeCurrencyCode
{
  return self->_chargeCurrencyCode;
}

- (void)setChargeCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)chargeStoreFrontIdentifier
{
  return self->_chargeStoreFrontIdentifier;
}

- (void)setChargeStoreFrontIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)expireDate
{
  return self->_expireDate;
}

- (void)setExpireDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)familyId
{
  return self->_familyId;
}

- (void)setFamilyId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)inAppAdamId
{
  return self->_inAppAdamId;
}

- (void)setInAppAdamId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)inAppVersion
{
  return self->_inAppVersion;
}

- (void)setInAppVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isNewsAppPurchase
{
  return self->_newsAppPurchase;
}

- (void)setNewsAppPurchase:(BOOL)a3
{
  self->_newsAppPurchase = a3;
}

- (NSString)offerIdentifier
{
  return self->_offerIdentifier;
}

- (void)setOfferIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)originalPurchaseDownloadId
{
  return self->_originalPurchaseDownloadId;
}

- (void)setOriginalPurchaseDownloadId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)purchasabilityType
{
  return self->_purchasabilityType;
}

- (void)setPurchasabilityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)purchaseDownloadId
{
  return self->_purchaseDownloadId;
}

- (void)setPurchaseDownloadId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)quantity
{
  return self->_quantity;
}

- (void)setQuantity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)vendorIdentifier
{
  return self->_vendorIdentifier;
}

- (void)setVendorIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorIdentifier, 0);
  objc_storeStrong((id *)&self->_quantity, 0);
  objc_storeStrong((id *)&self->_purchaseDownloadId, 0);
  objc_storeStrong((id *)&self->_purchasabilityType, 0);
  objc_storeStrong((id *)&self->_originalPurchaseDownloadId, 0);
  objc_storeStrong((id *)&self->_offerIdentifier, 0);
  objc_storeStrong((id *)&self->_inAppVersion, 0);
  objc_storeStrong((id *)&self->_inAppAdamId, 0);
  objc_storeStrong((id *)&self->_familyId, 0);
  objc_storeStrong((id *)&self->_expireDate, 0);
  objc_storeStrong((id *)&self->_chargeStoreFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_chargeCurrencyCode, 0);
  objc_storeStrong((id *)&self->_chargeCountryCode, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
}

@end
