@implementation PKPaymentDigitalIssuanceMetadata

- (PKPaymentDigitalIssuanceMetadata)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentDigitalIssuanceMetadata *v5;
  uint64_t v6;
  NSString *serviceProviderIdentifier;
  uint64_t v8;
  NSString *serviceProviderLocalizedDisplayName;
  uint64_t v10;
  NSString *serviceProviderCountryCode;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *serviceProviderAcceptedNetworks;
  uint64_t v16;
  NSArray *serviceProviderCapabilities;
  uint64_t v18;
  NSDictionary *serviceProviderDict;
  uint64_t v20;
  NSString *action;
  uint64_t v22;
  NSString *merchantID;
  uint64_t v24;
  NSArray *defaultSuggestions;
  void *v26;
  void *v27;
  uint64_t v28;
  NSString *balanceIdentifier;
  PKDigitalIssuanceServiceProviderProduct *v30;
  PKDigitalIssuanceServiceProviderProduct *autoTopUpProduct;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  PKDigitalIssuanceServiceProviderProduct *v39;
  uint64_t v40;
  NSArray *serviceProviderProducts;
  void *v42;
  uint64_t v43;
  NSString *balanceLocalizedDisplayName;
  uint64_t v45;
  NSString *balanceLocalizedDescription;
  void *v47;
  uint64_t v48;
  NSString *serviceProviderProductsLocalizedDisplayName;
  uint64_t v50;
  NSString *serviceProviderProductsLocalizedDescription;
  void *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_super v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)PKPaymentDigitalIssuanceMetadata;
  v5 = -[PKPaymentDigitalIssuanceMetadata init](&v60, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("serviceProviderIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    serviceProviderIdentifier = v5->_serviceProviderIdentifier;
    v5->_serviceProviderIdentifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("serviceProviderLocalizedDisplayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    serviceProviderLocalizedDisplayName = v5->_serviceProviderLocalizedDisplayName;
    v5->_serviceProviderLocalizedDisplayName = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("serviceProviderCountryCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    serviceProviderCountryCode = v5->_serviceProviderCountryCode;
    v5->_serviceProviderCountryCode = (NSString *)v10;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("serviceProviderAcceptedNetworks"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("serviceProviderSupportedNetworks"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[PKServiceProviderPaymentRequest availableNetworks](PKServiceProviderPaymentRequest, "availableNetworks");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v12;
    objc_msgSend(v12, "pk_intersectArray:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    serviceProviderAcceptedNetworks = v5->_serviceProviderAcceptedNetworks;
    v5->_serviceProviderAcceptedNetworks = (NSArray *)v14;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("serviceProviderCapabilities"));
    v16 = objc_claimAutoreleasedReturnValue();
    serviceProviderCapabilities = v5->_serviceProviderCapabilities;
    v5->_serviceProviderCapabilities = (NSArray *)v16;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("serviceProviderData"));
    v18 = objc_claimAutoreleasedReturnValue();
    serviceProviderDict = v5->_serviceProviderDict;
    v5->_serviceProviderDict = (NSDictionary *)v18;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("action"));
    v20 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (NSString *)v20;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantId"));
    v22 = objc_claimAutoreleasedReturnValue();
    merchantID = v5->_merchantID;
    v5->_merchantID = (NSString *)v22;

    objc_msgSend(v4, "PKArrayForKey:", CFSTR("defaultSuggestions"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "pk_arrayByApplyingBlock:", &__block_literal_global_10);
    v24 = objc_claimAutoreleasedReturnValue();
    defaultSuggestions = v5->_defaultSuggestions;
    v5->_defaultSuggestions = (NSArray *)v24;

    objc_msgSend(v4, "PKSetForKey:", CFSTR("serviceProviderSupportedCountries"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "count"))
      v27 = v26;
    else
      v27 = 0;
    objc_storeStrong((id *)&v5->_serviceProviderSupportedCountries, v27);
    objc_msgSend(v4, "PKStringForKey:", CFSTR("balanceIdentifier"));
    v28 = objc_claimAutoreleasedReturnValue();
    balanceIdentifier = v5->_balanceIdentifier;
    v5->_balanceIdentifier = (NSString *)v28;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("autoTopUpMetaData"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[PKDigitalIssuanceServiceProviderProduct initWithDictionary:]([PKDigitalIssuanceServiceProviderProduct alloc], "initWithDictionary:", v53);
    autoTopUpProduct = v5->_autoTopUpProduct;
    v5->_autoTopUpProduct = v30;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("serviceProviderProducts"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v34 = v32;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v57;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v57 != v37)
            objc_enumerationMutation(v34);
          v39 = -[PKDigitalIssuanceServiceProviderProduct initWithDictionary:]([PKDigitalIssuanceServiceProviderProduct alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v38));
          objc_msgSend(v33, "safelyAddObject:", v39);

          ++v38;
        }
        while (v36 != v38);
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v36);
    }

    v40 = objc_msgSend(v33, "copy");
    serviceProviderProducts = v5->_serviceProviderProducts;
    v5->_serviceProviderProducts = (NSArray *)v40;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("balanceMetaData"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("localizedDisplayName"));
    v43 = objc_claimAutoreleasedReturnValue();
    balanceLocalizedDisplayName = v5->_balanceLocalizedDisplayName;
    v5->_balanceLocalizedDisplayName = (NSString *)v43;

    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("localizedDescription"));
    v45 = objc_claimAutoreleasedReturnValue();
    balanceLocalizedDescription = v5->_balanceLocalizedDescription;
    v5->_balanceLocalizedDescription = (NSString *)v45;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("serviceProviderProductsMetaData"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("localizedDisplayName"));
    v48 = objc_claimAutoreleasedReturnValue();
    serviceProviderProductsLocalizedDisplayName = v5->_serviceProviderProductsLocalizedDisplayName;
    v5->_serviceProviderProductsLocalizedDisplayName = (NSString *)v48;

    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("localizedDescription"));
    v50 = objc_claimAutoreleasedReturnValue();
    serviceProviderProductsLocalizedDescription = v5->_serviceProviderProductsLocalizedDescription;
    v5->_serviceProviderProductsLocalizedDescription = (NSString *)v50;

    v5->_purchaseBased = objc_msgSend(v4, "PKBoolForKey:", CFSTR("isPurchaseBased"));
  }

  return v5;
}

uint64_t __55__PKPaymentDigitalIssuanceMetadata_initWithDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", a2);
}

- (NSArray)serviceProviderSupportedNetworks
{
  return self->_serviceProviderAcceptedNetworks;
}

- (NSString)serviceProviderIdentifier
{
  return self->_serviceProviderIdentifier;
}

- (NSString)serviceProviderLocalizedDisplayName
{
  return self->_serviceProviderLocalizedDisplayName;
}

- (NSString)serviceProviderCountryCode
{
  return self->_serviceProviderCountryCode;
}

- (NSArray)serviceProviderAcceptedNetworks
{
  return self->_serviceProviderAcceptedNetworks;
}

- (NSArray)serviceProviderCapabilities
{
  return self->_serviceProviderCapabilities;
}

- (NSDictionary)serviceProviderDict
{
  return self->_serviceProviderDict;
}

- (NSString)action
{
  return self->_action;
}

- (NSString)merchantID
{
  return self->_merchantID;
}

- (NSArray)defaultSuggestions
{
  return self->_defaultSuggestions;
}

- (NSSet)serviceProviderSupportedCountries
{
  return self->_serviceProviderSupportedCountries;
}

- (NSString)balanceIdentifier
{
  return self->_balanceIdentifier;
}

- (NSString)balanceLocalizedDisplayName
{
  return self->_balanceLocalizedDisplayName;
}

- (NSString)balanceLocalizedDescription
{
  return self->_balanceLocalizedDescription;
}

- (NSString)serviceProviderProductsLocalizedDisplayName
{
  return self->_serviceProviderProductsLocalizedDisplayName;
}

- (NSString)serviceProviderProductsLocalizedDescription
{
  return self->_serviceProviderProductsLocalizedDescription;
}

- (PKDigitalIssuanceServiceProviderProduct)autoTopUpProduct
{
  return self->_autoTopUpProduct;
}

- (NSArray)serviceProviderProducts
{
  return self->_serviceProviderProducts;
}

- (BOOL)isPurchaseBased
{
  return self->_purchaseBased;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderProducts, 0);
  objc_storeStrong((id *)&self->_autoTopUpProduct, 0);
  objc_storeStrong((id *)&self->_serviceProviderProductsLocalizedDescription, 0);
  objc_storeStrong((id *)&self->_serviceProviderProductsLocalizedDisplayName, 0);
  objc_storeStrong((id *)&self->_balanceLocalizedDescription, 0);
  objc_storeStrong((id *)&self->_balanceLocalizedDisplayName, 0);
  objc_storeStrong((id *)&self->_balanceIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceProviderSupportedCountries, 0);
  objc_storeStrong((id *)&self->_defaultSuggestions, 0);
  objc_storeStrong((id *)&self->_merchantID, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_serviceProviderDict, 0);
  objc_storeStrong((id *)&self->_serviceProviderCapabilities, 0);
  objc_storeStrong((id *)&self->_serviceProviderAcceptedNetworks, 0);
  objc_storeStrong((id *)&self->_serviceProviderCountryCode, 0);
  objc_storeStrong((id *)&self->_serviceProviderLocalizedDisplayName, 0);
  objc_storeStrong((id *)&self->_serviceProviderIdentifier, 0);
}

@end
