@implementation PKWebServiceVirtualCardFeature

- (PKWebServiceVirtualCardFeature)initWithFeatureType:(int64_t)a3 dictionary:(id)a4 region:(id)a5
{
  id v8;
  PKWebServiceVirtualCardFeature *v9;
  uint64_t v10;
  NSString *merchantId;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *networks;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSDictionary *cashVPANNetworks;
  objc_super v24;

  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PKWebServiceVirtualCardFeature;
  v9 = -[PKWebServiceRegionFeature initWithFeatureType:dictionary:region:](&v24, sel_initWithFeatureType_dictionary_region_, a3, v8, a5);
  if (v9)
  {
    objc_msgSend(v8, "PKStringForKey:", CFSTR("walletMerchantId"));
    v10 = objc_claimAutoreleasedReturnValue();
    merchantId = v9->_merchantId;
    v9->_merchantId = (NSString *)v10;

    objc_msgSend(v8, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("implicitFeatureSupportedNetworks"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
      v13 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    objc_storeStrong((id *)&v9->_implicitlySupportedNetworks, v13);
    if (!v12)

    objc_msgSend(v8, "PKDictionaryForKey:", CFSTR("networksMinimumVersion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKWebServiceVirtualCardFeatureNetwork virtualCardFeatureNetworksFromDictionary:](PKWebServiceVirtualCardFeatureNetwork, "virtualCardFeatureNetworksFromDictionary:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    networks = v9->_networks;
    v9->_networks = (NSDictionary *)v16;

    objc_msgSend(v8, "PKDictionaryForKey:", CFSTR("cashVPAN"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "PKDictionaryForKey:", CFSTR("networksMinimumVersion"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKWebServiceVirtualCardFeatureNetwork virtualCardFeatureNetworksFromDictionary:](PKWebServiceVirtualCardFeatureNetwork, "virtualCardFeatureNetworksFromDictionary:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    cashVPANNetworks = v9->_cashVPANNetworks;
    v9->_cashVPANNetworks = (NSDictionary *)v21;

  }
  return v9;
}

+ (id)virtualCardFeatureWithWebService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (!os_variant_has_internal_ui()
    || (objc_msgSend(v3, "targetDevice"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "paymentWebService:supportedRegionFeatureOfType:", v3, 8),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    objc_msgSend(v3, "targetDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paymentWebService:supportedRegionFeatureOfType:", v3, 7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)doesPaymentApplication:(id)a3 supportVPANOnDevice:(id)a4 associatedAccountFeatureIdentifier:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  NSSet *implicitlySupportedNetworks;
  void *v15;
  NSDictionary *networks;
  void *v17;
  NSObject *v18;
  NSDictionary *cashVPANNetworks;
  void *v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  _BOOL4 v24;
  const char *v25;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "supportsVirtualCardNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = v10 != 0;
  if (v10)
  {
    if ((objc_msgSend(v10, "BOOLValue") & 1) == 0)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Not offering VPAN (pass opts-out)", buf, 2u);
      }
      v12 = 0;
      goto LABEL_26;
    }
    v27 = 1;
  }
  else
  {
    v27 = 0;
  }
  v13 = objc_msgSend(v8, "paymentNetworkIdentifier");
  if (a5 == 1
    || (implicitlySupportedNetworks = self->_implicitlySupportedNetworks,
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(implicitlySupportedNetworks) = -[NSSet containsObject:](implicitlySupportedNetworks, "containsObject:", v15), v15, (implicitlySupportedNetworks & 1) == 0))
  {
    networks = self->_networks;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](networks, "objectForKeyedSubscript:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    if (a5 == 1)
    {
      cashVPANNetworks = self->_cashVPANNetworks;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](cashVPANNetworks, "objectForKeyedSubscript:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v18 = v21;
    }
    if (v18)
    {
      if ((-[NSObject isSupportedOnDevice:](v18, "isSupportedOnDevice:", v9) & 1) != 0)
      {
        v22 = -[NSObject implicitlySupported](v18, "implicitlySupported");
        PKLogFacilityTypeGetObject(6uLL);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if (v22)
        {
          if (v24)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, "Offering VPAN (network implicitly supported)", buf, 2u);
          }
          v12 = 1;
        }
        else if (v24)
        {
          *(_DWORD *)buf = 134217984;
          v29 = v27;
          _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, "Offering VPAN if pass supports it: %lu", buf, 0xCu);
        }
        goto LABEL_25;
      }
      PKLogFacilityTypeGetObject(6uLL);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v25 = "Not offering VPAN (doesn't meet version requirement)";
        goto LABEL_23;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v25 = "Not offering VPAN (network not enabled)";
LABEL_23:
        _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, v25, buf, 2u);
      }
    }
    v12 = 0;
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  v12 = 1;
LABEL_27:

  return v12;
}

- (unint64_t)refreshTypeForPaymentApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSDictionary *networks;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v4 = a3;
  objc_msgSend(v4, "virtualCardRefreshTypeNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "virtualCardRefreshTypeNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    networks = self->_networks;
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = objc_msgSend(v4, "paymentNetworkIdentifier");

    objc_msgSend(v8, "numberWithInteger:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](networks, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "refreshType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v12 = 0;
      goto LABEL_5;
    }
  }
  v12 = objc_msgSend(v6, "integerValue");
LABEL_5:

  return v12;
}

- (NSString)merchantId
{
  return self->_merchantId;
}

- (NSSet)implicitlySupportedNetworks
{
  return self->_implicitlySupportedNetworks;
}

- (NSDictionary)networks
{
  return self->_networks;
}

- (void)setNetworks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)cashVPANNetworks
{
  return self->_cashVPANNetworks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cashVPANNetworks, 0);
  objc_storeStrong((id *)&self->_networks, 0);
  objc_storeStrong((id *)&self->_implicitlySupportedNetworks, 0);
  objc_storeStrong((id *)&self->_merchantId, 0);
}

@end
