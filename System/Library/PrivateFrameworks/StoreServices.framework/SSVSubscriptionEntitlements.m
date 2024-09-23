@implementation SSVSubscriptionEntitlements

+ (id)_parseJSONDictionary:(id)a3
{
  id v4;
  SSVSubscriptionEntitlements *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  SSVSubscriptionEntitlementsSubscription *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  SSVSubscriptionEntitlements *v38;
  uint64_t v39;
  uint64_t v40;
  id obj;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(SSVSubscriptionEntitlements);
  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("user"), v4, objc_opt_class());
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("ISO3Country"), v6, objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVSubscriptionEntitlements setAccountISO3Country:](v5, "setAccountISO3Country:");
  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("dsId"), v6, objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVSubscriptionEntitlements setAccountIdentifier:](v5, "setAccountIdentifier:");
  v36 = (void *)v6;
  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("storeFrontId"), v6, objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVSubscriptionEntitlements setAccountStoreFrontIdentifier:](v5, "setAccountStoreFrontIdentifier:");
  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("cacheTimestamp"), v4, objc_opt_class());
  v38 = v5;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVSubscriptionEntitlements setCachedTimestamp:](v5, "setCachedTimestamp:");
  v37 = v4;
  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("subscriptions"), v4, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v63;
    v39 = *(_QWORD *)v63;
    do
    {
      v11 = 0;
      v40 = v9;
      do
      {
        if (*(_QWORD *)v63 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v43 = v11;
          v13 = v12;
          objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("appAdamId"), v13, objc_opt_class());
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v13;
          objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("inAppSubscriptions"), v13, objc_opt_class());
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v48 = v14;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v59;
            v45 = *(_QWORD *)v59;
            do
            {
              v18 = 0;
              v47 = v16;
              do
              {
                if (*(_QWORD *)v59 != v17)
                  objc_enumerationMutation(v48);
                v19 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v18);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v20 = v19;
                  v21 = objc_alloc_init(SSVSubscriptionEntitlementsSubscription);
                  -[SSVSubscriptionEntitlementsSubscription setAppAdamId:](v21, "setAppAdamId:", v46);
                  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("appVersion"), v20, objc_opt_class());
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSVSubscriptionEntitlementsSubscription setAppVersion:](v21, "setAppVersion:");
                  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("chargeCountryCode"), v20, objc_opt_class());
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSVSubscriptionEntitlementsSubscription setChargeCountryCode:](v21, "setChargeCountryCode:");
                  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("chargeCurrencyCode"), v20, objc_opt_class());
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSVSubscriptionEntitlementsSubscription setChargeCurrencyCode:](v21, "setChargeCurrencyCode:");
                  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("chargeStoreFrontId"), v20, objc_opt_class());
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSVSubscriptionEntitlementsSubscription setChargeStoreFrontIdentifier:](v21, "setChargeStoreFrontIdentifier:");
                  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("expireDate"), v20, objc_opt_class());
                  v22 = objc_claimAutoreleasedReturnValue();
                  if (v22)
                  {
                    v23 = objc_alloc_init(MEMORY[0x1E0CB3578]);
                    objc_msgSend(v23, "setDateFormat:", CFSTR("EEE MMM dd HH:mm:ss z yyyy"));
                    objc_msgSend(v23, "dateFromString:", v22);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v24)
                      -[SSVSubscriptionEntitlementsSubscription setExpireDate:](v21, "setExpireDate:", v24);

                  }
                  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("familyId"), v20, objc_opt_class());
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSVSubscriptionEntitlementsSubscription setFamilyId:](v21, "setFamilyId:", v53);
                  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("inAppAdamId"), v20, objc_opt_class());
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSVSubscriptionEntitlementsSubscription setInAppAdamId:](v21, "setInAppAdamId:", v52);
                  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("inAppVersion"), v20, objc_opt_class());
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSVSubscriptionEntitlementsSubscription setInAppVersion:](v21, "setInAppVersion:", v51);
                  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("isNewsAppPurchase"), v20, objc_opt_class());
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSVSubscriptionEntitlementsSubscription setNewsAppPurchase:](v21, "setNewsAppPurchase:", objc_msgSend(v50, "BOOLValue"));
                  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("offerIdentifier"), v20, objc_opt_class());
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSVSubscriptionEntitlementsSubscription setOfferIdentifier:](v21, "setOfferIdentifier:", v25);
                  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("originalPurchaseDownloadId"), v20, objc_opt_class());
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSVSubscriptionEntitlementsSubscription setOriginalPurchaseDownloadId:](v21, "setOriginalPurchaseDownloadId:", v26);
                  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("purchasabilityType"), v20, objc_opt_class());
                  v49 = (void *)v22;
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSVSubscriptionEntitlementsSubscription setPurchasabilityType:](v21, "setPurchasabilityType:", v27);
                  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("purchaseDownloadId"), v20, objc_opt_class());
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSVSubscriptionEntitlementsSubscription setPurchaseDownloadId:](v21, "setPurchaseDownloadId:", v28);
                  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("quantity"), v20, objc_opt_class());
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSVSubscriptionEntitlementsSubscription setQuantity:](v21, "setQuantity:", v29);
                  objc_msgSend(a1, "_valueForKey:fromDictionary:ofType:", CFSTR("vendorIdentifier"), v20, objc_opt_class());
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSVSubscriptionEntitlementsSubscription setVendorIdentifier:](v21, "setVendorIdentifier:", v30);
                  objc_msgSend(v44, "addObject:", v21);

                  v17 = v45;
                  v16 = v47;
                }
                ++v18;
              }
              while (v16 != v18);
              v16 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
            }
            while (v16);
          }

          v10 = v39;
          v9 = v40;
          v11 = v43;
        }
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    }
    while (v9);
  }

  -[SSVSubscriptionEntitlements setEntitledSubscriptions:](v38, "setEntitledSubscriptions:", v44);
  return v38;
}

+ (id)_valueForKey:(id)a3 fromDictionary:(id)a4 ofType:(Class)a5
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a4, "valueForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SSVSubscriptionEntitlements accountIdentifier](self, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccountIdentifier:", v5);

  -[SSVSubscriptionEntitlements accountStoreFrontIdentifier](self, "accountStoreFrontIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccountStoreFrontIdentifier:", v6);

  -[SSVSubscriptionEntitlements accountISO3Country](self, "accountISO3Country");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccountISO3Country:", v7);

  -[SSVSubscriptionEntitlements cachedTimestamp](self, "cachedTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCachedTimestamp:", v8);

  -[SSVSubscriptionEntitlements entitledSubscriptions](self, "entitledSubscriptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEntitledSubscriptions:", v9);

  return v4;
}

- (SSVSubscriptionEntitlements)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSVSubscriptionEntitlements *v6;
  uint64_t v8;
  uint64_t v9;
  NSNumber *accountIdentifier;
  uint64_t v11;
  uint64_t v12;
  NSNumber *accountStoreFrontIdentifier;
  uint64_t v14;
  uint64_t v15;
  NSString *accountISO3Country;
  uint64_t v17;
  uint64_t v18;
  NSDate *cachedTimestamp;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  NSArray *entitledSubscriptions;
  objc_super v25;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v25.receiver = self;
    v25.super_class = (Class)SSVSubscriptionEntitlements;
    v6 = -[SSVSubscriptionEntitlements init](&v25, sel_init);
    if (v6)
    {
      v8 = objc_opt_class();
      v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      accountIdentifier = v6->_accountIdentifier;
      v6->_accountIdentifier = (NSNumber *)v9;

      v11 = objc_opt_class();
      v12 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v11);
      accountStoreFrontIdentifier = v6->_accountStoreFrontIdentifier;
      v6->_accountStoreFrontIdentifier = (NSNumber *)v12;

      v14 = objc_opt_class();
      v15 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v14);
      accountISO3Country = v6->_accountISO3Country;
      v6->_accountISO3Country = (NSString *)v15;

      v17 = objc_opt_class();
      v18 = SSXPCDictionaryCopyObjectWithClass(v5, "4", v17);
      cachedTimestamp = v6->_cachedTimestamp;
      v6->_cachedTimestamp = (NSDate *)v18;

      xpc_dictionary_get_value(v5, "3");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_opt_class();
      v22 = SSXPCCreateNSArrayFromXPCEncodedArray(v20, v21);
      v23 = objc_msgSend(v22, "copy");
      entitledSubscriptions = v6->_entitledSubscriptions;
      v6->_entitledSubscriptions = (NSArray *)v23;

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

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_accountIdentifier);
  SSXPCDictionarySetObject(v3, "1", self->_accountStoreFrontIdentifier);
  SSXPCDictionarySetObject(v3, "2", self->_accountISO3Country);
  SSXPCDictionarySetObject(v3, "4", self->_cachedTimestamp);
  SSXPCDictionarySetObject(v3, "3", self->_entitledSubscriptions);
  return v3;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)accountStoreFrontIdentifier
{
  return self->_accountStoreFrontIdentifier;
}

- (void)setAccountStoreFrontIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)accountISO3Country
{
  return self->_accountISO3Country;
}

- (void)setAccountISO3Country:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)entitledSubscriptions
{
  return self->_entitledSubscriptions;
}

- (void)setEntitledSubscriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)cachedTimestamp
{
  return self->_cachedTimestamp;
}

- (void)setCachedTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTimestamp, 0);
  objc_storeStrong((id *)&self->_entitledSubscriptions, 0);
  objc_storeStrong((id *)&self->_accountISO3Country, 0);
  objc_storeStrong((id *)&self->_accountStoreFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
